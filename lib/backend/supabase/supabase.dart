import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

export 'database/database.dart';
export 'storage/storage.dart';

const _requiredEnvKeys = <String>[
  'SUPABASE_URL',
  'SUPABASE_ANON_KEY',
  'GROQ_API_KEY',
  'SUPPORT_PHONE_NUMBER',
  'SUPPORT_EMAIL',
  'SUPPORT_HOURS',
];

String _env(String key) => dotenv.env[key]?.trim() ?? '';

String _requiredEnv(String key) {
  final value = _env(key);
  if (value.isEmpty) {
    throw StateError(
      'Missing required environment variable: $key. '
      'Create a root .env file and add $key.',
    );
  }
  return value;
}

void validateRequiredEnvironment() {
  final missing = _requiredEnvKeys.where((key) => _env(key).isEmpty).toList();
  if (missing.isNotEmpty) {
    throw StateError(
      'Missing required environment variables: ${missing.join(', ')}. '
      'Create or update the root .env file before launching the app.',
    );
  }
}

String get supabaseUrl => _requiredEnv('SUPABASE_URL');
String get supabaseAnonKey => _requiredEnv('SUPABASE_ANON_KEY');
String get groqApiKey => _requiredEnv('GROQ_API_KEY');
String get groqBaseUrl => _env('GROQ_BASE_URL').isEmpty
    ? 'https://api.groq.com'
    : _env('GROQ_BASE_URL');
String get supportPhoneNumber => _requiredEnv('SUPPORT_PHONE_NUMBER');
String get supportEmail => _requiredEnv('SUPPORT_EMAIL');
String get supportHours => _requiredEnv('SUPPORT_HOURS');
String get supabasePublicStorageBaseUrl =>
    '$supabaseUrl/storage/v1/object/public';
String publicStorageUrl(String path) => '$supabasePublicStorageBaseUrl/$path';
String get defaultProfileImageUrl =>
    publicStorageUrl('avatars/profile_pic/default.png');
String get defaultAdminProfileImageUrl =>
    publicStorageUrl('admins/admin_profile/default.png');
String get defaultCharityImageUrl =>
    publicStorageUrl('Charities/charity_img/CharityDefault.png');
String get defaultBigCampaignImageUrl =>
    publicStorageUrl('BigCampaign/BC_IMG/BigcampaignDefaut.jpg');
String get defaultCommunityImageUrl =>
    publicStorageUrl('community/community_img/community.png');
String get benefitQrCodeImageUrl =>
    publicStorageUrl('admins/Benefitscan/benefitQrcode.png');

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: supabaseUrl,
        headers: {
          'X-Client-Info': 'flutterflow',
        },
        anonKey: supabaseAnonKey,
        debug: false,
        authOptions:
            const FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}


