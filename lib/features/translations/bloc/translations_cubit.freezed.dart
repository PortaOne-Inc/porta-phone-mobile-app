// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translations_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TranslationsState {
  TranslationsStateType get state => throw _privateConstructorUsedError;
  Filter get filter => throw _privateConstructorUsedError;
  Translations get translations => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationsStateCopyWith<TranslationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationsStateCopyWith<$Res> {
  factory $TranslationsStateCopyWith(
          TranslationsState value, $Res Function(TranslationsState) then) =
      _$TranslationsStateCopyWithImpl<$Res, TranslationsState>;
  @useResult
  $Res call(
      {TranslationsStateType state,
      Filter filter,
      Translations translations,
      Exception? exception});

  $FilterCopyWith<$Res> get filter;
  $TranslationsCopyWith<$Res> get translations;
}

/// @nodoc
class _$TranslationsStateCopyWithImpl<$Res, $Val extends TranslationsState>
    implements $TranslationsStateCopyWith<$Res> {
  _$TranslationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? filter = null,
    Object? translations = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TranslationsStateType,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Translations,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FilterCopyWith<$Res> get filter {
    return $FilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationsCopyWith<$Res> get translations {
    return $TranslationsCopyWith<$Res>(_value.translations, (value) {
      return _then(_value.copyWith(translations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TranslationsStateImplCopyWith<$Res>
    implements $TranslationsStateCopyWith<$Res> {
  factory _$$TranslationsStateImplCopyWith(_$TranslationsStateImpl value,
          $Res Function(_$TranslationsStateImpl) then) =
      __$$TranslationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TranslationsStateType state,
      Filter filter,
      Translations translations,
      Exception? exception});

  @override
  $FilterCopyWith<$Res> get filter;
  @override
  $TranslationsCopyWith<$Res> get translations;
}

/// @nodoc
class __$$TranslationsStateImplCopyWithImpl<$Res>
    extends _$TranslationsStateCopyWithImpl<$Res, _$TranslationsStateImpl>
    implements _$$TranslationsStateImplCopyWith<$Res> {
  __$$TranslationsStateImplCopyWithImpl(_$TranslationsStateImpl _value,
      $Res Function(_$TranslationsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? filter = null,
    Object? translations = null,
    Object? exception = freezed,
  }) {
    return _then(_$TranslationsStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TranslationsStateType,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as Translations,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$TranslationsStateImpl extends _TranslationsState {
  const _$TranslationsStateImpl(
      {this.state = TranslationsStateType.initializing,
      this.filter = const Filter(),
      this.translations = const Translations(),
      this.exception})
      : super._();

  @override
  @JsonKey()
  final TranslationsStateType state;
  @override
  @JsonKey()
  final Filter filter;
  @override
  @JsonKey()
  final Translations translations;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'TranslationsState(state: $state, filter: $filter, translations: $translations, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationsStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.translations, translations) ||
                other.translations == translations) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, state, filter, translations, exception);

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationsStateImplCopyWith<_$TranslationsStateImpl> get copyWith =>
      __$$TranslationsStateImplCopyWithImpl<_$TranslationsStateImpl>(
          this, _$identity);
}

abstract class _TranslationsState extends TranslationsState {
  const factory _TranslationsState(
      {final TranslationsStateType state,
      final Filter filter,
      final Translations translations,
      final Exception? exception}) = _$TranslationsStateImpl;
  const _TranslationsState._() : super._();

  @override
  TranslationsStateType get state;
  @override
  Filter get filter;
  @override
  Translations get translations;
  @override
  Exception? get exception;

  /// Create a copy of TranslationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationsStateImplCopyWith<_$TranslationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Translations {
  List<Translation> get original => throw _privateConstructorUsedError;
  List<Translation> get overrided => throw _privateConstructorUsedError;

  /// Create a copy of Translations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationsCopyWith<Translations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationsCopyWith<$Res> {
  factory $TranslationsCopyWith(
          Translations value, $Res Function(Translations) then) =
      _$TranslationsCopyWithImpl<$Res, Translations>;
  @useResult
  $Res call({List<Translation> original, List<Translation> overrided});
}

/// @nodoc
class _$TranslationsCopyWithImpl<$Res, $Val extends Translations>
    implements $TranslationsCopyWith<$Res> {
  _$TranslationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Translations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? overrided = null,
  }) {
    return _then(_value.copyWith(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
      overrided: null == overrided
          ? _value.overrided
          : overrided // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslationsImplCopyWith<$Res>
    implements $TranslationsCopyWith<$Res> {
  factory _$$TranslationsImplCopyWith(
          _$TranslationsImpl value, $Res Function(_$TranslationsImpl) then) =
      __$$TranslationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Translation> original, List<Translation> overrided});
}

/// @nodoc
class __$$TranslationsImplCopyWithImpl<$Res>
    extends _$TranslationsCopyWithImpl<$Res, _$TranslationsImpl>
    implements _$$TranslationsImplCopyWith<$Res> {
  __$$TranslationsImplCopyWithImpl(
      _$TranslationsImpl _value, $Res Function(_$TranslationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Translations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? overrided = null,
  }) {
    return _then(_$TranslationsImpl(
      original: null == original
          ? _value._original
          : original // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
      overrided: null == overrided
          ? _value._overrided
          : overrided // ignore: cast_nullable_to_non_nullable
              as List<Translation>,
    ));
  }
}

/// @nodoc

class _$TranslationsImpl implements _Translations {
  const _$TranslationsImpl(
      {final List<Translation> original = const [],
      final List<Translation> overrided = const []})
      : _original = original,
        _overrided = overrided;

  final List<Translation> _original;
  @override
  @JsonKey()
  List<Translation> get original {
    if (_original is EqualUnmodifiableListView) return _original;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_original);
  }

  final List<Translation> _overrided;
  @override
  @JsonKey()
  List<Translation> get overrided {
    if (_overrided is EqualUnmodifiableListView) return _overrided;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overrided);
  }

  @override
  String toString() {
    return 'Translations(original: $original, overrided: $overrided)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationsImpl &&
            const DeepCollectionEquality().equals(other._original, _original) &&
            const DeepCollectionEquality()
                .equals(other._overrided, _overrided));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_original),
      const DeepCollectionEquality().hash(_overrided));

  /// Create a copy of Translations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationsImplCopyWith<_$TranslationsImpl> get copyWith =>
      __$$TranslationsImplCopyWithImpl<_$TranslationsImpl>(this, _$identity);
}

abstract class _Translations implements Translations {
  const factory _Translations(
      {final List<Translation> original,
      final List<Translation> overrided}) = _$TranslationsImpl;

  @override
  List<Translation> get original;
  @override
  List<Translation> get overrided;

  /// Create a copy of Translations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationsImplCopyWith<_$TranslationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Filter {
  String get localeFilter => throw _privateConstructorUsedError;
  String get searchFilter => throw _privateConstructorUsedError;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCopyWith<Filter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) then) =
      _$FilterCopyWithImpl<$Res, Filter>;
  @useResult
  $Res call({String localeFilter, String searchFilter});
}

