import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_input_formatters.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/core/shared/app_text_field.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key, required this.onSubmit});
  final void Function(String val) onSubmit;
  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  String text = "";

  List<FocusNode> nodes = [FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode(), FocusNode()];
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children:
          nodes
              .map(
                (e) => Expanded(
                  child: AppTextField.border(
                    focusNode: e,
                    controller: controllers[nodes.indexOf(e)],
                    inputFormatters: AppInputFormatters().otp,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onTap: () {
                      for (var e in controllers) {
                        e.clear();
                      }
                      FocusScope.of(context).requestFocus(nodes.first);
                    },
                    onChanged: (val) {
                      setState(() {
                        text = controllers.map((e) => e.text).join();
                      });
                      final index = nodes.indexOf(e);
                      if (val.isNotEmpty && index < nodes.length) {
                        _moveToNextFocus(nodes.indexOf(e));
                      } else {
                        _moveToPreviousFocus(nodes.indexOf(e));
                      }
                      if (text.length.isEquals(nodes.length)) {
                        widget.onSubmit(text);
                      }
                    },
                  ),
                ),
              )
              .toList(),
    );
  }

  void _moveToNextFocus(int index) {
    if (index < nodes.length - 1) {
      FocusScope.of(context).requestFocus(nodes[index + 1]);
    }
  }

  void _moveToPreviousFocus(int index) {
    if (index != 0) {
      FocusScope.of(context).requestFocus(nodes[index - 1]);
    }
  }
}
