import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'inside_big_campaign_widget.dart' show InsideBigCampaignWidget;
import 'package:flutter/material.dart';

class InsideBigCampaignModel extends FlutterFlowModel<InsideBigCampaignWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for campaignname widget.
  FocusNode? campaignnameFocusNode;
  TextEditingController? campaignnameTextController;
  String? Function(BuildContext, String?)? campaignnameTextControllerValidator;
  // State field(s) for Donationamount widget.
  FocusNode? donationamountFocusNode;
  TextEditingController? donationamountTextController;
  String? Function(BuildContext, String?)?
      donationamountTextControllerValidator;
  // State field(s) for paymentmethod widget.
  FormFieldController<String>? paymentmethodValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    campaignnameFocusNode?.dispose();
    campaignnameTextController?.dispose();

    donationamountFocusNode?.dispose();
    donationamountTextController?.dispose();
  }

  /// Additional helper methods.
  String? get paymentmethodValue => paymentmethodValueController?.value;
}


