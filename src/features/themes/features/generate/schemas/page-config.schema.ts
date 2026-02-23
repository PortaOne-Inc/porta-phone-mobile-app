import { z } from 'zod';
import { HexOpt } from './color-scheme.schema';

const BrightnessEnum = z.enum(['light', 'dark']).optional().nullable();

const OverlayStyleSchema = z
    .object({
        statusBarIconBrightness: BrightnessEnum,
        statusBarBrightness: BrightnessEnum,
        systemNavigationBarColor: HexOpt,
        systemNavigationBarIconBrightness: BrightnessEnum,
    })
    .optional()
    .nullable();

const ButtonStyleTypeEnum = z
    .enum(['primary', 'neutral', 'primaryOnDark', 'neutralOnDark'])
    .optional()
    .nullable();

const FontWeightSchema = z.object({ weight: z.number() }).optional().nullable();

const TextStyleConfigSchema = z
    .object({
        fontFamily: z.string().optional().nullable(),
        fontSize: z.number().optional().nullable(),
        fontWeight: FontWeightSchema,
        color: z.string().optional().nullable(),
        fontFeatures: z.array(z.string()).optional().nullable(),
    })
    .optional()
    .nullable();

const AppBarStyleSchema = z
    .object({
        backgroundColor: HexOpt,
        foregroundColor: HexOpt,
        primary: z.boolean().optional().nullable(),
    })
    .optional()
    .nullable();

const CallInfoSchema = z
    .object({
        usernameTextStyle: TextStyleConfigSchema,
        numberTextStyle: TextStyleConfigSchema,
        callStatusTextStyle: TextStyleConfigSchema,
        processingStatusTextStyle: TextStyleConfigSchema,
    })
    .optional()
    .nullable();

export const PageConfigSchema = z
    .object({
        login: z
            .object({
                modeSelect: z
                    .object({
                        systemUiOverlayStyle: OverlayStyleSchema,
                        buttonLoginStyleType: ButtonStyleTypeEnum,
                        buttonSignupStyleType: ButtonStyleTypeEnum,
                    })
                    .optional()
                    .nullable(),
            })
            .optional()
            .nullable(),

        dialing: z
            .object({
                systemUiOverlayStyle: OverlayStyleSchema,
                appBarStyle: AppBarStyleSchema,
                callInfo: CallInfoSchema,
            })
            .optional()
            .nullable(),
    })
    .strict();

export type PageConfig = z.infer<typeof PageConfigSchema>;
