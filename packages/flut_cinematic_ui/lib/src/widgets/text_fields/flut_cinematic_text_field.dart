import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutCinematicTextField extends StatefulWidget {
  const FlutCinematicTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.title,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide = BorderSide.none,
    this.textAlign = TextAlign.start,
    this.fillColor = Palette.grey,
    this.verticalPadding = 12,
    this.textStyle,
    this.obscureText = false,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.textInputAction,
    this.suffixIcon,
    this.keyboardType,
    this.isDense = false,
    this.autocorrect = true,
    this.padding = edgeInsetsZero,
  });

  const FlutCinematicTextField.password({
    super.key,
    this.onChanged,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.title,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide = BorderSide.none,
    this.textAlign = TextAlign.start,
    this.fillColor = Palette.grey,
    this.verticalPadding = 12,
    this.textStyle,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.isDense = false,
    this.autocorrect = true,
    this.padding = edgeInsetsZero,
  })  : obscureText = true,
        suffixIcon = null;

  final ValueChanged<String>? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final int? lines;
  final List<TextInputFormatter> formatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? title;
  final String? optionalText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final BorderSide borderSide;
  final TextAlign textAlign;
  final Color fillColor;
  final double verticalPadding;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool hasError;
  final bool readOnly;
  final String? initialValue;
  final Widget? error;
  final bool autofocus;
  final bool enable;
  final Color? hintTextColor;
  final VoidCallback? onTooltip;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isDense;
  final bool autocorrect;
  final EdgeInsetsGeometry padding;

  @override
  State<FlutCinematicTextField> createState() => _FlutCinematicTextFieldState();
}

class _FlutCinematicTextFieldState extends State<FlutCinematicTextField> {
  late final focusNode = widget.focusNode ?? FocusNode();
  late final obscureText = ValueNotifier<bool>(widget.obscureText);

  @override
  void dispose() {
    focusNode.dispose();
    obscureText.dispose();
    super.dispose();
  }

  OutlineInputBorder _inputBorder({
    Color? color,
    BorderSide? borderSide,
  }) {
    return OutlineInputBorder(
      borderRadius: borderRadius16,
      borderSide: borderSide ?? BorderSide(color: color ?? Palette.dark),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefixIcon = widget.prefixIcon;
    final suffixIcon = getSuffixIcon();

    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
            gap8,
          ],
          ValueListenableBuilder(
            valueListenable: obscureText,
            builder: (context, value, child) => TextFormField(
              autofocus: widget.autofocus,
              autocorrect: widget.autocorrect,
              initialValue: widget.initialValue,
              readOnly: widget.readOnly,
              onFieldSubmitted: widget.onSubmitted,
              obscuringCharacter: '*',
              obscureText: obscureText.value,
              onChanged: widget.onChanged,
              focusNode: widget.focusNode ?? focusNode,
              controller: widget.controller,
              validator: widget.validator,
              enabled: widget.enable,
              keyboardType: widget.keyboardType,
              autovalidateMode: widget.autovalidateMode,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                isDense: widget.isDense,
                fillColor: widget.fillColor,
                prefixIcon: prefixIcon == null
                    ? null
                    : FlutCinematicIcon(
                        width: 30,
                        icon: prefixIcon,
                        size: FlutCinematicIconSize.large,
                        fontWeight: AppFontWeight.regular,
                      ),
                border: _inputBorder(borderSide: widget.borderSide),
                hintText: widget.hintText,
                enabledBorder: _inputBorder(borderSide: widget.borderSide),
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: widget.hintTextColor ?? Palette.white.withOpacity(.8),
                ),
                errorStyle: context.textTheme.labelMedium?.copyWith(
                  color: Palette.red,
                ),
                labelStyle: context.textTheme.labelMedium,
                errorBorder: _inputBorder(color: Palette.red),
                focusedErrorBorder: _inputBorder(color: Palette.red),
                focusedBorder: _inputBorder(
                  color: widget.hasError
                      ? Palette.red
                      : context.theme.scaffoldBackgroundColor,
                ),
                suffixIcon: suffixIcon,
              ),
              textAlign: widget.textAlign,
              minLines: widget.lines ?? widget.minLines,
              maxLines:
                  widget.obscureText ? 1 : widget.lines ?? widget.maxLines,
              inputFormatters: [
                ...widget.formatters,
                LengthLimitingTextInputFormatter(widget.maxLength),
              ],
              style: widget.textStyle ??
                  context.textTheme.bodySmall?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
            ),
          ),
          if (widget.error != null) ...[
            gap4,
            widget.error!,
          ],
        ],
      ),
    );
  }

  Widget? getSuffixIcon() {
    Widget? suffixIcon;
    suffixIcon = widget.suffixIcon;
    if (widget.obscureText) {
      suffixIcon = ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, value, child) => FlutCinematicIconButton(
          onPressed: () => obscureText.value = !obscureText.value,
          // TODO(brprogrammer): change icon here
          iconData: value ? FlutCinematicIcons.eye : FlutCinematicIcons.eye,
          fontWeight: AppFontWeight.regular,
          size: FlutCinematicIconSize.medium,
          color: Palette.white.withOpacity(.7),
        ),
      );
    }
    return suffixIcon;
  }
}
