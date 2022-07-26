import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/noInternet.PNG',
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(height: 10),
              noInternet()
            ],
          ),
        ),
      ),
    );
  }
}
