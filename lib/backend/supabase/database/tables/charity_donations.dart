import '../database.dart';

class CharityDonationsTable extends SupabaseTable<CharityDonationsRow> {
  @override
  String get tableName => 'charity_donations';

  @override
  CharityDonationsRow createRow(Map<String, dynamic> data) =>
      CharityDonationsRow(data);
}

class CharityDonationsRow extends SupabaseDataRow {
  CharityDonationsRow(super.data);

  @override
  SupabaseTable get table => CharityDonationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get charityId => getField<String>('charity_id');
  set charityId(String? value) => setField<String>('charity_id', value);

  double get donationAmount => getField<double>('donation_amount')!;
  set donationAmount(double value) =>
      setField<double>('donation_amount', value);

  String get paymentMethod => getField<String>('payment_method')!;
  set paymentMethod(String value) => setField<String>('payment_method', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}


