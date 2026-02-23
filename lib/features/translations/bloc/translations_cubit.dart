import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/domain.dart';

part 'translations_state.dart';

part 'translations_cubit.freezed.dart';

// TODO(Serdun): error handling and snackbars
class TranslationsCubit extends Cubit<TranslationsState> {
  TranslationsCubit({
    required this.appId,
    required this.usecaseTranslationsGetAll,
    required this.usecaseTranslationsGetOverridesByAppId,
    required this.usecaseTranslationsSetOverride,
    required this.usecaseTranslationsDeleteOverride,
  }) : super(const TranslationsState()) {
    fetchTranslation();
  }

  final String appId;
  final UsecaseTranslationsGetAll usecaseTranslationsGetAll;
  final UsecaseTranslationsGetOverridesByAppId
  usecaseTranslationsGetOverridesByAppId;
  final UsecaseTranslationsSetOverride usecaseTranslationsSetOverride;
  final UsecaseTranslationsDeleteOverride usecaseTranslationsDeleteOverride;

  Future<void> fetchTranslation() async {
    emit(state.copyWith(state: TranslationsStateType.initializing));
    try {
      final data = await Future.wait([
        usecaseTranslationsGetAll.execute(),
        usecaseTranslationsGetOverridesByAppId.execute(appId),
      ]);

      emit(
        state.copyWith(
          state: TranslationsStateType.common,
          translations: Translations(original: data[0], overrided: data[1]),
        ),
      );
    } catch (e) {
      emit(state.copyWith(exception: e as Exception));
    }
  }

  Future<void> setOverride(Translation translation, String value) async {
    if (!state.isCommon) return;

    emit(state.copyWith(state: TranslationsStateType.pending));

    try {
      final override = translation.copyWith(value: value);
      await usecaseTranslationsSetOverride.execute(appId, override);

      final overrides = List<Translation>.from(state.translations.overrided);
      final overrideIndex = overrides.indexWhere(
        (element) =>
            element.locale == translation.locale &&
            element.key == translation.key,
      );

      if (overrideIndex != -1) {
        overrides[overrideIndex] = override;
      } else {
        overrides.add(override);
      }

      emit(
        state.copyWith(
          translations: state.translations.copyWith(overrided: overrides),
          state: TranslationsStateType.common,
        ),
      );
    } catch (e) {
      emit(state.copyWith(exception: e as Exception));
    }
  }

  Future<void> deleteOverride(Translation override) async {
    if (!state.isCommon) return;

    emit(state.copyWith(state: TranslationsStateType.pending));

    try {
      await usecaseTranslationsDeleteOverride.execute(appId, override);

      final overrides = List<Translation>.from(state.translations.overrided)
        ..removeWhere(
          (element) =>
              element.locale == override.locale && element.key == override.key,
        );

      emit(
        state.copyWith(
          translations: state.translations.copyWith(overrided: overrides),
          state: TranslationsStateType.common,
        ),
      );
    } catch (e) {
      emit(state.copyWith(exception: e as Exception));
    }
  }

  void updateLocaleFilter(String locale) {
    emit(state.copyWith(filter: state.filter.copyWith(localeFilter: locale)));
  }

  void updateSearchFilter(String search) {
    emit(state.copyWith(filter: state.filter.copyWith(searchFilter: search)));
  }
}
