import '../database.dart';

class DonationCategoriesTable extends SupabaseTable<DonationCategoriesRow> {
  @override
  String get tableName => 'donation_categories';

  @override
  DonationCategoriesRow createRow(Map<String, dynamic> data) =>
      DonationCategoriesRow(data);
}

class DonationCategoriesRow extends SupabaseDataRow {
  DonationCategoriesRow(super.data);

  @override
  SupabaseTable get table => DonationCategoriesTable();

  String get donationId => getField<String>('donation_id')!;
  set donationId(String value) => setField<String>('donation_id', value);

  String? get donationIcon => getField<String>('donation_icon');
  set donationIcon(String? value) => setField<String>('donation_icon', value);

  String get donationType => getField<String>('donation_type')!;
  set donationType(String value) => setField<String>('donation_type', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}


