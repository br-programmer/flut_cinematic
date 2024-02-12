import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicSearchTextField extends FlutCinematicTextField {
  const FlutCinematicSearchTextField({
    required this.duration,
    super.key,
    super.onChanged,
    super.hintText,
    super.minLines,
    super.maxLines,
    super.lines,
    super.formatters = const [],
    super.maxLength,
    super.focusNode,
    super.title,
    super.optionalText,
    super.validator,
    super.autovalidateMode,
    super.borderSide,
    super.textAlign,
    super.fillColor,
    super.verticalPadding,
    super.textStyle,
    super.obscureText,
    super.hasError,
    super.readOnly,
    super.initialValue,
    super.error,
    super.autofocus,
    super.enable,
    super.hintTextColor,
    super.onTooltip,
    super.onSubmitted,
    super.textInputAction,
    super.suffixIcon,
    super.keyboardType,
    super.isDense,
    super.autocorrect,
    super.padding,
  });

  final Duration duration;

  @override
  State<FlutCinematicSearchTextField> createState() =>
      _FlutCinematicSearchTextFieldState();
}

class _FlutCinematicSearchTextFieldState
    extends State<FlutCinematicSearchTextField> {
  late final debouncer = Debouncer(duration: widget.duration);
  late final controller = TextEditingController();

  void onChanged(String value) {
    debouncer.run(() {
      widget.onChanged?.call(value);
    });
  }

  @override
  void dispose() {
    debouncer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutCinematicTextField(
      onChanged: onChanged,
      hintText: widget.hintText,
      controller: controller,
      prefixIcon: FlutCinematicIcons.search,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      lines: widget.lines,
      formatters: widget.formatters,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      title: widget.title,
      optionalText: widget.optionalText,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      borderSide: widget.borderSide,
      textAlign: widget.textAlign,
      fillColor: widget.fillColor,
      verticalPadding: widget.verticalPadding,
      textStyle: widget.textStyle,
      obscureText: widget.obscureText,
      hasError: widget.hasError,
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      error: widget.error,
      autofocus: widget.autofocus,
      enable: widget.enable,
      hintTextColor: widget.hintTextColor,
      onTooltip: widget.onTooltip,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      isDense: widget.isDense,
      autocorrect: widget.autocorrect,
      padding: widget.padding,
      suffixIcon: FlutCinematicIconButton(
        icon: const Icon(Icons.clear, color: Palette.white),
        onPressed: () {
          widget.onChanged?.call('');
          controller.clear();
        },
      ),
    );
  }
}
