// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObject {
  static var _defaultsSet = false;

  Note(
    String id,
    String title, {
    String? content,
    String? createdAt,
    String? customIcon,
    bool isDir = false,
    bool isPinned = false,
    Note? parent,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObject.setDefaults<Note>({
        'isDir': false,
        'isPinned': false,
      });
    }
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'title', title);
    RealmObject.set(this, 'content', content);
    RealmObject.set(this, 'createdAt', createdAt);
    RealmObject.set(this, 'customIcon', customIcon);
    RealmObject.set(this, 'isDir', isDir);
    RealmObject.set(this, 'isPinned', isPinned);
    RealmObject.set(this, 'parent', parent);
  }

  Note._();

  @override
  String get id => RealmObject.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  String get title => RealmObject.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObject.set(this, 'title', value);

  @override
  String? get content => RealmObject.get<String>(this, 'content') as String?;
  @override
  set content(String? value) => RealmObject.set(this, 'content', value);

  @override
  String? get createdAt =>
      RealmObject.get<String>(this, 'createdAt') as String?;
  @override
  set createdAt(String? value) => RealmObject.set(this, 'createdAt', value);

  @override
  String? get customIcon =>
      RealmObject.get<String>(this, 'customIcon') as String?;
  @override
  set customIcon(String? value) => RealmObject.set(this, 'customIcon', value);

  @override
  bool get isDir => RealmObject.get<bool>(this, 'isDir') as bool;
  @override
  set isDir(bool value) => RealmObject.set(this, 'isDir', value);

  @override
  bool get isPinned => RealmObject.get<bool>(this, 'isPinned') as bool;
  @override
  set isPinned(bool value) => RealmObject.set(this, 'isPinned', value);

  @override
  Note? get parent => RealmObject.get<Note>(this, 'parent') as Note?;
  @override
  set parent(covariant Note? value) => RealmObject.set(this, 'parent', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObject.getChanges<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Note._);
    return const SchemaObject(Note, [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('content', RealmPropertyType.string, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.string, optional: true),
      SchemaProperty('customIcon', RealmPropertyType.string, optional: true),
      SchemaProperty('isDir', RealmPropertyType.bool),
      SchemaProperty('isPinned', RealmPropertyType.bool),
      SchemaProperty('parent', RealmPropertyType.object,
          optional: true, linkTarget: 'Note'),
    ]);
  }
}
