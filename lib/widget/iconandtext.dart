import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  IconData icon;
  String text;
  IconAndText(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Container(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
