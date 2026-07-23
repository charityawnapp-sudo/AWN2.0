import '../database.dart';

class CharitiesTable extends SupabaseTable<CharitiesRow> {
  @override
  String get tableName => 'charities';

  @override
  CharitiesRow createRow(Map<String, dynamic> data) => CharitiesRow(data);
}

class CharitiesRow extends SupabaseDataRow {
  CharitiesRow(super.data);

  @override
  SupabaseTable get table => CharitiesTable();

  String get chId => getField<String>('ch_id')!;
  set chId(String value) => setField<String>('ch_id', value);

  String get chName => getField<String>('ch_name')!;
  set chName(String value) => setField<String>('ch_name', value);

  String? get chPlace => getField<String>('ch_place');
  set chPlace(String? value) => setField<String>('ch_place', value);

  String? get chImg => getField<String>('ch_img');
  set chImg(String? value) => setField<String>('ch_img', value);

  String? get chEmail => getField<String>('ch_email');
  set chEmail(String? value) => setField<String>('ch_email', value);

  String? get chPhone => getField<String>('ch_phone');
  set chPhone(String? value) => setField<String>('ch_phone', value);

  String? get chLocationUrl => getField<String>('ch_location_url');
  set chLocationUrl(String? value) =>
      setField<String>('ch_location_url', value);

  double? get totalDonationAmount => getField<double>('total_donation_amount');
  set totalDonationAmount(double? value) =>
      setField<double>('total_donation_amount', value);

  int? get totalDonors => getField<int>('total_donors');
  set totalDonors(int? value) => setField<int>('total_donors', value);
}


