import Launch from "./launch";

export default class Colors {
    public primary?: string;
    public onPrimary?: string;
    public primaryContainer?: string;
    public onPrimaryContainer?: string;
    public primaryFixed?: string;
    public primaryFixedDim?: string;
    public onPrimaryFixed?: string;
    public onPrimaryFixedVariant?: string;
    public secondary?: string;
    public onSecondary?: string;
    public secondaryContainer?: string;
    public onSecondaryContainer?: string;
    public secondaryFixed?: string;
    public secondaryFixedDim?: string;
    public onSecondaryFixed?: string;
    public onSecondaryFixedVariant?: string;
    public tertiary?: string;
    public onTertiary?: string;
    public tertiaryContainer?: string;
    public onTertiaryContainer?: string;
    public tertiaryFixed?: string;
    public tertiaryFixedDim?: string;
    public onTertiaryFixed?: string;
    public onTertiaryFixedVariant?: string;
    public error?: string;
    public onError?: string;
    public errorContainer?: string;
    public onErrorContainer?: string;
    public outline?: string;
    public outlineVariant?: string;
    /** @deprecated Use other properties for background colors */
    public background?: string;
    /** @deprecated Use other properties for on background colors */
    public onBackground?: string;
    public surface?: string;
    public onSurface?: string;
    public surfaceDim?: string;
    public surfaceBright?: string;
    public surfaceContainerLowest?: string;
    public surfaceContainerLow?: string;
    public surfaceContainer?: string;
    public surfaceContainerHigh?: string;
    public surfaceContainerHighest?: string;
    public onSurfaceVariant?: string;
    public inverseSurface?: string;
    public inversePrimary?: string;
    public shadow?: string;
    public scrim?: string;
    public surfaceTint?: string;
    public gradientTabColor?: string[];
    public launch?: Launch;
}