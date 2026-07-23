import '../database.dart';

class QuickPaymentsTable extends SupabaseTable<QuickPaymentsRow> {
  @override
  String get tableName => 'quick_payments';

  @override
  QuickPaymentsRow createRow(Map<String, dynamic> data) =>
      QuickPaymentsRow(data);
}

class QuickPaymentsRow extends SupabaseDataRow {
  QuickPaymentsRow(super.data);

  @override
  SupabaseTable get table => QuickPaymentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  double get donationAmount => getField<double>('donation_amount')!;
  set donationAmount(double value) =>
      setField<double>('donation_amount', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}


