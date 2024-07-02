import { Request, Response } from 'express';
import { string, object, array } from 'joi';

function validateCreateTheme(req: Request, res: Response, next: () => void) {
  const { error } = object({
    id: string().allow(null),
    name: string(),
    fontFamily: string().allow(null),
    colors: object({
      primary: string().allow(null),
      onPrimary: string().allow(null),
      primaryContainer: string().allow(null),
      onPrimaryContainer: string().allow(null),
      primaryFixed: string().allow(null),
      primaryFixedDim: string().allow(null),
      onPrimaryFixed: string().allow(null),
      onPrimaryFixedVariant: string().allow(null),
      secondary: string().allow(null),
      onSecondary: string().allow(null),
      secondaryContainer: string().allow(null),
      onSecondaryContainer: string().allow(null),
      secondaryFixed: string().allow(null),
      secondaryFixedDim: string().allow(null),
      onSecondaryFixed: string().allow(null),
      onSecondaryFixedVariant: string().allow(null),
      tertiary: string().allow(null),
      onTertiary: string().allow(null),
      tertiaryContainer: string().allow(null),
      onTertiaryContainer: string().allow(null),
      tertiaryFixed: string().allow(null),
      tertiaryFixedDim: string().allow(null),
      onTertiaryFixed: string().allow(null),
      onTertiaryFixedVariant: string().allow(null),
      error: string().allow(null),
      onError: string().allow(null),
      errorContainer: string().allow(null),
      onErrorContainer: string().allow(null),
      outline: string().allow(null),
      outlineVariant: string().allow(null),
      background: string().allow(null), // Deprecated
      onBackground: string().allow(null), // Deprecated
      surface: string().allow(null),
      onSurface: string().allow(null),
      surfaceDim: string().allow(null),
      surfaceBright: string().allow(null),
      surfaceContainerLowest: string().allow(null),
      surfaceContainerLow: string().allow(null),
      surfaceContainer: string().allow(null),
      surfaceContainerHigh: string().allow(null),
      surfaceContainerHighest: string().allow(null),
      onSurfaceVariant: string().allow(null),
      inverseSurface: string().allow(null),
      inversePrimary: string().allow(null),
      shadow: string().allow(null),
      scrim: string().allow(null),
      surfaceTint: string().allow(null),
      gradientTabColor: array().items(string()).allow(null),
    }),
    images: object({
      onboarding: string().allow(null),
      applicationLogo: string().allow(null),
      notificationLogo: string().allow(null),
      adaptiveIconBackground: string().allow(null),
      adaptiveIconForeground: string().allow(null),
      androidLauncherIcon: string().allow(null),
      iosLauncherIcon: string().allow(null),
      webLauncherIcon: string().allow(null),
    })
  }).validate(req.body);

  if (error) {
    return res.status(400).send(error.details[0].message);
  }
  next();
  return;
}

export { validateCreateTheme };