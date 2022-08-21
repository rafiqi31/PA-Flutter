import 'package:aquascaper_app/widgets/auto_button.dart';
import 'package:aquascaper_app/widgets/manual_button.dart';
import 'package:flutter/material.dart';

class CardTwo extends StatelessWidget {
  final String txtTitle;
  final Color sideColor;
  final Color roundColor;

  CardTwo({
    this.txtTitle,
    this.sideColor,
    this.roundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 3,
          color: sideColor ?? Colors.blue,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.lens,
                size: 20,
                color: roundColor,
              ),
            ),
            Text(
              txtTitle ?? "",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: [
                SmallButton('Auto'),
                SizedBox(
                  height: 8,
                ),
                ManualButton('Manual'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
