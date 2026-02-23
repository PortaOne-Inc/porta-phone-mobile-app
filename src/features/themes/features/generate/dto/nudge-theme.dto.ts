import { z } from 'zod';
import { createZodDto } from 'nestjs-zod';

export const NudgeThemeSchema = z
  .object({
    prompt: z.string().min(1).max(5000).trim(),
    targets: z
      .array(z.enum(['colorScheme', 'widgetConfig', 'pageConfig']))
      .min(1)
      .optional(),
    variant: z.enum(['light', 'dark']).optional().default('light'),
    mode: z.enum(['patch', 'replace']).optional().default('patch'),
    seedColorHint: z
      .string()
      .regex(/^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/)
      .nullable()
      .optional(),
  })
  .strict();

export type NudgeTarget = z.infer<typeof NudgeThemeSchema>['targets'] extends
  | (infer T)[]
  | undefined
  ? T
  : never;
export type NudgeMode = z.infer<typeof NudgeThemeSchema>['mode'];

export class NudgeThemeDto extends createZodDto(NudgeThemeSchema) {}
