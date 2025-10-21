export async function findByIdSafe<T>(
    repo: { findById(id: string): Promise<T> },
    id: string,
): Promise<T | null> {
    try {
        return await repo.findById(id);
    } catch {
        return null;
    }
}
