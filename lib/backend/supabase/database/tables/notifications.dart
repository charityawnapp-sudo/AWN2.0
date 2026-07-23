import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(super.data);

  @override
  SupabaseTable get table => NotificationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get notificationName => getField<String>('notification_name')!;
  set notificationName(String value) =>
      setField<String>('notification_name', value);

  String? get nDescription => getField<String>('n_description');
  set nDescription(String? value) => setField<String>('n_description', value);

  String? get nIconType => getField<String>('n_icon_type');
  set nIconType(String? value) => setField<String>('n_icon_type', value);

  DateTime get nTimeSent => getField<DateTime>('n_time_sent')!;
  set nTimeSent(DateTime value) => setField<DateTime>('n_time_sent', value);
}


