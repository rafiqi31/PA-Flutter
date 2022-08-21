import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String text;

  SmallButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE4E4E4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
