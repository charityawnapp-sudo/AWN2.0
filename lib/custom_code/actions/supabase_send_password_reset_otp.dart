// Automatic FlutterFlow imports
import 'package:flutter/foundation.dart';

import '/backend/supabase/supabase.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> supabaseSendPasswordResetOtp(String email) async {
  final supabase = Supabase.instance.client;
  try {
    // This is the call that triggers the email send.
    // The redirectTo is required but often unused in mobile flows.
    await supabase.auth.resetPasswordForEmail(
      email,
      redirectTo: 'io.flutter.supabase.auth://login-callback',
    );
    return true; // Email send successfully triggered
  } on AuthException catch (e) {
    // This catches rate limiting (wait 60s) or "user not found" errors
    debugPrint('Password Reset Email (Auth) Error: ${e.message}');
    return false;
  } catch (e) {
    debugPrint('Password Reset Email (Unknown) Error: $e');
    return false;
  }
}


