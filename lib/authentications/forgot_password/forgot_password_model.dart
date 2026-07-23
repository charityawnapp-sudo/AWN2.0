import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for forgotPasswordEmil widget.
  FocusNode? forgotPasswordEmilFocusNode;
  TextEditingController? forgotPasswordEmilTextController;
  String? Function(BuildContext, String?)?
      forgotPasswordEmilTextControllerValidator;
  // Stores action output result for [Custom Action - supabaseSendPasswordResetOtp] action in Button widget.
  bool? result;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    forgotPasswordEmilFocusNode?.dispose();
    forgotPasswordEmilTextController?.dispose();
  }
}


