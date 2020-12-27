import 'package:flutter/material.dart';

class LoanProcessSection extends StatelessWidget {
  const LoanProcessSection();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 100,
      width: double.infinity,
      child: Center(
        child: Text(
          'Loan Process',
        ),
      ),
    );
  }
}
