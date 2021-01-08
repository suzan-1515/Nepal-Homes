import 'package:flutter/material.dart';

class HomeLoanOption extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChange;

  const HomeLoanOption({Key key, this.value, this.onChange}) : super(key: key);

  @override
  _HomeLoanOptionState createState() => _HomeLoanOptionState();
}

class _HomeLoanOptionState extends State<HomeLoanOption> {
  bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant HomeLoanOption oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (this._value != oldWidget.value) {
      this._value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _value,
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      onChanged: (value) {
        widget.onChange(value);
        setState(() {
          this._value = value;
        });
      },
      title: Text('I am interested in Home Loans'),
    );
  }
}
