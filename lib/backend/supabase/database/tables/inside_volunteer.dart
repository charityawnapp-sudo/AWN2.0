import '../database.dart';

class InsideVolunteerTable extends SupabaseTable<InsideVolunteerRow> {
  @override
  String get tableName => 'inside_volunteer';

  @override
  InsideVolunteerRow createRow(Map<String, dynamic> data) =>
      InsideVolunteerRow(data);
}

class InsideVolunteerRow extends SupabaseDataRow {
  InsideVolunteerRow(super.data);

  @override
  SupabaseTable get table => InsideVolunteerTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get vId => getField<String>('v_id');
  set vId(String? value) => setField<String>('v_id', value);

  DateTime? get joinedAt => getField<DateTime>('joined_at');
  set joinedAt(DateTime? value) => setField<DateTime>('joined_at', value);

  String? get countHoursVolunteer => getField<String>('count_hours_volunteer');
  set countHoursVolunteer(String? value) =>
      setField<String>('count_hours_volunteer', value);

  int? get countEventJoin => getField<int>('count_event_join');
  set countEventJoin(int? value) => setField<int>('count_event_join', value);
}


