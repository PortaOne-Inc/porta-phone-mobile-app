part of 'translations_cubit.dart';

enum TranslationsStateType { initializing, pending, common }

enum TranslationSearchMode { key, value, both }

@freezed
sealed class TranslationsState with _$TranslationsState {
  const factory TranslationsState({
    @Default(TranslationsStateType.initializing) TranslationsStateType state,
    @Default(Filter()) Filter filter,
    @Default(Translations()) Translations translations,
    Exception? exception,
  }) = _TranslationsState;

  const TranslationsState._();

  bool get isPending => isInitializing || state == TranslationsStateType.pending;

  bool get isInitializing => state == TranslationsStateType.initializing && exception == null;

  bool get isInitializingError => exception != null;

  bool get isCommon => state == TranslationsStateType.common;

  List<Translation> get filteredTranslations {
    var translations = this.translations.original;
    if (filter.activeLocales.isNotEmpty) {
      translations = translations.where((e) => filter.activeLocales.contains(e.locale)).toList();
    }
    if (filter.localeFilter.isNotEmpty) {
      translations = translations.where((e) => e.locale == filter.localeFilter).toList();
    }
    if (filter.searchFilter.isNotEmpty) {
      final query = filter.searchFilter.toLowerCase();
      translations = translations
          .where(
            (e) => switch (filter.searchMode) {
              TranslationSearchMode.key => e.key.toLowerCase().contains(query),
              TranslationSearchMode.value => e.value.toLowerCase().contains(query),
              TranslationSearchMode.both =>
                e.key.toLowerCase().contains(query) || e.value.toLowerCase().contains(query),
            },
          )
          .toList();
    }
    return translations;
  }

  Translation? findOverride(String locale, String key) {
    return translations.overrided.firstWhereOrNull((e) => e.locale == locale && e.key == key);
  }
}

@freezed
sealed class Translations with _$Translations {
  const factory Translations({@Default([]) List<Translation> original, @Default([]) List<Translation> overrided}) =
      _Translations;
}

@freezed
sealed class Filter with _$Filter {
  const factory Filter({
    @Default('') String localeFilter,
    @Default('') String searchFilter,
    @Default(TranslationSearchMode.key) TranslationSearchMode searchMode,
    @Default(<String>{}) Set<String> activeLocales,
  }) = _Filter;
}
