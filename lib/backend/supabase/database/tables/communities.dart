import '../database.dart';

class CommunitiesTable extends SupabaseTable<CommunitiesRow> {
  @override
  String get tableName => 'communities';

  @override
  CommunitiesRow createRow(Map<String, dynamic> data) => CommunitiesRow(data);
}

class CommunitiesRow extends SupabaseDataRow {
  CommunitiesRow(super.data);

  @override
  SupabaseTable get table => CommunitiesTable();

  String get cId => getField<String>('c_id')!;
  set cId(String value) => setField<String>('c_id', value);

  String? get cName => getField<String>('c_name');
  set cName(String? value) => setField<String>('c_name', value);

  String? get cType => getField<String>('c_type');
  set cType(String? value) => setField<String>('c_type', value);

  int? get cTotalMember => getField<int>('c_total_member');
  set cTotalMember(int? value) => setField<int>('c_total_member', value);

  String? get cDescription => getField<String>('c_description');
  set cDescription(String? value) => setField<String>('c_description', value);

  bool? get cIsActive => getField<bool>('c_is_active');
  set cIsActive(bool? value) => setField<bool>('c_is_active', value);

  String? get cJoinUrl => getField<String>('c_join_url');
  set cJoinUrl(String? value) => setField<String>('c_join_url', value);

  String? get communtiesImg => getField<String>('communties_img');
  set communtiesImg(String? value) => setField<String>('communties_img', value);
}


