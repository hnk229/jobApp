import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Key? fieldKey;
  final TextEditingController? controller;
  final Icon? icon;
  final Icon? prefixIcon;
  final String? obscuringCharacter;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final String? labelText;
  final String? Function(String?) validator;
  final int? maxLine;
  final TextAlignVertical? textAlign;

  const CustomTextFormField({
    super.key,
    this.fieldKey,
    this.controller,
    this.keyboardType,
    required this.hintText,
    required this.validator,
    this.icon,
    this.prefixIcon,
    this.obscuringCharacter = "*",
    this.obscureText = false,
    this.labelText,
    this.maxLine = 1, 
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // Récupérer le thème actuel (clair ou sombre)
    var brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    // Définir les couleurs en fonction du mode
    Color borderColor = Colors.black12;
    Color labelColor = lightColorScheme.surface;
    Color hintColor = Colors.black54;
    Color iconColor = Colors.grey;
    Color textColor = lightColorScheme.surface; // Couleur du texte saisi
    return TextFormField(
      key: fieldKey,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      maxLines: maxLine,
      obscuringCharacter: obscuringCharacter!,
      textAlignVertical: textAlign,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon!.icon, color: iconColor)
            : null,
        suffixIcon: icon != null ? Icon(icon!.icon, color: iconColor) : null,
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: lightColorScheme.surface), // Bordure colorée lors du focus
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
