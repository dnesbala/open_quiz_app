import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomElevatedButton(
      {Key? key,
      required this.text,
      this.color = Colors.indigo,
      this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            FaIcon(icon, size: 18),
            SizedBox(width: 10),
          ],
          Text(text),
        ],
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        primary: color,
      ),
    );
  }
}
