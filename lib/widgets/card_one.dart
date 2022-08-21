import 'package:flutter/material.dart';

class CardOne extends StatelessWidget {
  final String txtTitle;
  final String txtDesc;
  final Color bgColor;
  final String page;

  CardOne({
    this.txtTitle,
    this.txtDesc,
    this.bgColor,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, page),
      child: Card(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                txtTitle ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32),
              Text(
                txtDesc ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
