// Automatic FlutterFlow imports
import 'package:flutter/foundation.dart';

import '/backend/supabase/supabase.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

/// Verifies an OTP code for a specific purpose (signup, recovery).
Future<bool> supabaseFlexibleVerifyOTP(
  String email,
  String token,
  String otpType,
) async {
  final supabase = Supabase.instance.client;

  // CRITICAL: Determine the correct Supabase OtpType enum
  final type = otpType == 'signup' ? OtpType.signup : OtpType.recovery;

  try {
    final AuthResponse res = await supabase.auth.verifyOTP(
      type: type, // Uses OtpType.recovery for password reset
      token: token,
      email: email,
    );

    // If verification is successful, Supabase returns a user object and/or a session.
    // The presence of a session is the clearest sign of success.
    if (res.session != null) {
      return true; // Verification successful
    } else {
      // Catch cases where verification fails (e.g., wrong code, expired)
      debugPrint('OTP Verification Failed (No Session): ${res.user}');
      return false;
    }
  } on AuthException catch (e) {
    // Catches errors like "Token has expired" or "Invalid token"
    debugPrint('Flexible OTP Verification (Auth) Error: ${e.message}');
    return false;
  } catch (e) {
    debugPrint('Flexible OTP Verification (Unknown) Error: $e');
    return false;
  }
}


