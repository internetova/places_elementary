// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlaceTearOff {
  const _$PlaceTearOff();

  _Place call(
      {required int id,
      required double lat,
      required double lng,
      required String name,
      required List<String> urls,
      required String placeType,
      required String description,
      double? distance}) {
    return _Place(
      id: id,
      lat: lat,
      lng: lng,
      name: name,
      urls: urls,
      placeType: placeType,
      description: description,
      distance: distance,
    );
  }
}

/// @nodoc
const $Place = _$PlaceTearOff();

/// @nodoc
mixin _$Place {
  int get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  String get placeType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res>;
  $Res call(
      {int id,
      double lat,
      double lng,
      String name,
      List<String> urls,
      String placeType,
      String description,
      double? distance});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res> implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  final Place _value;
  // ignore: unused_field
  final $Res Function(Place) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? urls = freezed,
    Object? placeType = freezed,
    Object? description = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      placeType: placeType == freezed
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) then) =
      __$PlaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      double lat,
      double lng,
      String name,
      List<String> urls,
      String placeType,
      String description,
      double? distance});
}

/// @nodoc
class __$PlaceCopyWithImpl<$Res> extends _$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(_Place _value, $Res Function(_Place) _then)
      : super(_value, (v) => _then(v as _Place));

  @override
  _Place get _value => super._value as _Place;

  @override
  $Res call({
    Object? id = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? urls = freezed,
    Object? placeType = freezed,
    Object? description = freezed,
    Object? distance = freezed,
  }) {
    return _then(_Place(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      placeType: placeType == freezed
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_Place implements _Place {
  const _$_Place(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.name,
      required this.urls,
      required this.placeType,
      required this.description,
      this.distance});

  @override
  final int id;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String name;
  @override
  final List<String> urls;
  @override
  final String placeType;
  @override
  final String description;
  @override
  final double? distance;

  @override
  String toString() {
    return 'Place(id: $id, lat: $lat, lng: $lng, name: $name, urls: $urls, placeType: $placeType, description: $description, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Place &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.urls, urls) &&
            const DeepCollectionEquality().equals(other.placeType, placeType) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.distance, distance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(urls),
      const DeepCollectionEquality().hash(placeType),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(distance));

  @JsonKey(ignore: true)
  @override
  _$PlaceCopyWith<_Place> get copyWith =>
      __$PlaceCopyWithImpl<_Place>(this, _$identity);
}

abstract class _Place implements Place {
  const factory _Place(
      {required int id,
      required double lat,
      required double lng,
      required String name,
      required List<String> urls,
      required String placeType,
      required String description,
      double? distance}) = _$_Place;

  @override
  int get id;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get name;
  @override
  List<String> get urls;
  @override
  String get placeType;
  @override
  String get description;
  @override
  double? get distance;
  @override
  @JsonKey(ignore: true)
  _$PlaceCopyWith<_Place> get copyWith => throw _privateConstructorUsedError;
}
