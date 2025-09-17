import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

extension FitModelMapperExt on FitModel {
  BoxFit toBoxFit() {
    switch (this) {
      case FitModel.contain:
        return BoxFit.contain;
      case FitModel.cover:
        return BoxFit.cover;
      case FitModel.fill:
        return BoxFit.fill;
      case FitModel.scaleDown:
        return BoxFit.scaleDown;
      case FitModel.none:
        return BoxFit.none;
      case FitModel.fitWidth:
        return BoxFit.fitWidth;
      case FitModel.fitHeight:
        return BoxFit.fitHeight;
    }
  }
}

extension BoxFitMapperExt on BoxFit {
  FitModel toFitModel() {
    switch (this) {
      case BoxFit.contain:
        return FitModel.contain;
      case BoxFit.cover:
        return FitModel.cover;
      case BoxFit.fill:
        return FitModel.fill;
      case BoxFit.scaleDown:
        return FitModel.scaleDown;
      case BoxFit.fitWidth:
        return FitModel.fitWidth;
      case BoxFit.fitHeight:
        return FitModel.fitHeight;
      case BoxFit.none:
        return FitModel.none;
    }
  }
}
