import 'dart:async';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/ui/premium_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = '/splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  late SplashScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _navigationTimer = Timer(const Duration(milliseconds: 3000), () {
        if (mounted) {
          context.goNamed(OnBoardingWidget.routeName);
        }
      });
    });

    animationsMap.addAll({
      'contentOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOutCubic,
            delay: 0.0.ms,
            duration: 520.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _model.dispose();
    super.dispose();
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: PremiumSurface(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: theme.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'awn2.0-NewIcon/AWN2.0-icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).animateOnPageLoad(
                        animationsMap['contentOnPageLoadAnimation']!,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'AWN',
                        style: GoogleFonts.manrope(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          color: theme.primaryText,
                          letterSpacing: -0.6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Premium charitable giving and volunteering experience',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 14.5,
                          height: 1.5,
                          color: theme.secondaryText,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Launching your experience…',
                        style: GoogleFonts.inter(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: theme.primary,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                  animationsMap['contentOnPageLoadAnimation']!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


