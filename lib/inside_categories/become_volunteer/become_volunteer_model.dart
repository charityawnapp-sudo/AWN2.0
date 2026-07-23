import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'become_volunteer_widget.dart' show BecomeVolunteerWidget;
import 'package:flutter/material.dart';

class BecomeVolunteerModel extends FlutterFlowModel<BecomeVolunteerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nametext widget.
  FocusNode? nametextFocusNode;
  TextEditingController? nametextTextController;
  String? Function(BuildContext, String?)? nametextTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for Emergency widget.
  FocusNode? emergencyFocusNode;
  TextEditingController? emergencyTextController;
  String? Function(BuildContext, String?)? emergencyTextControllerValidator;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // State field(s) for Timeslot widget.
  FormFieldController<String>? timeslotValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for checked widget.
  bool? checkedValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nametextFocusNode?.dispose();
    nametextTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emergencyFocusNode?.dispose();
    emergencyTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }

  /// Additional helper methods.
  String? get timeslotValue => timeslotValueController?.value;
}


