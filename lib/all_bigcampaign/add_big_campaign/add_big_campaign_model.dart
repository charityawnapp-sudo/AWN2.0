import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_big_campaign_widget.dart' show AddBigCampaignWidget;
import 'package:flutter/material.dart';

class AddBigCampaignModel extends FlutterFlowModel<AddBigCampaignWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploadingUpdateCampaignImg = false;
  FFUploadedFile uploadedLocalFileUpdateCampaignImg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrlUpdateCampaignImg = '';

  // State field(s) for EnterCampaignname widget.
  FocusNode? enterCampaignnameFocusNode;
  TextEditingController? enterCampaignnameTextController;
  String? Function(BuildContext, String?)?
      enterCampaignnameTextControllerValidator;
  // State field(s) for Targettext widget.
  FocusNode? targettextFocusNode;
  TextEditingController? targettextTextController;
  String? Function(BuildContext, String?)? targettextTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterCampaignnameFocusNode?.dispose();
    enterCampaignnameTextController?.dispose();

    targettextFocusNode?.dispose();
    targettextTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}


