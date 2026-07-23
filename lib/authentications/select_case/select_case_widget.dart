import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui/premium_ui.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_case_model.dart';
export 'select_case_model.dart';

class SelectCaseWidget extends StatefulWidget {
  const SelectCaseWidget({super.key});

  static String routeName = 'SelectCase';
  static String routePath = '/UserAdmin';

  @override
  State<SelectCaseWidget> createState() => _SelectCaseWidgetState();
}

class _SelectCaseWidgetState extends State<SelectCaseWidget> {
  late SelectCaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCaseModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
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
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: PremiumSurface(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 132,
                          height: 132,
                          decoration: BoxDecoration(
                            color: theme.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(36),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(36),
                            child: Image.asset(
                              'awn2.0-NewIcon/AWN2.0-icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Choose your space',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: theme.primaryText,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Continue as a user or open the admin experience in a polished, focused workspace.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14.5,
                            height: 1.5,
                            color: theme.secondaryText,
                          ),
                        ),
                        const SizedBox(height: 28),
                        FFButtonWidget(
                          onPressed: () async {
                            context.goNamed(SignInWidget.routeName);
                          },
                          text: 'Continue as User',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56,
                            color: theme.primary,
                            textStyle: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        const SizedBox(height: 12),
                        FFButtonWidget(
                          onPressed: () async {
                            context.goNamed(SignInAdminWidget.routeName);
                          },
                          text: 'Continue as Admin',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56,
                            color: theme.secondaryBackground,
                            textStyle: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: theme.primaryText,
                            ),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: theme.alternate.withValues(alpha: 0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


