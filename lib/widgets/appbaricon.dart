// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../core/constants.dart';

class AppBarIcon extends StatelessWidget {
  AppBarIcon(this.icon, this.text, Null Function() param2, {super.key});
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 18,
        bottom: 18,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 50,
            height: 45,
            child: Material(
                color: icons,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Icon(
                  icon,
                  size: 30.0,
                  color: Colors.white,
                )),
          ),
          Text(text, style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
