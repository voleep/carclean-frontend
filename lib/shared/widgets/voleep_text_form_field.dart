import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoleepTextFormField extends StatefulWidget {
  static const double defaultHeight = 75;

  const VoleepTextFormField({
    Key? key,
    required this.placeholder,
    this.initialValue,
    this.enabled,
    this.readOnly = false,
    this.onTap,
    this.width,
    this.focusNode,
    this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
  }) : super(key: key);

  final String? initialValue;
  final bool? enabled;
  final bool readOnly;
  final void Function()? onTap;
  final double? width;
  final FocusNode? focusNode;
  final String placeholder;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final int? minLines;
  final int? maxLines;
  final void Function(String)? onChanged;

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

    return Container(
      padding: const EdgeInsets.only(right: 5, bottom: 5, left: 5),
      height: VoleepTextFormField.defaultHeight,
      width: widget.width,
      child: TextFormField(
        initialValue: widget.initialValue,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        textAlignVertical: TextAlignVertical.top,
        focusNode: widget.focusNode,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 1.2,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant)),
          icon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 1.0,
                    heightFactor: 10.0,
                    child: Icon(
                      widget.icon,
                      size: 25,
                      color: outlineColor,
                    ),
                  ),
                )
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
          suffixIconConstraints: const BoxConstraints(maxHeight: 35),
          suffixIconColor: outlineColor,
          alignLabelWithHint: true,
          label: Text(
            widget.placeholder,
            style: TextStyle(
              color: outlineColor,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          contentPadding: const EdgeInsets.only(bottom: 3),
          errorStyle: const TextStyle(fontSize: 12, height: 0.6),
        ),
        cursorHeight: 18,
        obscureText: _obscureText,
        enableSuggestions: widget.enableSuggestions,
        validator: widget.validator,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        autofillHints: widget.autofillHints,
        scrollPadding: const EdgeInsets.only(bottom: 95),
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
      ),
    );
  }
}
