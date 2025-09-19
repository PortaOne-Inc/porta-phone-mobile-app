import { z } from 'zod';

export const CapabilitiesZ = z.record(z.boolean());

export const UpdateCapabilitiesZ = z.object({
  capabilities: CapabilitiesZ,
  expectedVersion: z.number().int().nonnegative().optional(),
  updatedFrom: z.enum(['ui', 'api', 'ci']).default('ui').optional(),
});

export type UpdateCapabilitiesDto = z.infer<typeof UpdateCapabilitiesZ>;
