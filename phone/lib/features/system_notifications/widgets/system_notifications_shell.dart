import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_phone/app/router/app_router.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:webtrit_phone/features/features.dart';
import 'package:webtrit_phone/repositories/repositories.dart';

class SystemNotificationsShell extends StatefulWidget {
  const SystemNotificationsShell({required this.child, super.key});

  final Widget child;

  @override
  State<SystemNotificationsShell> createState() => _SystemNotificationsShellState();
}

class _SystemNotificationsShellState extends State<SystemNotificationsShell> {
  late final localRepository = context.read<SystemNotificationsLocalRepository>();
  late final remoteRepository = context.read<SystemNotificationsRemoteRepository>();
  late final remotePushRepository = context.read<RemotePushRepository>();
  late final localPushRepository = context.read<LocalPushRepository>();

  late final featureAccess = context.read<FeatureAccess>();
  late final feature = featureAccess.systemNotificationsConfig;

  SystemNotificationsPushService? pushService;

  @override
  void initState() {
    super.initState();

    /// Start feature watcher
    Future.doWhile(() async {
      if (!mounted) return false;
      upsertServices();
      return await Future.delayed(const Duration(seconds: 1), () => true);
    });
  }

  /// Actively checks the system notificaitons feature flags
  /// and init or dispose them on the fly accordingly to configuration
  void upsertServices() {
    final featureEnabled = feature.systemNotificationsSupport;
    final pushSupported = feature.systemNotificationsPushSupport;

    if (featureEnabled == true) {
      pushService ??= SystemNotificationsPushService(
        remotePushRepository,
        localPushRepository,
        localRepository,
        openNotifications: openNotificationsScreen,
        producePush: pushSupported == false,
      )..init();

      if (pushSupported == false) SystemNotificationBackgroundWorker.dispatchTask();
    }

    if (featureEnabled == false) {
      pushService?.dispose();
      pushService = null;

      SystemNotificationBackgroundWorker.cancelTask();
    }
  }

  void openNotificationsScreen() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!mounted) return;
    context.router.navigate(const SystemNotificationsPageRoute());
  }

  @override
  void dispose() {
    pushService?.dispose();
    SystemNotificationBackgroundWorker.cancelTask();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
