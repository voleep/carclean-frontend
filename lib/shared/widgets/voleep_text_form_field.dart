import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voleep_carclean_frontend/core/extensions/theme_extension.dart';

class VoleepTextFormField extends StatefulWidget {
  static const double defaultHeight = 70;

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
    this.formatters,
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
  final List<TextInputFormatter>? formatters;
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
  bool _touched = false;
  late FocusNode _focusNode;
  late GlobalKey<FormFieldState<String>> _fieldKey;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _fieldKey = GlobalKey();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && !_touched) {
        _fieldKey.currentState?.validate();

        setState(() {
          _touched = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelColor = context.colorScheme.outline.withOpacity(0.8);

    final labelStyle = MaterialStateTextStyle.resolveWith((states) {
      final style = TextStyle(
        color: labelColor,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      );

      if (states.contains(MaterialState.error)) {
        return style.copyWith(
          color: context.colorScheme.error,
        );
      }
      if (states.contains(MaterialState.focused)) {
        return style.copyWith(
          color: context.colorScheme.tertiary,
        );
      }

      return style;
    });

    return SizedBox(
      height: VoleepTextFormField.defaultHeight,
      width: widget.width,
      child: TextFormField(
        key: _fieldKey,
        initialValue: widget.initialValue,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        textAlignVertical: TextAlignVertical.top,
        focusNode: _focusNode,
        decoration: InputDecoration(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.7,
              color: context.colorScheme.error,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.7,
              color: labelColor.withOpacity(0.5),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.8,
              color: context.colorScheme.tertiary,
            ),
          ),
          icon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    heightFactor: 0.5,
                    widthFactor: 0.8,
                    child: Icon(
                      widget.icon,
                      size: 25,
                      color: labelColor,
                    ),
                  ),
                )
              : null,
          suffixIcon: widget.obscureText
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    iconSize: 20,
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                )
              : widget.suffixIcon,
          suffixIconColor: labelColor,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 35,
            maxWidth: 35,
          ),
          alignLabelWithHint: true,
          labelText: widget.placeholder,
          labelStyle: labelStyle,
          floatingLabelStyle: labelStyle,
          contentPadding: const EdgeInsets.only(
            bottom: 1,
          ),
          errorStyle: const TextStyle(fontSize: 12, height: 0.6),
        ),
        style: const TextStyle(
          height: 1.3,
          fontSize: 16,
        ),
        obscureText: _obscureText,
        enableSuggestions: widget.enableSuggestions,
        validator: widget.validator,
        controller: widget.controller,
        inputFormatters: widget.formatters,
        keyboardType: widget.keyboardType,
        autofillHints: widget.autofillHints,
        scrollPadding: const EdgeInsets.only(bottom: 95),
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        onChanged: (value) {
          if (_touched) {
            _fieldKey.currentState?.validate();
          }

          widget.onChanged?.call(value);
        },
        onTapOutside: (_) {
          _focusNode.unfocus();
        },
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
