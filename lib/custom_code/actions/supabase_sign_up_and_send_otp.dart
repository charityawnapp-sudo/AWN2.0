// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> supabaseSignUpAndSendOtp(String email, String password) async {
  final supabase = Supabase.instance.client;
  try {
    final AuthResponse response = await supabase.auth.signUp(
      email: email,
      password: password,
      // NOTE: We don't use 'emailRedirectTo' if we expect a manual 6-digit code entry.
    );

    // Check if the user was created (unverified)
    if (response.user != null) {
      // Success: Return user ID. The user is now in 'auth.users' but unconfirmed.
      return response.user!.id.toString();
    } else {
      // Should not happen if successful, but a safeguard
      return 'SignupFailed: No user returned.';
    }
  } on AuthException catch (e) {
    // Return specific Supabase error message (e.g., "User already registered")
    return 'AuthError: ${e.message}';
  } catch (e) {
    // Return general error
    return 'UnexpectedError: $e';
  }
}


