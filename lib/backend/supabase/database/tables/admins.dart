import '../database.dart';

class AdminsTable extends SupabaseTable<AdminsRow> {
  @override
  String get tableName => 'admins';

  @override
  AdminsRow createRow(Map<String, dynamic> data) => AdminsRow(data);
}

class AdminsRow extends SupabaseDataRow {
  AdminsRow(super.data);

  @override
  SupabaseTable get table => AdminsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get passwordEncrypted => getField<String>('password_encrypted')!;
  set passwordEncrypted(String value) =>
      setField<String>('password_encrypted', value);

  String? get adminAvatars => getField<String>('admin_avatars');
  set adminAvatars(String? value) => setField<String>('admin_avatars', value);

  bool? get adminIsRoot => getField<bool>('admin_is_root');
  set adminIsRoot(bool? value) => setField<bool>('admin_is_root', value);

  bool? get adminActiveDetective => getField<bool>('admin_active_detective');
  set adminActiveDetective(bool? value) =>
      setField<bool>('admin_active_detective', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get adminDescriptionList =>
      getField<String>('admin_Description_List');
  set adminDescriptionList(String? value) =>
      setField<String>('admin_Description_List', value);
}


