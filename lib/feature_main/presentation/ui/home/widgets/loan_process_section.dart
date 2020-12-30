import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoanProcessSection extends StatelessWidget {
  const LoanProcessSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Easy Loan Process',
            style: theme.textTheme.subtitle1.copyWith(
                color: theme.accentColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            'NepalHomes offers buyer to easy home loan processing.',
            style: theme.textTheme.bodyText2
                .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Column(
            children: [
              const LoanProcessStepItem(
                text: 'Get Informed on readily available home loan schemes',
                icon: LineAwesomeIcons.dollar_sign,
                index: '1',
              ),
              const LoanProcessStepItem(
                text: 'Calculate and compare EMI using our tools',
                icon: LineAwesomeIcons.horizontal_sliders,
                index: '2',
              ),
              const LoanProcessStepItem(
                text: 'Choose the bank you want to apply for',
                icon: LineAwesomeIcons.university,
                index: '3',
              ),
              const LoanProcessStepItem(
                text: 'Fill up the form and Submit your application',
                icon: LineAwesomeIcons.wpforms,
                index: '4',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoanProcessStepItem extends StatelessWidget {
  const LoanProcessStepItem({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.index,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        width: 32,
        height: 32,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.highlightColor,
        ),
        alignment: Alignment.center,
        child: Text(index,style: theme.textTheme.caption.copyWith(fontWeight: FontWeight.bold),),
      ),
      contentPadding: const EdgeInsets.all(0),
      title: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.primaryColor,
                ),
                padding: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: theme.backgroundColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: theme.textTheme.bodyText2
                    .copyWith(color: Color.fromARGB(255, 145, 152, 161)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
