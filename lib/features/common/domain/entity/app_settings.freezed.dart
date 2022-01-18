// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppSettingsTearOff {
  const _$AppSettingsTearOff();

  _AppSettings call(
      {required bool themeIsDark,
      required bool onboardingIsComplete,
      required SearchFilter searchFilter,
      required int mainTab}) {
    return _AppSettings(
      themeIsDark: themeIsDark,
      onboardingIsComplete: onboardingIsComplete,
      searchFilter: searchFilter,
      mainTab: mainTab,
    );
  }
}

/// @nodoc
const $AppSettings = _$AppSettingsTearOff();

/// @nodoc
mixin _$AppSettings {
  bool get themeIsDark => throw _privateConstructorUsedError;
  bool get onboardingIsComplete => throw _privateConstructorUsedError;
  SearchFilter get searchFilter => throw _privateConstructorUsedError;
  int get mainTab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res>;
  $Res call(
      {bool themeIsDark,
      bool onboardingIsComplete,
      SearchFilter searchFilter,
      int mainTab});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  final AppSettings _value;
  // ignore: unused_field
  final $Res Function(AppSettings) _then;

  @override
  $Res call({
    Object? themeIsDark = freezed,
    Object? onboardingIsComplete = freezed,
    Object? searchFilter = freezed,
    Object? mainTab = freezed,
  }) {
    return _then(_value.copyWith(
      themeIsDark: themeIsDark == freezed
          ? _value.themeIsDark
          : themeIsDark // ignore: cast_nullable_to_non_nullable
              as bool,
      onboardingIsComplete: onboardingIsComplete == freezed
          ? _value.onboardingIsComplete
          : onboardingIsComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFilter: searchFilter == freezed
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as SearchFilter,
      mainTab: mainTab == freezed
          ? _value.mainTab
          : mainTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(
          _AppSettings value, $Res Function(_AppSettings) then) =
      __$AppSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool themeIsDark,
      bool onboardingIsComplete,
      SearchFilter searchFilter,
      int mainTab});
}

/// @nodoc
class __$AppSettingsCopyWithImpl<$Res> extends _$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(
      _AppSettings _value, $Res Function(_AppSettings) _then)
      : super(_value, (v) => _then(v as _AppSettings));

  @override
  _AppSettings get _value => super._value as _AppSettings;

  @override
  $Res call({
    Object? themeIsDark = freezed,
    Object? onboardingIsComplete = freezed,
    Object? searchFilter = freezed,
    Object? mainTab = freezed,
  }) {
    return _then(_AppSettings(
      themeIsDark: themeIsDark == freezed
          ? _value.themeIsDark
          : themeIsDark // ignore: cast_nullable_to_non_nullable
              as bool,
      onboardingIsComplete: onboardingIsComplete == freezed
          ? _value.onboardingIsComplete
          : onboardingIsComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFilter: searchFilter == freezed
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as SearchFilter,
      mainTab: mainTab == freezed
          ? _value.mainTab
          : mainTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AppSettings implements _AppSettings {
  const _$_AppSettings(
      {required this.themeIsDark,
      required this.onboardingIsComplete,
      required this.searchFilter,
      required this.mainTab});

  @override
  final bool themeIsDark;
  @override
  final bool onboardingIsComplete;
  @override
  final SearchFilter searchFilter;
  @override
  final int mainTab;

  @override
  String toString() {
    return 'AppSettings(themeIsDark: $themeIsDark, onboardingIsComplete: $onboardingIsComplete, searchFilter: $searchFilter, mainTab: $mainTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppSettings &&
            const DeepCollectionEquality()
                .equals(other.themeIsDark, themeIsDark) &&
            const DeepCollectionEquality()
                .equals(other.onboardingIsComplete, onboardingIsComplete) &&
            const DeepCollectionEquality()
                .equals(other.searchFilter, searchFilter) &&
            const DeepCollectionEquality().equals(other.mainTab, mainTab));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(themeIsDark),
      const DeepCollectionEquality().hash(onboardingIsComplete),
      const DeepCollectionEquality().hash(searchFilter),
      const DeepCollectionEquality().hash(mainTab));

  @JsonKey(ignore: true)
  @override
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {required bool themeIsDark,
      required bool onboardingIsComplete,
      required SearchFilter searchFilter,
      required int mainTab}) = _$_AppSettings;

  @override
  bool get themeIsDark;
  @override
  bool get onboardingIsComplete;
  @override
  SearchFilter get searchFilter;
  @override
  int get mainTab;
  @override
  @JsonKey(ignore: true)
  _$AppSettingsCopyWith<_AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
