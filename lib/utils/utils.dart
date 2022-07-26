import 'package:flutter/material.dart';

Center loading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Center error() {
  return const Center(
    child: Text('Something Went Wrong'),
  );
}

Center noInternet() {
  return const Center(
    child: Text(
      'No Internet Connection',
      textAlign: TextAlign.center,
      textScaleFactor: 2,
    ),
  );
}

SizedBox sheight(double height) {
  return SizedBox(
    height: height,
  );
}

Column TitleBody(String title, String body) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        body,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      sheight(15),
    ],
  );
}