/// @nodoc
class _$FilterCopyWithImpl<$Res, $Val extends Filter>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeFilter = null,
    Object? searchFilter = null,
  }) {
    return _then(_value.copyWith(
      localeFilter: null == localeFilter
          ? _value.localeFilter
          : localeFilter // ignore: cast_nullable_to_non_nullable
              as String,
      searchFilter: null == searchFilter
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterImplCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$$FilterImplCopyWith(
          _$FilterImpl value, $Res Function(_$FilterImpl) then) =
      __$$FilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localeFilter, String searchFilter});
}

/// @nodoc
class __$$FilterImplCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeFilter = null,
    Object? searchFilter = null,
  }) {
    return _then(_$FilterImpl(
      localeFilter: null == localeFilter
          ? _value.localeFilter
          : localeFilter // ignore: cast_nullable_to_non_nullable
              as String,
      searchFilter: null == searchFilter
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterImpl implements _Filter {
  const _$FilterImpl({this.localeFilter = '', this.searchFilter = ''});

  @override
  @JsonKey()
  final String localeFilter;
  @override
  @JsonKey()
  final String searchFilter;

  @override
  String toString() {
    return 'Filter(localeFilter: $localeFilter, searchFilter: $searchFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterImpl &&
            (identical(other.localeFilter, localeFilter) ||
                other.localeFilter == localeFilter) &&
            (identical(other.searchFilter, searchFilter) ||
                other.searchFilter == searchFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localeFilter, searchFilter);

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      __$$FilterImplCopyWithImpl<_$FilterImpl>(this, _$identity);
}

abstract class _Filter implements Filter {
  const factory _Filter(
      {final String localeFilter, final String searchFilter}) = _$FilterImpl;

  @override
  String get localeFilter;
  @override
  String get searchFilter;

  /// Create a copy of Filter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
