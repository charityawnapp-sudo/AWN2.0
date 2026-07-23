import '/flutter_flow/flutter_flow_util.dart';
import '/ui/ai_navigation.dart';
import 'ai_assistance_widget.dart' show AiAssistanceWidget;
import 'package:flutter/material.dart';

class AiChatMessage {
  const AiChatMessage({
    required this.text,
    required this.isUser,
    this.actions = const [],
  });

  final String text;
  final bool isUser;
  final List<AiNavigationAction> actions;
}

class AiAssistanceModel extends FlutterFlowModel<AiAssistanceWidget> {
  ///  Local state fields for this page.

  List<AiChatMessage> chatMessages = [];
  void addToChatMessages(AiChatMessage item) => chatMessages.add(item);
  void removeFromChatMessages(AiChatMessage item) => chatMessages.remove(item);
  void removeAtIndexFromChatMessages(int index) => chatMessages.removeAt(index);
  void insertAtIndexInChatMessages(int index, AiChatMessage item) =>
      chatMessages.insert(index, item);
  void updateChatMessagesAtIndex(int index, Function(AiChatMessage) updateFn) =>
      chatMessages[index] = updateFn(chatMessages[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - groqChat] action in IconButton widget.
  String? groqai;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}


