# Splash Screen & Launch Icon Constraints

This document describes the official platform constraints, how they map to the configurator's
designer values, and known issues with incorrect safe zone sizes.

---

## Table of Contents

- [Android 12+ Splash Screen](#android-12-splash-screen)
- [Android Adaptive Icon](#android-adaptive-icon)
- [Android Legacy Icon](#android-legacy-icon)
- [iOS App Icon](#ios-app-icon)
- [Web Icon](#web-icon)
- [Standard Splash (pre-Android 12)](#standard-splash-pre-android-12)
- [Configurator Constraints Summary](#configurator-constraints-summary)
- [Known Issues & Fixes](#known-issues--fixes)

---

## Android 12+ Splash Screen

**Source:** https://developer.android.com/develop/ui/views/launch/splash-screen

### Official Dimensions

| Parameter              | With icon background     | Without icon background  |
|------------------------|--------------------------|--------------------------|
| Drawable size          | 240 x 240 dp             | 288 x 288 dp             |
| Circular mask diameter | 160 dp                   | 192 dp                   |
| Masking rule           | 1/3 of foreground masked | 1/3 of foreground masked |
| Branded image          | 200 x 80 dp              | 200 x 80 dp              |

Android 12+ always applies a **circular mask** to the splash icon. Only the central circle is
visible; everything outside is clipped.

### Circular Mask vs Square Content

The configurator draws foreground content into a **square** area. A square of side `D` does NOT fit
inside a circle of diameter `D` — the sides protrude at all points except the 4 midpoints.

For square content to fit entirely inside a circle:

```
safe_square_side = circle_diameter / sqrt(2)
```

| Mode               | Circle (dp) | Safe square (dp)     | Rounded |
|--------------------|-------------|----------------------|---------|
| With background    | 160         | 160 / 1.414 = 113.14 | **113** |
| Without background | 192         | 192 / 1.414 = 135.76 | **135** |

### Configurator Mapping

`flutter_native_splash` uses `android:windowSplashScreenAnimatedIcon` without
`android:windowSplashScreenIconBackgroundColor`, which means the **"without icon background"** mode
applies.

| Configurator field            | Value   | Derivation                       |
|-------------------------------|---------|----------------------------------|
| `fullSizeDp`                  | 288     | Official drawable size           |
| `maskDiameterDp` (safeZoneDp) | **135** | Inscribed square in 192dp circle |
| `exportSizePx`                | 1152    | 288 x 4 (xxxhdpi)                |
| `minPaddingDp`                | 76.5    | (288 - 135) / 2                  |
| `toleranceDp`                 | 4       | Small compliance margin          |

---

## Android Adaptive Icon

**Source:** https://developer.android.com/develop/ui/views/launch/icon_design_adaptive

### Official Dimensions

| Parameter           | Value                                            |
|---------------------|--------------------------------------------------|
| Canvas (each layer) | **108 x 108 dp**                                 |
| Safe zone           | **66 x 66 dp** (centered)                        |
| Logo size range     | 48 - 66 dp                                       |
| Masked border       | **18 dp** on each side                           |
| Mask shapes         | Circle, squircle, rounded square (OEM-dependent) |

Key rule from the spec:
> "The outer 18 dp on each of the four sides of the layers is reserved for masking and to create
> visual effects such as parallax or pulsing."

### Safe Zone Derivation

```
Canvas:          108 dp
Safe zone:        66 dp
Border each side: (108 - 66) / 2 = 21 dp from edge to safe zone
Masked area:      18 dp (the spec says 18dp is reserved, safe zone starts at 21dp)
```

The 3dp gap between the mask edge (18dp) and the safe zone boundary (21dp) provides additional
margin.

### Configurator Mapping (x4 scale)

The configurator uses a canvas 4x the spec size for higher resolution exports:

| Configurator field | Value   | Derivation                  |
|--------------------|---------|-----------------------------|
| `sizeDp`           | 432     | 108 x 4                     |
| `safeZoneDp`       | **264** | 66 x 4 (official safe zone) |
| `exportSizePx`     | 432     | Direct export at canvas dp  |
| `minPaddingDp`     | 84      | (432 - 264) / 2             |
| `toleranceDp`      | 4       | Small compliance margin     |

### Verification

```
minPadding at 1x scale: 84 / 4 = 21dp
Safe zone at 1x scale:  264 / 4 = 66dp  (matches spec)
Canvas at 1x scale:     432 / 4 = 108dp (matches spec)
```

---

## Android Legacy Icon

**Source:** Pre-adaptive icon format, no system mask applied.

| Parameter   | Value                      |
|-------------|----------------------------|
| Base size   | 48 x 48 dp (mdpi)          |
| System mask | **None**                   |
| Safe zone   | Design recommendation only |

### Configurator Mapping

| Configurator field | Value | Notes                                         |
|--------------------|-------|-----------------------------------------------|
| `sizeDp`           | 512   | Export canvas                                 |
| `safeZoneDp`       | 384   | 75% — design recommendation, no clipping risk |
| `exportSizePx`     | 512   | Direct export                                 |
| `minPaddingDp`     | 64    | (512 - 384) / 2                               |
| `toleranceDp`      | 4     | Compliance margin                             |

---

## iOS App Icon

**Source:** https://developer.apple.com/design/human-interface-guidelines/app-icons

### Official Dimensions

| Parameter      | Value                                          |
|----------------|------------------------------------------------|
| App Store icon | **1024 x 1024 px**                             |
| Mask shape     | **Superellipse** (squircle)                    |
| Corner radius  | ~22.37% of icon size (formula: `10/57 * size`) |
| Transparency   | Not allowed                                    |
| Safe zone      | Not officially specified; ~80% empirical       |

For a 1024px icon: corner radius = `10/57 * 1024 = 179.6px`.

The superellipse clips more than a standard rounded rectangle but less than a circle. Content near
corners is at risk.

### Configurator Mapping

| Configurator field | Value | Notes                                      |
|--------------------|-------|--------------------------------------------|
| `sizeDp`           | 1024  | Matches App Store requirement              |
| `safeZoneDp`       | 832   | ~81% — avoids superellipse corner clipping |
| `exportSizePx`     | 1024  | Direct export                              |
| `minPaddingDp`     | 96    | (1024 - 832) / 2                           |
| `toleranceDp`      | 4     | Compliance margin                          |

---

## Web Icon

No system mask is applied to web favicons/PWA icons. Safe zone is a design recommendation for visual
padding.

### Configurator Mapping

| Configurator field | Value | Notes                       |
|--------------------|-------|-----------------------------|
| `sizeDp`           | 512   | Export canvas               |
| `safeZoneDp`       | 460.8 | 90% — design recommendation |
| `exportSizePx`     | 512   | Direct export               |
| `minPaddingDp`     | 25.6  | (512 - 460.8) / 2           |
| `toleranceDp`      | 4     | Compliance margin           |

---

## Standard Splash (pre-Android 12)

The standard splash screen uses `launch_background.xml` which layers `background.png` (fill) +
`splash.png` (center). No circular mask is applied — the image is displayed as-is.

### Configurator Mapping

| Configurator field            | Value | Notes                                    |
|-------------------------------|-------|------------------------------------------|
| `fullSizeDp`                  | 512   | Canvas for the splash image              |
| `maskDiameterDp` (safeZoneDp) | 384   | 75% — design recommendation, no clipping |
| `exportSizePx`                | 1024  | 512 x 2                                  |
| `minPaddingDp`                | 64    | (512 - 384) / 2                          |
| `toleranceDp`                 | 4     | Compliance margin                        |

---

## Configurator Constraints Summary

### Splash Screen Constraints Defaults

```json
{
  "withBackground": {
    "fullSizeDp": 240,
    "maskDiameterDp": 113,
    "toleranceDp": 4
  },
  "withoutBackground": {
    "fullSizeDp": 288,
    "maskDiameterDp": 135,
    "toleranceDp": 4
  },
  "android12": {
    "fullSizeDp": 288,
    "maskDiameterDp": 135,
    "toleranceDp": 4
  }
}
```

### Launch Icon Constraints Defaults

```json
{
  "androidAdaptive": {
    "sizeDp": 432,
    "safeZoneDp": 264,
    "toleranceDp": 4
  },
  "androidLegacy": {
    "sizeDp": 512,
    "safeZoneDp": 384,
    "toleranceDp": 4
  },
  "ios": {
    "sizeDp": 1024,
    "safeZoneDp": 832,
    "toleranceDp": 4
  },
  "web": {
    "sizeDp": 512,
    "safeZoneDp": 460.8,
    "toleranceDp": 4
  }
}
```

---

## Known Issues & Fixes

### Issue 1: Android 12 splash safeZoneDp used circle diameter instead of inscribed square

**Was:** `maskDiameterDp: 192` (circle diameter)
**Fix:** `maskDiameterDp: 135` (inscribed square side = 192 / sqrt(2))

**Root cause:** The safe zone was set to the circular mask diameter. But the designer draws content
into a square. A 192x192 square does not fit inside a 192dp circle — sides protrude beyond the
circle and get clipped on real devices.

**Impact:** Content configured at maximum size in the configurator was clipped on Android 12+
devices (tested on Pixel 9).

### Issue 2: Android Adaptive icon safeZoneDp was 75% instead of 61%

**Was:** `safeZoneDp: 324` (75% of 432)
**Fix:** `safeZoneDp: 264` (66dp x 4 = 61.1% of 432)

**Root cause:** The safe zone did not match the official Android spec (66dp on 108dp canvas). The
value 324 allowed content to extend into the 18dp masked border zone.

**Impact:** Icons configured at maximum safe zone size could be clipped on devices with circular or
tight squircle masks.

### Issue 3: toleranceDp equaled sizeDp across all platforms

**Was:** `toleranceDp` = `sizeDp` (e.g., 432, 512, 1024)
**Fix:** `toleranceDp: 4` for all platforms

**Root cause:** Tolerance was set to the full canvas size, making validation always pass regardless
of padding value.

**Impact:** Backend validation was meaningless — any padding (including 0) was reported as "
compliant".

### Issue 4: Makefile splash config generation failed due to # in color values

**Was:** `SPLASH_COLOR ?= "#123752"` with `echo "$${SPLASH_COLOR:-$(SPLASH_COLOR)}"`
**Fix:** `SPLASH_COLOR ?= \#123752` with `echo '  color: "$(SPLASH_COLOR)"'`

**Root cause:** The `#` character in Make variable values was interpreted as a comment. The shell
parameter expansion `${VAR:-default}` also broke when the default contained `#` inside double
quotes.

**Impact:** `make generate-native-splash-config` failed with "unexpected EOF" error.

### Issue 5: maskDp (red circle overlay) removed from designer

**Was:** `maskDp` field on `DesignerPageConfig` drew a red circle showing the outer mask boundary.
**Fix:** Removed `maskDp` from config, page factories, and the preview painter entirely.

**Root cause:** The mask overlay was redundant — padding is already clamped to
`minPaddingDp = (sizeDp - safeZoneDp) / 2`, so content can never extend beyond the safe zone.
The red circle duplicated information already conveyed by the white safe zone circle and the
padding constraint itself.

**Impact:** Cleaner preview with only the white safe zone guide remaining.
