import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_bigcamping_widget.dart' show AdminBigcampingWidget;
import 'package:flutter/material.dart';

class AdminBigcampingModel extends FlutterFlowModel<AdminBigcampingWidget> {
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


