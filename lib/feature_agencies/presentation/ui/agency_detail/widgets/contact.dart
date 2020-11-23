import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'CONTACT AGENCY',
          ),
        ),
      ),
    );
  }
}
