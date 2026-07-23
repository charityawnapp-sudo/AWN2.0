import '/flutter_flow/flutter_flow_util.dart';
import 'edit_big_campaignadmin_widget.dart' show EditBigCampaignadminWidget;
import 'package:flutter/material.dart';

class EditBigCampaignadminModel
    extends FlutterFlowModel<EditBigCampaignadminWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploadingUpdateCampaignImages = false;
  FFUploadedFile uploadedLocalFileUpdateCampaignImages =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrlUpdateCampaignImages = '';

  // State field(s) for EnterCampaignname widget.
  FocusNode? enterCampaignnameFocusNode;
  TextEditingController? enterCampaignnameTextController;
  String? Function(BuildContext, String?)?
      enterCampaignnameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterCampaignnameFocusNode?.dispose();
    enterCampaignnameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}


