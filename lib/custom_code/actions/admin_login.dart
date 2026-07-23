// Automatic FlutterFlow imports
import 'package:flutter/foundation.dart';

import '/backend/supabase/supabase.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Returns the admin's ID (UUID) as a String on success, or null on failure.
Future<String?> adminLogin(String email, String password) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.rpc(
      'verify_admin_login', // Name of the updated Supabase function
      params: {
        'input_email': email,
        'input_password': password,
      },
    );

    // The RPC returns a list of maps (rows). If successful, the list has one item.
    if (response is List && response.isNotEmpty) {
      // Return the 'id' (UUID string) from the first (and only) row
      return response.first['id'];
    }

    // If the list is empty (login failed, user not found, or account is detective)
    return null;
  } catch (e) {
    // Handle Supabase or network errors
    debugPrint('Supabase RPC error: $e');
    return null;
  }
}


