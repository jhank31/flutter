import 'package:flutter/material.dart';


class TextoString extends StatelessWidget {
  final void Function(String)? onChanged;
  final String labelText;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? textController;
  final String mensaje;
  final String? hintText;
  final bool? readOnly;
  final FocusNode? focusNode;

  const TextoString(
      {Key? key,
      required this.onChanged,
      required this.labelText,
      this.minLines,
      this.maxLines,
      this.textController,
      required this.mensaje,
      this.hintText,
      this.readOnly,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: textController,
      focusNode: focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: labelText,
        hintText: hintText,
      ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (valor) {
      //   if (valor!.length < 1) {
      //     return mensaje;
      //   } else {
      //     return null;
      //   }
      // },
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      readOnly: readOnly == null ? false : readOnly!,
    );
  }
}
