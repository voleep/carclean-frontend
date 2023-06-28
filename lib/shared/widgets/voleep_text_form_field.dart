import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoleepTextFormField extends StatefulWidget {
  final bool? enabled;
  final FocusNode? focusNode;
  final String placeholder;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const VoleepTextFormField({
    Key? key,
    required this.placeholder,
    this.enabled,
    this.focusNode,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
  }) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 75,
        child: TextFormField(
          enabled: widget.enabled,
          textAlignVertical: TextAlignVertical.bottom,
          focusNode: widget.focusNode,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, height: 1),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outlineVariant)),
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
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            suffixIconColor: outlineColor,
            alignLabelWithHint: true,
            labelText: widget.placeholder,
            labelStyle: TextStyle(color: outlineColor, fontWeight: FontWeight.w500, height: -.1),
            isDense: true,
            errorStyle: const TextStyle(fontSize: 12, height: 0.6),
          ),
          cursorHeight: 18,
          obscureText: _obscureText,
          enableSuggestions: widget.enableSuggestions,
          validator: widget.validator,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
        ),
      ),
    );
  }
}
