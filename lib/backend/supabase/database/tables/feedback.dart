import '../database.dart';

class FeedbackTable extends SupabaseTable<FeedbackRow> {
  @override
  String get tableName => 'feedback';

  @override
  FeedbackRow createRow(Map<String, dynamic> data) => FeedbackRow(data);
}

class FeedbackRow extends SupabaseDataRow {
  FeedbackRow(super.data);

  @override
  SupabaseTable get table => FeedbackTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get starRate => getField<int>('star_rate');
  set starRate(int? value) => setField<int>('star_rate', value);

  String? get categorySelect => getField<String>('category_select');
  set categorySelect(String? value) =>
      setField<String>('category_select', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}


