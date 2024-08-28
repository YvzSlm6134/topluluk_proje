import 'package:flutter/material.dart';
import 'package:topluluk_proje/common/colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "The Bear is here!",
              style: TextStyle(fontSize: 40, color: titlecolor),
            ),
          ),
        ],
      ),
    );
  }
}
