import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mangecharityadmain_widget.dart' show MangecharityadmainWidget;
import 'package:flutter/material.dart';

class MangecharityadmainModel
    extends FlutterFlowModel<MangecharityadmainWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}


