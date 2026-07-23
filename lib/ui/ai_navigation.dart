import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';

class AiNavigationAction {
  const AiNavigationAction({
    required this.intent,
    required this.label,
    required this.icon,
    required this.description,
    required this.onPressed,
    this.fallback,
  });

  final String intent;
  final String label;
  final IconData icon;
  final String description;
  final VoidCallback onPressed;
  final String? fallback;
}

List<AiNavigationAction> buildContextualAiActions(
  BuildContext context,
  String query,
) {
  final text = query.trim().toLowerCase();
  final digits = RegExp(r'\b\d+\b').firstMatch(text)?.group(0);

  final actions = <AiNavigationAction>[];

  void addIf(bool condition, AiNavigationAction action) {
    if (condition && actions.length < 3) {
      actions.add(action);
    }
  }

  addIf(
    text.contains('donat') || text.contains('give') || text.contains('support'),
    AiNavigationAction(
      intent: 'view_donations',
      label: 'Browse Donations',
      icon: Icons.volunteer_activism_rounded,
      description: 'Explore the donation flow that already exists in the app.',
      onPressed: () => context.pushNamed(DonateWidget.routeName),
    ),
  );

  addIf(
    text.contains('charity') || text.contains('charities'),
    AiNavigationAction(
      intent: 'browse_charities',
      label: 'Open Charities',
      icon: Icons.apartment_rounded,
      description: 'See the existing charity directory.',
      onPressed: () => context.pushNamed(CharitiesWidget.routeName),
    ),
  );

  addIf(
    text.contains('volunteer'),
    AiNavigationAction(
      intent: 'view_volunteer',
      label: 'Explore Volunteer',
      icon: Icons.groups_rounded,
      description: 'Go to the volunteer section already available in the app.',
      onPressed: () => context.pushNamed(VolunteerWidget.routeName),
    ),
  );

  addIf(
    text.contains('my volunteer') ||
        (text.contains('volunteer') && text.contains('my')),
    AiNavigationAction(
      intent: 'my_volunteer',
      label: 'View My Volunteering',
      icon: Icons.badge_outlined,
      description: 'Open your existing volunteering records.',
      onPressed: () => context.pushNamed(MyVolunteerWidget.routeName),
    ),
  );

  addIf(
    text.contains('setting') || text.contains('account'),
    AiNavigationAction(
      intent: 'profile_settings',
      label: 'Open Settings',
      icon: Icons.settings_rounded,
      description: 'Manage the settings screen that already exists.',
      onPressed: () => context.pushNamed(SettingScreenWidget.routeName),
    ),
  );

  addIf(
    text.contains('profile'),
    AiNavigationAction(
      intent: 'view_profile',
      label: 'View Profile',
      icon: Icons.person_rounded,
      description: 'Open your profile screen.',
      onPressed: () => context.pushNamed(ProfileScreenWidget.routeName),
    ),
  );

  addIf(
    text.contains('map') || text.contains('location'),
    AiNavigationAction(
      intent: 'open_map',
      label: 'Open Map',
      icon: Icons.map_rounded,
      description: 'Browse charity locations on the map view.',
      onPressed: () => context.pushNamed(MapWidget.routeName),
    ),
  );

  addIf(
    text.contains('community'),
    AiNavigationAction(
      intent: 'open_community',
      label: 'Open Community',
      icon: Icons.groups_2_rounded,
      description: 'Go to the community screen already in the app.',
      onPressed: () => context.pushNamed(CommunityWidget.routeName),
    ),
  );

  addIf(
    text.contains('card') || text.contains('payment'),
    AiNavigationAction(
      intent: 'saved_cards',
      label: 'Saved Cards',
      icon: Icons.credit_card_rounded,
      description: 'Open your existing payment methods.',
      onPressed: () => context.pushNamed(MysavedcardWidget.routeName),
    ),
  );

  addIf(
    text.contains('help') || text.contains('support'),
    AiNavigationAction(
      intent: 'help_support',
      label: 'Help & Support',
      icon: Icons.support_agent_rounded,
      description: 'Go to the built-in support page.',
      onPressed: () => context.pushNamed(HelpAndSupportWidget.routeName),
    ),
  );

  addIf(
    text.contains('contact'),
    AiNavigationAction(
      intent: 'contact_us',
      label: 'Contact Us',
      icon: Icons.call_outlined,
      description: 'Open the existing contact page.',
      onPressed: () => context.pushNamed(ContactUsWidget.routeName),
    ),
  );

  addIf(
    text.contains('feedback'),
    AiNavigationAction(
      intent: 'feedback',
      label: 'Send Feedback',
      icon: Icons.rate_review_outlined,
      description: 'Open the feedback screen already available.',
      onPressed: () => context.pushNamed(FeedbackWidget.routeName),
    ),
  );

  addIf(
    text.contains('campaign') && digits != null,
    AiNavigationAction(
      intent: 'campaign_details',
      label: 'View Campaign',
      icon: Icons.campaign_rounded,
      description:
          'Open the campaign details page using the ID in your message.',
      onPressed: () => context.pushNamed(
        InsideBigCampaignWidget.routeName,
        queryParameters: {
          'bigcampaign': serializeParam(digits, ParamType.string),
        }.withoutNulls,
      ),
      fallback:
          'I can open campaign details when you include an existing campaign ID.',
    ),
  );

  addIf(
    text.contains('charity') && digits != null,
    AiNavigationAction(
      intent: 'charity_details',
      label: 'View Charity',
      icon: Icons.favorite_rounded,
      description:
          'Open the charity details page using the ID in your message.',
      onPressed: () => context.pushNamed(
        InsideCharityWidget.routeName,
        queryParameters: {
          'charityID': serializeParam(digits, ParamType.string),
        }.withoutNulls,
      ),
      fallback:
          'I can open charity details when you include an existing charity ID.',
    ),
  );

  return actions;
}


