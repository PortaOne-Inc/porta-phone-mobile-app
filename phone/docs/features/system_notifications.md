# System notifications

Announcements the operator sends to the app: a list, an unread badge, and a
local push when one arrives. This page is about how that data moves - what
keeps it up to date, and what happens the moment the user touches it.

Last reviewed: 2026-09-11.

The scheduler these workers run on is documented in
[`../polling.md`](../polling.md); the worker/owner pattern itself in
[`../polling_workers.md`](../polling_workers.md). This page covers only what is
specific to the feature.

## The two directions

The feature has two halves, and they are separate polling tasks on purpose:

| Direction | Worker | Owner | One cycle |
|---|---|---|---|
| server -> device | `SystemNotificationsSyncWorker` | `SystemNotificationsSync` | fetch the initial history, or every update since the local anchor |
| device -> server | `SystemNotificationsOutboxWorker` | `SystemNotificationsOutbox` | send every queued read receipt |

Both live in `lib/features/system_notifications/services/`, both are registered
in `lib/app/router/main_shell_services.dart` behind the same gate
(`featureAccess.systemNotificationsConfig.systemNotificationsSupport`), and a
deployment without the feature registers neither.

Two other pieces are not polling tasks and are unaffected by any of this:
`SystemNotificationsPushService` (turns a stored notification into a local
push) and `SystemNotificationBackgroundWorker` (a Workmanager task that syncs
while the app is not running). Both are still started by
`SystemNotificationsShell`.

## PollingService responsibilities

Neither worker owns a timer, a connectivity check, or a retry policy. That is
the point of the pattern: a worker knows how to do the work once and how to
report whether it succeeded, and `PollingService` decides when. The feature
gets all of the following without implementing any of it.

- **Nothing runs in the background.** Both tasks stop when the app is not in
  the foreground and resume with a leading refresh.
- **Nothing runs offline.** A cycle starts only once a reachability check
  passes, and that answer is shared and cached
  (`WEBTRIT_APP_POLLING_REACHABILITY_TTL_SECONDS`, 30 s) rather than probed per
  task.
- **A failing backend is backed off.** A cycle that throws moves the task to
  `PollingTaskPhase.failed` and delays the next attempt - 600 s, then 900 s,
  then every 900 s (`WEBTRIT_APP_POLLING_MAX_BACKOFF_SECONDS`). A success
  resets it.
- **Devices do not sync in lockstep.** Every delay carries up to 10 percent of
  random jitter.
- **Reconnecting and returning to the app refresh both tasks**, subject to a
  freshness gate so a flapping network does not re-run everything.

Intervals:

| Task | Default | Key |
|---|---:|---|
| sync | 10 s | `WEBTRIT_APP_SYSTEM_NOTIFICATIONS_POLLING_INTERVAL_SECONDS` |
| outbox | 300 s | `WEBTRIT_APP_SYSTEM_NOTIFICATIONS_OUTBOX_POLLING_INTERVAL_SECONDS` |

The outbox interval is long because the interval is not how receipts are
normally sent - see the next section.

## On-demand flush

Reading a notification is the one thing here the scheduler cannot predict, and
it is handled the way every on-demand refresh in this app is handled: not by
calling the backend from the screen, but by asking the task that already owns
that work.

```
user taps a notification
  -> SystemNotificationsScreenCubit.markAsSeen()
     1. writes an outbox row (pending) to SQLite      <- durable, offline-safe
     2. SystemNotificationsOutbox.requestFlush()      <- asks the task to run
  -> the task runs one cycle and sends the queue
  -> the server later reports the notification as seen
  -> the sync worker brings that back, and the row is deleted
```

The order matters and is tested: the row is written *before* the send is asked
for, so the receipt survives a failed send, a lost connection, and the app
being killed. Asking for the send is an optimisation on top of a fact that is
already on disk.

`requestFlush()` is `invalidatePollingTask()` underneath, the same mechanism
behind `CdrsSync.requestPostCallRefresh()`. Three of its properties are
deliberate.

- **It is debounced by one second.** Reading through a screenful of
  notifications is one cycle, not one per tap: `PollingService` cancels and
  restarts the pending invalidation, so a burst collapses onto its trailing
  edge.
- **It may jump the queue, but not past a refusing backend.** A flush normally
  runs the cycle even though the next scheduled run is minutes away - that is
  what it is for. But a cycle attempts *the whole queue*, so once sends are
  failing, one flush per tap would be one request per tap per queued entry at a
  backend that is already failing. A flush requested while the task is
  `PollingTaskPhase.failed` is therefore dropped; the retry the task has
  already scheduled is the right moment.
- **Being offline is not that case.** The task then reports
  `waitingForConnectivity`, the service defers the cycle without making a
  request at all, and the queue leaves on the leading refresh that reconnecting
  runs. Tapping while offline costs one local row and nothing else.

## Receipt retry policy

An outbox row is retried for as long as polling is willing to retry it. Nothing
counts attempts, and a failed send leaves its row untouched.

This replaced a five-attempt cap, and the reason is worth keeping. Attempts are
a meaningful budget only if something paces them. In the loop this feature used
to run, one attempt per second spent all five in about six seconds - a lift ride
was enough to abandon a receipt permanently, and `SnOutboxState.failed` is never
read again, so the notification stayed unread on the user's other devices
forever. A count is the wrong unit even with a slower loop, because a cycle can
be triggered by anything: a tap on an unrelated notification would spend the
attempts of an entry that is failing. Pacing and giving up belong to the
scheduler, which does both.

The queue is emptied by success instead. A row is deleted when the sync worker
brings its notification back with `seen` set - including when another device
sent the receipt. The cost is that a genuinely impossible send (a notification
the backend has deleted, say) is retried forever at the backoff ceiling; new
receipts are unaffected, because a cycle attempts every entry before it reports
the failure.

## Two properties of the sync cycle

Both follow from the shape of the endpoints rather than from the pattern.

**One branch per cycle.** With no local anchor the cycle fetches the initial
history; with one, it drains updates since that anchor. Never both, so a first
load after a wipe stays one bounded request.

**The anchor advances by timestamp.** `getUpdates` pages by `since`, not by page
number. The anchor therefore moves to the newest record of each full page, and a
full page that cannot move it ends the cycle rather than being fetched forever;
the store now holds those records, so the next cycle resumes from its own
advanced anchor.

Separately, an absent anchor is what marks a load as history, which suppresses
one local push per record. A worker that counted "have I synced yet" in memory
would push a whole first load at the user whenever it was rebuilt, so the flag
is set only after a cycle completes - including an empty one, or the first
genuine notification on a new account would be silently swallowed.

## Layout

| Path | Contents |
|---|---|
| `lib/features/system_notifications/services/system_notifications_sync_worker.dart` | sync worker + owner |
| `lib/features/system_notifications/services/system_notifications_outbox_worker.dart` | outbox worker + owner |
| `lib/features/system_notifications/services/system_notifications_push_service.dart` | local push from a stored notification |
| `lib/features/system_notifications/services/system_notifications_background_worker.dart` | Workmanager sync outside the app |
| `lib/features/system_notifications/widgets/system_notifications_shell.dart` | starts the push service and the background task |
| `lib/features/system_notifications/cubit/` | screen and badge cubits |
| `lib/repositories/system_notifications/` | local (Drift) and remote (API) repositories |

Tests: `test/features/system_notifications/` - a worker suite per direction, a
push suite, and seven component scenarios shared between the host and Patrol
(`patrol_test/system_notifications_sync_test.dart`) over a real Drift store. The
registrations themselves are asserted in
`test/app/router/main_shell_polling_config_test.dart`.
