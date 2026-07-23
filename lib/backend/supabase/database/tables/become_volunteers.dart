import '../database.dart';

class BecomeVolunteersTable extends SupabaseTable<BecomeVolunteersRow> {
  @override
  String get tableName => 'become_volunteers';

  @override
  BecomeVolunteersRow createRow(Map<String, dynamic> data) =>
      BecomeVolunteersRow(data);
}

class BecomeVolunteersRow extends SupabaseDataRow {
  BecomeVolunteersRow(super.data);

  @override
  SupabaseTable get table => BecomeVolunteersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get emergencyContact => getField<String>('emergency_contact');
  set emergencyContact(String? value) =>
      setField<String>('emergency_contact', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get timeSlot => getField<String>('time_slot');
  set timeSlot(String? value) => setField<String>('time_slot', value);

  String? get skillsSelect => getField<String>('skills_select');
  set skillsSelect(String? value) => setField<String>('skills_select', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}


