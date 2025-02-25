import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:data/dto/theme/theme.dart';
import 'package:domain/domain.dart';

import '../../../extensions/extensions.dart';
import '../../../models/models.dart';

part 'preview_embedded_state.dart';

part 'preview_embedded_cubit.freezed.dart';

class PreviewEmbeddedCubit extends Cubit<PreviewEmbeddedState> {
  PreviewEmbeddedCubit({
    required EmbeddedResource embedded,
  }) : super(PreviewEmbeddedState(embeddedResource: embedded));
}
