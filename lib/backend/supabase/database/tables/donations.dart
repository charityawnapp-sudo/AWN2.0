import '../database.dart';

class DonationsTable extends SupabaseTable<DonationsRow> {
  @override
  String get tableName => 'donations';

  @override
  DonationsRow createRow(Map<String, dynamic> data) => DonationsRow(data);
}

class DonationsRow extends SupabaseDataRow {
  DonationsRow(super.data);

  @override
  SupabaseTable get table => DonationsTable();

  String get donationId => getField<String>('donation_id')!;
  set donationId(String value) => setField<String>('donation_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  String? get paymentMethod => getField<String>('payment_method');
  set paymentMethod(String? value) => setField<String>('payment_method', value);

  String? get donateType => getField<String>('donate_type');
  set donateType(String? value) => setField<String>('donate_type', value);

  String? get donationCategoryId => getField<String>('donation_category_id');
  set donationCategoryId(String? value) =>
      setField<String>('donation_category_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}


