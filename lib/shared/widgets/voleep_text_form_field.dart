import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoleepTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final String placeholder;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const VoleepTextFormField(
      {Key? key,
      required this.placeholder,
      this.focusNode,
      this.icon,
      this.suffixIcon,
      this.obscureText = false,
      this.enableSuggestions = true,
      this.validator,
      this.controller,
      this.inputFormatters})
      : super(key: key);

  @override
  State<VoleepTextFormField> createState() => _VoleepTextFormFieldState();
}

class _VoleepTextFormFieldState extends State<VoleepTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.obscureText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color outlineColor = Theme.of(context).colorScheme.outline;

    return SizedBox(
      height: 75,
      child: TextFormField(
        focusNode: widget.focusNode,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 10),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant)),
          icon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Icon(
                    widget.icon,
                    size: 25,
                    color: outlineColor,
                  ),
                )
              : null,
          suffixIcon: Visibility(
            visible: widget.obscureText,
            child: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          suffixIconColor: outlineColor,
          alignLabelWithHint: true,
          labelText: widget.placeholder,
          labelStyle:
              TextStyle(color: outlineColor, fontWeight: FontWeight.w500),
          isDense: true,
          errorStyle: const TextStyle(fontSize: 12, height: 0.6),
        ),
        obscureText: _obscureText,
        enableSuggestions: widget.enableSuggestions,
        validator: widget.validator,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
