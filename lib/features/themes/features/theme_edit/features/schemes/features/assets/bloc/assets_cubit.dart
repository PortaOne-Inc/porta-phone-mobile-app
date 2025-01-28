import 'dart:typed_data';

import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'assets_state.dart';

part 'assets_cubit.freezed.dart';

class AssetsCubit extends Cubit<AssetsState> {
  AssetsCubit() : super(const AssetsState());
}
