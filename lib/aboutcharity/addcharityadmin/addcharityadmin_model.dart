import '/flutter_flow/flutter_flow_util.dart';
import 'addcharityadmin_widget.dart' show AddcharityadminWidget;
import 'package:flutter/material.dart';

class AddcharityadminModel extends FlutterFlowModel<AddcharityadminWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploadingUploadCharityImg = false;
  FFUploadedFile uploadedLocalFileUploadCharityImg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrlUploadCharityImg = '';

  // State field(s) for EnterCharity widget.
  FocusNode? enterCharityFocusNode1;
  TextEditingController? enterCharityTextController1;
  String? Function(BuildContext, String?)? enterCharityTextController1Validator;
  // State field(s) for EnterLocation widget.
  FocusNode? enterLocationFocusNode1;
  TextEditingController? enterLocationTextController1;
  String? Function(BuildContext, String?)?
      enterLocationTextController1Validator;
  // State field(s) for EnterCharity widget.
  FocusNode? enterCharityFocusNode2;
  TextEditingController? enterCharityTextController2;
  String? Function(BuildContext, String?)? enterCharityTextController2Validator;
  // State field(s) for EnterCharity widget.
  FocusNode? enterCharityFocusNode3;
  TextEditingController? enterCharityTextController3;
  String? Function(BuildContext, String?)? enterCharityTextController3Validator;
  // State field(s) for EnterLocation widget.
  FocusNode? enterLocationFocusNode2;
  TextEditingController? enterLocationTextController2;
  String? Function(BuildContext, String?)?
      enterLocationTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterCharityFocusNode1?.dispose();
    enterCharityTextController1?.dispose();

    enterLocationFocusNode1?.dispose();
    enterLocationTextController1?.dispose();

    enterCharityFocusNode2?.dispose();
    enterCharityTextController2?.dispose();

    enterCharityFocusNode3?.dispose();
    enterCharityTextController3?.dispose();

    enterLocationFocusNode2?.dispose();
    enterLocationTextController2?.dispose();
  }
}


