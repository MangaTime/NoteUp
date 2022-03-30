// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObject {
  static var _defaultsSet = false;

  Note(
    String id,
    String content, {
    String? createdAt,
    bool? isDir = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObject.setDefaults<Note>({
        'isDir': false,
      });
    }
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'content', content);
    RealmObject.set(this, 'createdAt', createdAt);
    RealmObject.set(this, 'isDir', isDir);
  }

  Note._();

  @override
  String get id => RealmObject.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  String get content => RealmObject.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObject.set(this, 'content', value);

  @override
  String? get createdAt =>
      RealmObject.get<String>(this, 'createdAt') as String?;
  @override
  set createdAt(String? value) => RealmObject.set(this, 'createdAt', value);

  @override
  bool? get isDir => RealmObject.get<bool>(this, 'isDir') as bool?;
  @override
  set isDir(bool? value) => RealmObject.set(this, 'isDir', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObject.getChanges<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Note._);
    return const SchemaObject(Note, [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.string, optional: true),
      SchemaProperty('isDir', RealmPropertyType.bool, optional: true),
    ]);
  }
}
