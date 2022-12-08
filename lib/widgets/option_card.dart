import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.option});
  final String option;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(option, style: TextStyle(
          fontSize: 22.0,
        )),
      )
    );
  }
}