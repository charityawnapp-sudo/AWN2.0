import '../database.dart';

class InsernewcardTable extends SupabaseTable<InsernewcardRow> {
  @override
  String get tableName => 'insernewcard';

  @override
  InsernewcardRow createRow(Map<String, dynamic> data) => InsernewcardRow(data);
}

class InsernewcardRow extends SupabaseDataRow {
  InsernewcardRow(super.data);

  @override
  SupabaseTable get table => InsernewcardTable();

  String get userID => getField<String>('UserID')!;
  set userID(String value) => setField<String>('UserID', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get cardnumber => getField<String>('cardnumber');
  set cardnumber(String? value) => setField<String>('cardnumber', value);

  String? get expireDate => getField<String>('expire_date');
  set expireDate(String? value) => setField<String>('expire_date', value);

  String? get cvv => getField<String>('CVV');
  set cvv(String? value) => setField<String>('CVV', value);

  String get cardId => getField<String>('card_id')!;
  set cardId(String value) => setField<String>('card_id', value);
}


