import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_complate_widget.dart' show ProfileComplateWidget;
import 'package:flutter/material.dart';

class ProfileComplateModel extends FlutterFlowModel<ProfileComplateWidget> {
  ///  Local state fields for this page.

  ProfilesRow? userProfile;

  ///  State fields for stateful widgets in this page.

  bool isDataUploadingUploadImg = false;
  FFUploadedFile uploadedLocalFileUploadImg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrlUploadImg = '';

  bool isDataUploadingPic = false;
  FFUploadedFile uploadedLocalFilePic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrlPic = '';

  // State field(s) for profile_name widget.
  FocusNode? profileNameFocusNode;
  TextEditingController? profileNameTextController;
  String? Function(BuildContext, String?)? profileNameTextControllerValidator;
  // State field(s) for profile_phone widget.
  FocusNode? profilePhoneFocusNode;
  TextEditingController? profilePhoneTextController;
  String? Function(BuildContext, String?)? profilePhoneTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    profileNameFocusNode?.dispose();
    profileNameTextController?.dispose();

    profilePhoneFocusNode?.dispose();
    profilePhoneTextController?.dispose();
  }
}


