import '../database.dart';

class VolunteersTable extends SupabaseTable<VolunteersRow> {
  @override
  String get tableName => 'volunteers';

  @override
  VolunteersRow createRow(Map<String, dynamic> data) => VolunteersRow(data);
}

class VolunteersRow extends SupabaseDataRow {
  VolunteersRow(super.data);

  @override
  SupabaseTable get table => VolunteersTable();

  String get vId => getField<String>('v_id')!;
  set vId(String value) => setField<String>('v_id', value);

  String? get typeOfVolunteer => getField<String>('type_of_volunteer');
  set typeOfVolunteer(String? value) =>
      setField<String>('type_of_volunteer', value);

  String get vName => getField<String>('v_name')!;
  set vName(String value) => setField<String>('v_name', value);

  String? get vPlace => getField<String>('v_place');
  set vPlace(String? value) => setField<String>('v_place', value);

  String? get vDescription => getField<String>('v_description');
  set vDescription(String? value) => setField<String>('v_description', value);

  String? get joinUrl => getField<String>('join_url');
  set joinUrl(String? value) => setField<String>('join_url', value);

  int? get totalSpots => getField<int>('total_spots');
  set totalSpots(int? value) => setField<int>('total_spots', value);

  DateTime? get eventDate => getField<DateTime>('event_date');
  set eventDate(DateTime? value) => setField<DateTime>('event_date', value);

  PostgresTime? get endTime => getField<PostgresTime>('end_time');
  set endTime(PostgresTime? value) => setField<PostgresTime>('end_time', value);

  PostgresTime? get startTime => getField<PostgresTime>('start_time');
  set startTime(PostgresTime? value) =>
      setField<PostgresTime>('start_time', value);

  String? get vTh => getField<String>('V_TH');
  set vTh(String? value) => setField<String>('V_TH', value);
}


