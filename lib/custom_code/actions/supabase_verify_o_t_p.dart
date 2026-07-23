// Automatic FlutterFlow imports
import 'package:flutter/foundation.dart';

import '/backend/supabase/supabase.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> supabaseVerifyOTP(String email, String token) async {
  final supabase = Supabase.instance.client;
  try {
    final AuthResponse res = await supabase.auth.verifyOTP(
      // 🔑 CRITICAL FIX: Use OtpType.email to verify the code sent after a standard sign-up.
      type: OtpType.email,
      token: token,
      email: email,
    );

    // If verification is successful, a session is created (user is logged in)
    if (res.session != null && res.user != null) {
      debugPrint('OTP Verification Success for User: ${res.user!.id}');
      return true; // Verification success
    } else {
      debugPrint('OTP Verification Failed: Session or User is null.');
      return false; // Verification failed (e.g., wrong code)
    }
  } on AuthException catch (e) {
    debugPrint('OTP Auth Error: ${e.message}');
    // Display the error in FlutterFlow if you return the message instead of a boolean
    return false;
  } catch (e) {
    debugPrint('OTP General Error: $e');
    return false; // General error
  }
}


