export type NudgeTarget = 'colorScheme' | 'widgetConfig' | 'pageConfig';
export type NudgeMode = 'patch' | 'replace';

export class NudgeThemeDto {
    prompt!: string;

    targets?: NudgeTarget[];

    variant?: 'light' | 'dark';

    mode?: NudgeMode;

    seedColorHint?: string | null;
}
