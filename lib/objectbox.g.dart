// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/favorites/domain/entity/favorite_db.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 461994261577863779),
      name: 'FavoriteDb',
      lastPropertyId: const IdUid(7, 3640871508486581190),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2747524620986222775),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 119928629148320953),
            name: 'placeId',
            type: 6,
            flags: 8,
            indexId: const IdUid(2, 5173906232786800890)),
        ModelProperty(
            id: const IdUid(3, 3203024892035413721),
            name: 'place',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6000582192994827121),
            name: 'date',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3640871508486581190),
            name: 'favoriteType',
            type: 9,
            flags: 0)
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
      lastEntityId: const IdUid(2, 461994261577863779),
      lastIndexId: const IdUid(2, 5173906232786800890),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [2863602009001187472],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        5192488052698133379,
        2734136500699923868,
        5958414250570662468,
        346278233831575643,
        6628197238097942162,
        7097027162091483651,
        8041159147394840189,
        7477798122154345678
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    FavoriteDb: EntityDefinition<FavoriteDb>(
        model: _entities[0],
        toOneRelations: (FavoriteDb object) => [],
        toManyRelations: (FavoriteDb object) => {},
        getId: (FavoriteDb object) => object.id,
        setId: (FavoriteDb object, int id) {
          object.id = id;
        },
        objectToFB: (FavoriteDb object, fb.Builder fbb) {
          final placeOffset = fbb.writeString(object.place);
          final favoriteTypeOffset = fbb.writeString(object.favoriteType);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.placeId);
          fbb.addOffset(2, placeOffset);
          fbb.addInt64(4, object.date?.millisecondsSinceEpoch);
          fbb.addOffset(6, favoriteTypeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final object = FavoriteDb(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              placeId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              place:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              favoriteType:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 16, ''),
              date: dateValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(dateValue));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [FavoriteDb] entity fields to define ObjectBox queries.
class FavoriteDb_ {
  /// see [FavoriteDb.id]
  static final id =
      QueryIntegerProperty<FavoriteDb>(_entities[0].properties[0]);

  /// see [FavoriteDb.placeId]
  static final placeId =
      QueryIntegerProperty<FavoriteDb>(_entities[0].properties[1]);

  /// see [FavoriteDb.place]
  static final place =
      QueryStringProperty<FavoriteDb>(_entities[0].properties[2]);

  /// see [FavoriteDb.date]
  static final date =
      QueryIntegerProperty<FavoriteDb>(_entities[0].properties[3]);

  /// see [FavoriteDb.favoriteType]
  static final favoriteType =
      QueryStringProperty<FavoriteDb>(_entities[0].properties[4]);
}
