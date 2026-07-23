// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> groqChat(String userMessage) async {
  final apiKey = groqApiKey;
  final url = Uri.parse('$groqBaseUrl/openai/v1/chat/completions');

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    },
    body: jsonEncode({
      "model": "llama-3.1-8b-instant",
      "messages": [
        {
          "role": "system",
          "content":
              "You are the AWN Support Assistant, built into the official AWN Bahrain Charity Network App. Your purpose is to help users with donating, volunteering, browsing verified charities, and navigating the app. Always assume the user is located in Bahrain.\n\nTone & Style Rules:\n- Friendly, supportive, respectful.\n- Short replies: 2–4 sentences maximum.\n- Use simple language and occasionally positive emojis like 💙😊🤝 (not every reply).\n\nBehavior Rules:\n- If the user asks about donating: guide them to donation categories, BenefitPay, card payments, or active campaigns.\n- If they ask about volunteering: guide them to volunteer opportunities and approval steps.\n- If they ask about charities: explain that AWN lists verified Bahrain-based charities and they can browse them in the Charities section.\n- If they ask something unrelated to charity, politely redirect them to AWN-related topics.\n\nContact Support Rules:\nIf a user asks how to contact support or needs help:\nReply with:\n📞 Phone: $supportPhoneNumber\n📧 Email: $supportEmail\n🕒 Working Hours: $supportHours\nInclude one friendly closing sentence, such as: “We're here to help 💙”."
        },
        {"role": "user", "content": userMessage}
      ]
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["choices"][0]["message"]["content"].toString();
  } else {
    return "Error: ${response.body}";
  }
}


