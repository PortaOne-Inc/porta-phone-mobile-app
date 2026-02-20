import { z } from 'zod';
import { HexOpt } from './color-scheme.schema';

const FontWeightSchema = z.object({ weight: z.number() }).optional().nullable();

const TextStyleSchema = z
    .object({
        fontFamily: z.string().optional().nullable(),
        fontSize: z.number().optional().nullable(),
        fontWeight: FontWeightSchema,
        color: z.string().optional().nullable(),
        fontFeatures: z.array(z.string()).optional().nullable(),
    })
    .optional()
    .nullable();

const IconConfigSchema = z
    .object({
        codePoint: z.string().optional().nullable(),
        fontFamily: z.string().optional().nullable(),
        matchTextDirection: z.boolean().optional().nullable(),
    })
    .optional()
    .nullable();

export const WidgetConfigSchema = z
    .object({
        fonts: z
            .object({
                fontFamily: z.string().optional().nullable(),
            })
            .optional()
            .nullable(),

        button: z
            .object({
                primaryElevatedButton: z
                    .object({
                        backgroundColor: HexOpt,
                        foregroundColor: HexOpt,
                        disabledBackgroundColor: HexOpt,
                        disabledForegroundColor: HexOpt,
                    })
                    .optional()
                    .nullable(),
            })
            .optional()
            .nullable(),

        imageAssets: z
            .object({
                primaryOnboardingLogo: z
                    .object({
                        uri: z.string().optional().nullable(),
                        widthFactor: z.number().optional().nullable(),
                    })
                    .optional()
                    .nullable(),
                secondaryOnboardingLogo: z
                    .object({
                        uri: z.string().optional().nullable(),
                        widthFactor: z.number().optional().nullable(),
                    })
                    .optional()
                    .nullable(),
                leadingAvatarStyle: z
                    .object({
                        backgroundColor: HexOpt,
                        radius: z.number().optional().nullable(),
                        initialsTextStyle: TextStyleSchema,
                        placeholderIcon: IconConfigSchema,
                        loading: z
                            .object({
                                showByDefault: z.boolean().optional().nullable(),
                                padding: z
                                    .object({
                                        left: z.number().optional().nullable(),
                                        top: z.number().optional().nullable(),
                                        right: z.number().optional().nullable(),
                                        bottom: z.number().optional().nullable(),
                                    })
                                    .optional()
                                    .nullable(),
                                strokeWidth: z.number().optional().nullable(),
                            })
                            .optional()
                            .nullable(),
                        smartIndicator: z
                            .object({
                                backgroundColor: HexOpt,
                                icon: IconConfigSchema,
                                sizeFactor: z.number().optional().nullable(),
                            })
                            .optional()
                            .nullable(),
                        registeredBadge: z
                            .object({
                                registeredColor: HexOpt,
                                unregisteredColor: HexOpt,
                                sizeFactor: z.number().optional().nullable(),
                            })
                            .optional()
                            .nullable(),
                    })
                    .optional()
                    .nullable(),
            })
            .optional()
            .nullable(),

        dialog: z
            .object({
                snackBar: z
                    .object({
                        successBackgroundColor: HexOpt,
                        errorBackgroundColor: HexOpt,
                        infoBackgroundColor: HexOpt,
                        warningBackgroundColor: HexOpt,
                    })
                    .optional()
                    .nullable(),
            })
            .optional()
            .nullable(),

        statuses: z
            .object({
                registrationStatuses: z
                    .object({
                        online: HexOpt,
                        offline: HexOpt,
                    })
                    .optional()
                    .nullable(),
                calStatuses: z
                    .object({
                        connectivityNone: HexOpt,
                        connectError: HexOpt,
                        appUnregistered: HexOpt,
                        connectIssue: HexOpt,
                        inProgress: HexOpt,
                        ready: HexOpt,
                    })
                    .optional()
                    .nullable(),
            })
            .optional()
            .nullable(),

        decorationConfig: z
            .object({
                primaryGradientColorsConfig: z
                    .object({
                        colors: z
                            .array(
                                z.object({
                                    color: z.string(),
                                    blend: z.boolean(),
                                }),
                            )
                            .optional()
                            .nullable(),
                    })
                    .optional()
                    .nullable(),
            })
            .optional()
            .nullable(),
    })
    .passthrough();

export type WidgetConfig = z.infer<typeof WidgetConfigSchema>;
