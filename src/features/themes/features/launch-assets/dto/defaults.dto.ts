export class PlatformConstraintsDto {
  sizeDp?: number;
  safeZoneDp?: number;
  toleranceDp?: number;
}

export class ConstraintsDefaultsDto {
  androidLegacy?: PlatformConstraintsDto;
  androidAdaptive?: PlatformConstraintsDto;
  ios?: PlatformConstraintsDto;
  web?: PlatformConstraintsDto;
}
