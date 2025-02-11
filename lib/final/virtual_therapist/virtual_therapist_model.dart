import '/flutter_flow/flutter_flow_util.dart';
import 'virtual_therapist_widget.dart' show VirtualTherapistWidget;
import 'package:flutter/material.dart';

class VirtualTherapistModel extends FlutterFlowModel<VirtualTherapistWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
