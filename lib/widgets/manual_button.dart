import 'package:flutter/material.dart';

class ManualButton extends StatelessWidget {
  final String text;

  ManualButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
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
          'Manual',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
