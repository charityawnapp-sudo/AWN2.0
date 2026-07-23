import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notificatiofailed_model.dart';
export 'notificatiofailed_model.dart';

/// Create a componentCreate a login error message component for my app.
///
/// Show this component only when the email or password is invalid.
///
/// Style should match a modern, minimal app design.
///
/// Use a Container with:
///
/// Rounded corners
///
/// Light red background (#FFE5E5)
///
/// Red border (#FF4D4D, thickness 1)
///
/// Padding: 12
///
/// Inside the container, add a Row with:
///
/// A small error icon (material icon “error_outline”, color #FF4D4D, size
/// 20).
///
/// Spacing of 8 px.
///
/// Text widget that says:
///
/// “Invalid email or password. Please try again.”
///
/// Style: font size 14, weight medium, color #FF4D4D.
///
/// Make the whole component responsive (full width on small screens, max
/// width 320 on larger screens).
///
/// Add a small fade-in animation when it appears.
///
/// Allow me to trigger its visibility with a boolean state (e.g. showError =
/// true).
///
/// Keep the component reusable so I can place it in other pages if needed.
class NotificatiofailedWidget extends StatefulWidget {
  const NotificatiofailedWidget({super.key});

  @override
  State<NotificatiofailedWidget> createState() =>
      _NotificatiofailedWidgetState();
}

class _NotificatiofailedWidgetState extends State<NotificatiofailedWidget> {
  late NotificatiofailedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificatiofailedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5E5),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: const Color(0xFFFF4D4D),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Color(0xFFFF4D4D),
                  size: 20.0,
                ),
                Expanded(
                  child: Text(
                    'please fill the fileds you are missed',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: const Color(0xFFFF4D4D),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ].divide(const SizedBox(width: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}


