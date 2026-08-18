import 'package:flutter/material.dart';

mixin TextEditCtrlHelper {
  FocusNode? accountFocusNode = FocusNode();
  FocusNode? pwdFocusNode = FocusNode();
  TextEditingController? accountTextEditCtrl = TextEditingController();
  TextEditingController? pwdTextEditCtrl = TextEditingController();

  void initTextEditHelper() {
    if (accountFocusNode != null) {
      accountFocusNode?.unfocus();
      accountFocusNode = null;
    }
    if (pwdFocusNode != null) {
      pwdFocusNode?.unfocus();
      pwdFocusNode = null;
    }
  }

  void disposeTextEditHelper() {
    if (accountFocusNode != null) {
      accountFocusNode?.dispose();
      accountFocusNode = null;
    }
    if (pwdFocusNode != null) {
      pwdFocusNode?.unfocus();
      pwdFocusNode = null;
    }
    if (accountTextEditCtrl != null) {
      accountTextEditCtrl?.dispose();
      accountTextEditCtrl = null;
    }
    if (pwdTextEditCtrl != null) {
      pwdTextEditCtrl?.dispose();
      pwdTextEditCtrl = null;
    }
  }
}
