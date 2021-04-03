import 'package:flutter/material.dart';

class ButtonDias extends StatelessWidget {
  ButtonDias(this.text, {this.color, this.onTap, this.size});

  Color color;
  final VoidCallback onTap;
  final double size;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(140, 40, 140, 40),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size ?? 28,
                  //color: onTap != null ? color : Colors.grey[400],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
