import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';

class WidgetMenuProfile extends StatelessWidget {
  final Icon leadingIcon, trailingIcon;
  final String title;
  final VoidCallback? onTap;

  const WidgetMenuProfile({
    super.key, 
    required this.leadingIcon, 
    required this.trailingIcon, 
    required this.title, 
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon.icon, color: lightColorScheme.surface),
      title: Text(
        title,
        style: TextStyle(color: lightColorScheme.surface),
      ),
      trailing: Icon(trailingIcon.icon, color: Colors.grey),
      onTap: onTap,
    );
  }
}
