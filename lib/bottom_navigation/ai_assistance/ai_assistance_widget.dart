import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/ai_navigation.dart';
import '/ui/premium_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ai_assistance_model.dart';
export 'ai_assistance_model.dart';

class AiAssistanceWidget extends StatefulWidget {
  const AiAssistanceWidget({super.key});

  static String routeName = 'AiAssistance';
  static String routePath = '/aiAssistance';

  @override
  State<AiAssistanceWidget> createState() => _AiAssistanceWidgetState();
}

class _AiAssistanceWidgetState extends State<AiAssistanceWidget> {
  late AiAssistanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiAssistanceModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final prompt = _model.textController?.text.trim() ?? '';
    if (prompt.isEmpty) {
      return;
    }

    final contextualActions = buildContextualAiActions(context, prompt);

    safeSetState(() {
      _model.addToChatMessages(
        AiChatMessage(text: prompt, isUser: true),
      );
      _model.textController?.clear();
    });

    final reply = await actions.groqChat(prompt);
    if (!mounted) {
      return;
    }

    safeSetState(() {
      _model.addToChatMessages(
        AiChatMessage(
          text:
              reply.isEmpty ? 'I could not generate a reply right now.' : reply,
          isUser: false,
          actions: contextualActions,
        ),
      );
    });
  }

  void _fillPrompt(String prompt) {
    safeSetState(() {
      _model.textController?.text = prompt;
      _model.textController?.selection = TextSelection.collapsed(
        offset: prompt.length,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: PremiumBackground(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: PremiumSurface(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: theme.primary.withValues(alpha: 0.10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              'awn2.0-NewIcon/AWN2.0-icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'AI Assistance',
                                style: GoogleFonts.manrope(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: theme.primaryText,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Ask about donations, charities, volunteering, settings, or support, and I’ll surface the fastest real destination.',
                                style: GoogleFonts.inter(
                                  fontSize: 13.5,
                                  height: 1.45,
                                  color: theme.secondaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      PremiumActionChip(
                        label: 'Browse Donations',
                        icon: Icons.volunteer_activism_rounded,
                        compact: true,
                        onTap: () => _fillPrompt('I want to donate.'),
                      ),
                      PremiumActionChip(
                        label: 'Open Settings',
                        icon: Icons.settings_rounded,
                        compact: true,
                        onTap: () => _fillPrompt('Open settings.'),
                      ),
                      PremiumActionChip(
                        label: 'View My Volunteering',
                        icon: Icons.groups_rounded,
                        compact: true,
                        onTap: () => _fillPrompt('Show my volunteering.'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: _model.chatMessages.isEmpty
                      ? PremiumEmptyState(
                          title: 'Start a conversation',
                          subtitle:
                              'Try asking for donations, charities, your profile, settings, or support. I’ll suggest a direct in-app action when the destination exists.',
                          icon: Icons.auto_awesome_rounded,
                          action: PremiumActionChip(
                            label: 'Try “I want to donate”',
                            icon: Icons.volunteer_activism_rounded,
                            onTap: () => _fillPrompt('I want to donate.'),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          itemCount: _model.chatMessages.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final message = _model.chatMessages[index];
                            final isUser = message.isUser;
                            final bubbleColor = isUser
                                ? theme.primary
                                : theme.secondaryBackground;
                            final textColor =
                                isUser ? Colors.white : theme.primaryText;

                            return Align(
                              alignment: isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 640,
                                ),
                                child: Column(
                                  crossAxisAlignment: isUser
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    PremiumSurface(
                                      color: bubbleColor,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 14,
                                      ),
                                      child: Text(
                                        message.text,
                                        style: GoogleFonts.inter(
                                          fontSize: 14.5,
                                          height: 1.5,
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    if (!isUser &&
                                        message.actions.isNotEmpty) ...[
                                      const SizedBox(height: 10),
                                      Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: message.actions
                                            .map(
                                              (action) => PremiumActionChip(
                                                label: action.label,
                                                icon: action.icon,
                                                onTap: action.onPressed,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: PremiumSurface(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            minLines: 1,
                            maxLines: 5,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _sendMessage(),
                            style: GoogleFonts.inter(
                              fontSize: 14.5,
                              color: theme.primaryText,
                            ),
                            decoration: InputDecoration(
                              hintText:
                                  'Ask about donations, charities, settings, or campaign details...',
                              border: InputBorder.none,
                              isDense: true,
                              hintStyle: GoogleFonts.inter(
                                fontSize: 14.5,
                                color: theme.secondaryText,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Material(
                          color: theme.primary,
                          borderRadius: BorderRadius.circular(18),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: _sendMessage,
                            child: const SizedBox(
                              width: 54,
                              height: 54,
                              child: Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PremiumBottomNav(
                  items: const [
                    PremiumBottomNavItem(
                      label: 'Home',
                      icon: Icons.home_rounded,
                    ),
                    PremiumBottomNavItem(
                      label: 'Community',
                      icon: Icons.groups_rounded,
                    ),
                    PremiumBottomNavItem(
                      label: 'Map',
                      icon: Icons.map_rounded,
                    ),
                    PremiumBottomNavItem(
                      label: 'AI',
                      icon: Icons.auto_awesome_rounded,
                    ),
                    PremiumBottomNavItem(
                      label: 'Profile',
                      icon: Icons.person_rounded,
                    ),
                  ],
                  currentIndex: 3,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        context.pushNamed(HomeScreenWidget.routeName);
                        return;
                      case 1:
                        context.pushNamed(CommunityWidget.routeName);
                        return;
                      case 2:
                        context.pushNamed(MapWidget.routeName);
                        return;
                      case 3:
                        return;
                      case 4:
                        context.pushNamed(ProfileScreenWidget.routeName);
                        return;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


