import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'addvolunteeradmin_widget.dart' show AddvolunteeradminWidget;
import 'package:flutter/material.dart';

class AddvolunteeradminModel extends FlutterFlowModel<AddvolunteeradminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for volunteername widget.
  FocusNode? volunteernameFocusNode;
  TextEditingController? volunteernameTextController;
  String? Function(BuildContext, String?)? volunteernameTextControllerValidator;
  // State field(s) for Volunteerdropdown widget.
  String? volunteerdropdownValue;
  FormFieldController<String>? volunteerdropdownValueController;
  // State field(s) for Volunteerplace widget.
  FocusNode? volunteerplaceFocusNode;
  TextEditingController? volunteerplaceTextController;
  String? Function(BuildContext, String?)?
      volunteerplaceTextControllerValidator;
  // State field(s) for VolunteerDescription widget.
  FocusNode? volunteerDescriptionFocusNode;
  TextEditingController? volunteerDescriptionTextController;
  String? Function(BuildContext, String?)?
      volunteerDescriptionTextControllerValidator;
  // State field(s) for Totalspot widget.
  FocusNode? totalspotFocusNode;
  TextEditingController? totalspotTextController;
  String? Function(BuildContext, String?)? totalspotTextControllerValidator;
  // State field(s) for UrlGroup widget.
  FocusNode? urlGroupFocusNode;
  TextEditingController? urlGroupTextController;
  String? Function(BuildContext, String?)? urlGroupTextControllerValidator;
  // State field(s) for Totalhours widget.
  FocusNode? totalhoursFocusNode;
  TextEditingController? totalhoursTextController;
  String? Function(BuildContext, String?)? totalhoursTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for EventDate widget.
  FocusNode? eventDateFocusNode;
  TextEditingController? eventDateTextController;
  String? Function(BuildContext, String?)? eventDateTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for StartTime widget.
  FocusNode? startTimeFocusNode;
  TextEditingController? startTimeTextController;
  String? Function(BuildContext, String?)? startTimeTextControllerValidator;
  DateTime? datePicked3;
  // State field(s) for Endtime widget.
  FocusNode? endtimeFocusNode;
  TextEditingController? endtimeTextController;
  String? Function(BuildContext, String?)? endtimeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    volunteernameFocusNode?.dispose();
    volunteernameTextController?.dispose();

    volunteerplaceFocusNode?.dispose();
    volunteerplaceTextController?.dispose();

    volunteerDescriptionFocusNode?.dispose();
    volunteerDescriptionTextController?.dispose();

    totalspotFocusNode?.dispose();
    totalspotTextController?.dispose();

    urlGroupFocusNode?.dispose();
    urlGroupTextController?.dispose();

    totalhoursFocusNode?.dispose();
    totalhoursTextController?.dispose();

    eventDateFocusNode?.dispose();
    eventDateTextController?.dispose();

    startTimeFocusNode?.dispose();
    startTimeTextController?.dispose();

    endtimeFocusNode?.dispose();
    endtimeTextController?.dispose();
  }
}


