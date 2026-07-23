import '../database.dart';

class BigCampaignsTable extends SupabaseTable<BigCampaignsRow> {
  @override
  String get tableName => 'big_campaigns';

  @override
  BigCampaignsRow createRow(Map<String, dynamic> data) => BigCampaignsRow(data);
}

class BigCampaignsRow extends SupabaseDataRow {
  BigCampaignsRow(super.data);

  @override
  SupabaseTable get table => BigCampaignsTable();

  String get bcId => getField<String>('bc_id')!;
  set bcId(String value) => setField<String>('bc_id', value);

  String? get bcStatus => getField<String>('bc_status');
  set bcStatus(String? value) => setField<String>('bc_status', value);

  String? get bcImg => getField<String>('bc_img');
  set bcImg(String? value) => setField<String>('bc_img', value);

  String get bcName => getField<String>('bc_name')!;
  set bcName(String value) => setField<String>('bc_name', value);

  String? get bcDescription => getField<String>('bc_description');
  set bcDescription(String? value) => setField<String>('bc_description', value);

  double? get bcTargetAmount => getField<double>('bc_target_amount');
  set bcTargetAmount(double? value) =>
      setField<double>('bc_target_amount', value);

  double? get progressDonateCampaign =>
      getField<double>('progress_donate_campaign');
  set progressDonateCampaign(double? value) =>
      setField<double>('progress_donate_campaign', value);

  int? get totalSupporter => getField<int>('total_supporter');
  set totalSupporter(int? value) => setField<int>('total_supporter', value);

  DateTime? get campaignTimer => getField<DateTime>('campaign_timer');
  set campaignTimer(DateTime? value) =>
      setField<DateTime>('campaign_timer', value);

  double? get remainingAmount => getField<double>('remaining_amount');
  set remainingAmount(double? value) =>
      setField<double>('remaining_amount', value);
}


