import '../database.dart';

class InsideBigCampaignsTable extends SupabaseTable<InsideBigCampaignsRow> {
  @override
  String get tableName => 'inside_big_campaigns';

  @override
  InsideBigCampaignsRow createRow(Map<String, dynamic> data) =>
      InsideBigCampaignsRow(data);
}

class InsideBigCampaignsRow extends SupabaseDataRow {
  InsideBigCampaignsRow(super.data);

  @override
  SupabaseTable get table => InsideBigCampaignsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get bigCampaignName => getField<String>('big_campaign_name');
  set bigCampaignName(String? value) =>
      setField<String>('big_campaign_name', value);

  String? get paymentMethod => getField<String>('payment_method');
  set paymentMethod(String? value) => setField<String>('payment_method', value);

  double get donateAmount => getField<double>('donate_amount')!;
  set donateAmount(double value) => setField<double>('donate_amount', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get campaignId => getField<String>('campaign_id');
  set campaignId(String? value) => setField<String>('campaign_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}


