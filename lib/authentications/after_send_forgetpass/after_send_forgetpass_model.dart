import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'after_send_forgetpass_widget.dart' show AfterSendForgetpassWidget;
import 'package:flutter/material.dart';

class AfterSendForgetpassModel
    extends FlutterFlowModel<AfterSendForgetpassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - supabaseSendPasswordResetOtp] action in Button widget.
  bool? resendSuccess;
  // Stores action output result for [Custom Action - supabaseFlexibleVerifyOTP] action in Button widget.
  bool? isVerified;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}


