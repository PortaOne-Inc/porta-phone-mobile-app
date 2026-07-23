/**
 * Minimal fake of the firestore surface the transactional write paths use:
 * collection(...).doc(...) refs plus runTransaction with tx.get/tx.set,
 * backed by a plain Map keyed as `${collection}/${id}`.
 *
 * Pair it with `jest.mock('firebase-admin', () => ({ firestore: jest.fn() }))`
 * and `(admin.firestore as jest.Mock).mockReturnValue(createFakeFirestore(store))`.
 */
export type FakeFirestoreStore = Map<string, unknown>;

export const storeKey = (collection: string, id: string) =>
  `${collection}/${id}`;

export const createFakeFirestore = (store: FakeFirestoreStore) => ({
  collection: (name: string) => ({
    doc: (id: string) => ({ __key: storeKey(name, id) }),
  }),
  runTransaction: async (fn: (tx: unknown) => Promise<unknown>) =>
    fn({
      get: async (ref: { __key: string }) => {
        const data = store.get(ref.__key);
        return {
          exists: data !== undefined,
          data: () => structuredClone(data),
        };
      },
      set: (ref: { __key: string }, value: unknown) => {
        store.set(ref.__key, structuredClone(value));
      },
    }),
});
