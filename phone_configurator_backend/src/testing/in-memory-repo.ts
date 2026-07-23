/**
 * Minimal in-memory stand-in for fireorm's BaseFirestoreRepository, covering
 * the subset of the API the services use: findById, create, update, delete
 * and whereEqualTo(...).whereEqualTo(...).find() chains.
 *
 * Mirrors fireorm semantics the services rely on:
 * - findById resolves to null for a missing document (does not reject);
 * - create with an explicit id writes under that id;
 * - all reads/writes return clones so tests cannot mutate stored state.
 */
type Filter = { prop: string; val: unknown };

type Query<T> = {
  whereEqualTo(prop: keyof T | string, val: unknown): Query<T>;
  find(): Promise<T[]>;
};

export class InMemoryRepo<T extends { id: string }> {
  private seq = 0;
  readonly docs = new Map<string, T>();

  seed(...items: T[]): void {
    items.forEach((item) => this.docs.set(item.id, structuredClone(item)));
  }

  async findById(id: string): Promise<T | null> {
    const doc = this.docs.get(id);
    return doc ? structuredClone(doc) : null;
  }

  async create(item: Partial<T>): Promise<T> {
    const id = (item as T).id ?? `generated-${++this.seq}`;
    const stored = structuredClone({ ...(item as T), id });
    this.docs.set(id, stored);
    return structuredClone(stored);
  }

  async update(item: T): Promise<T> {
    if (!this.docs.has(item.id)) {
      throw new Error(`InMemoryRepo.update: ${item.id} not found`);
    }
    this.docs.set(item.id, structuredClone(item));
    return structuredClone(item);
  }

  async delete(id: string): Promise<void> {
    this.docs.delete(id);
  }

  whereEqualTo(prop: keyof T | string, val: unknown): Query<T> {
    return this.buildQuery([{ prop: prop as string, val }]);
  }

  private buildQuery(filters: Filter[]): Query<T> {
    return {
      whereEqualTo: (prop, val) =>
        this.buildQuery([...filters, { prop: prop as string, val }]),
      find: async () =>
        [...this.docs.values()]
          .filter((doc) =>
            filters.every(
              (f) => (doc as Record<string, unknown>)[f.prop] === f.val,
            ),
          )
          .map((doc) => structuredClone(doc)),
    };
  }
}
