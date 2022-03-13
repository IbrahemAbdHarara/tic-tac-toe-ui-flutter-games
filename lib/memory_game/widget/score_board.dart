import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget scoreBoard(String title, String info) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(26.0),
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 124, 97, 14)),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            info,
            style: const TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 233, 176, 4)),
          )
        ],
      ),
    ),
  );
}
