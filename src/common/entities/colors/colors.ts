import { Collection } from 'fireorm';
import { Launch } from '../launch/launch';

@Collection('colors')
export class Colors {
  id: string; // Make id required
  primary?: string;
  onPrimary?: string;
  primaryContainer?: string;
  onPrimaryContainer?: string;
  primaryFixed?: string;
  primaryFixedDim?: string;
  onPrimaryFixed?: string;
  onPrimaryFixedVariant?: string;
  secondary?: string;
  onSecondary?: string;
  secondaryContainer?: string;
  onSecondaryContainer?: string;
  secondaryFixed?: string;
  secondaryFixedDim?: string;
  onSecondaryFixed?: string;
  onSecondaryFixedVariant?: string;
  tertiary?: string;
  onTertiary?: string;
  tertiaryContainer?: string;
  onTertiaryContainer?: string;
  tertiaryFixed?: string;
  tertiaryFixedDim?: string;
  onTertiaryFixed?: string;
  onTertiaryFixedVariant?: string;
  error?: string;
  onError?: string;
  errorContainer?: string;
  onErrorContainer?: string;
  outline?: string;
  outlineVariant?: string;
  /** @deprecated Use other properties for background colors */
  background?: string;
  /** @deprecated Use other properties for on background colors */
  onBackground?: string;
  surface?: string;
  onSurface?: string;
  surfaceDim?: string;
  surfaceBright?: string;
  surfaceContainerLowest?: string;
  surfaceContainerLow?: string;
  surfaceContainer?: string;
  surfaceContainerHigh?: string;
  surfaceContainerHighest?: string;
  onSurfaceVariant?: string;
  inverseSurface?: string;
  inversePrimary?: string;
  shadow?: string;
  scrim?: string;
  surfaceTint?: string;
  gradientTabColor?: string[];
  launch?: Launch;
}
