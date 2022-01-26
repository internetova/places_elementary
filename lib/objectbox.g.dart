// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/places/domain/entity/favorite.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2863602009001187472),
      name: 'Favorite',
      lastPropertyId: const IdUid(5, 6628197238097942162),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2734136500699923868),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5958414250570662468),
            name: 'date',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 346278233831575643),
            name: 'favoriteType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6628197238097942162),
            name: 'placeId',
            type: 6,
            flags: 8,
            indexId: const IdUid(1, 2465020251807844523))
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2863602009001187472),
      lastIndexId: const IdUid(1, 2465020251807844523),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [5192488052698133379],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Favorite: EntityDefinition<Favorite>(
        model: _entities[0],
        toOneRelations: (Favorite object) => [],
        toManyRelations: (Favorite object) => {},
        getId: (Favorite object) => object.id,
        setId: (Favorite object, int id) {
          object.id = id;
        },
        objectToFB: (Favorite object, fb.Builder fbb) {
          final favoriteTypeOffset = fbb.writeString(object.favoriteType);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.date?.millisecondsSinceEpoch);
          fbb.addOffset(2, favoriteTypeOffset);
          fbb.addInt64(4, object.placeId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final object = Favorite(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              placeId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              favoriteType:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              date: dateValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(dateValue));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Favorite] entity fields to define ObjectBox queries.
class Favorite_ {
  /// see [Favorite.id]
  static final id = QueryIntegerProperty<Favorite>(_entities[0].properties[0]);

  /// see [Favorite.date]
  static final date =
      QueryIntegerProperty<Favorite>(_entities[0].properties[1]);

  /// see [Favorite.favoriteType]
  static final favoriteType =
      QueryStringProperty<Favorite>(_entities[0].properties[2]);

  /// see [Favorite.placeId]
  static final placeId =
      QueryIntegerProperty<Favorite>(_entities[0].properties[3]);
}
