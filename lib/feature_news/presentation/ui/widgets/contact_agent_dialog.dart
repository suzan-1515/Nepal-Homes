import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/constants/api_url_constants.dart';
import 'package:nepal_homes/core/utils/link_utils.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:validators/validators.dart' as Validator;

class ContactAgentDialog extends StatefulWidget {
  final String agentName;
  final String agentAvatar;
  final String agencyName;
  final String agentContact;
  final String propertyId;
  final String propertyPrefix;

  const ContactAgentDialog({
    Key key,
    this.agentName,
    this.agentAvatar,
    this.agencyName,
    this.agentContact,
    this.propertyId,
    this.propertyPrefix,
  }) : super(key: key);

  @override
  _ContactAgentDialogState createState() => _ContactAgentDialogState();
}

class _ContactAgentDialogState extends State<ContactAgentDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contact',
                        style: theme.textTheme.subtitle1.copyWith(
                          color: Color.fromARGB(255, 47, 57, 72),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(LineAwesomeIcons.times),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  BorderedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              widget.agentAvatar ??
                                  APIUrlConstants.DEFAULT_IMAGE_URL),
                          backgroundColor: theme.highlightColor,
                          radius: 24,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.agentName ?? 'N/A',
                                style: theme.textTheme.subtitle1.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 47, 57, 72)),
                              ),
                              if (widget.agencyName != null &&
                                  widget.agencyName.isNotEmpty) ...[
                                SizedBox(height: 4),
                                Text(
                                  widget.agencyName ?? 'N/A',
                                  style: theme.textTheme.bodyText2.copyWith(
                                      color:
                                          Color.fromARGB(255, 145, 152, 161)),
                                ),
                              ],
                              if (widget.agentContact != null &&
                                  widget.agentContact.isNotEmpty) ...[
                                SizedBox(height: 4),
                                Text(
                                  widget.agentContact ?? 'N/A',
                                  style: theme.textTheme.bodyText2.copyWith(
                                      color:
                                          Color.fromARGB(255, 145, 152, 161)),
                                ),
                              ],
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        if (widget.agentContact != null &&
                            widget.agentContact.isNotEmpty)
                          RawMaterialButton(
                            padding: const EdgeInsets.all(0.0),
                            elevation: 2.0,
                            child: Icon(
                              LineAwesomeIcons.phone,
                              color: theme.primaryColor,
                              size: 18,
                            ),
                            onPressed: () => LinkUtils.openLink(
                                'tel:${widget.agentContact}'),
                            constraints: BoxConstraints.tightFor(
                              width: 48.0,
                              height: 48.0,
                            ),
                            shape: CircleBorder(),
                            fillColor: theme.backgroundColor,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon:
                                  Icon(LineAwesomeIcons.identification_badge),
                              contentPadding: EdgeInsets.all(4.0),
                              border: OutlineInputBorder(),
                              labelText: 'Name'),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Name is required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon: Icon(LineAwesomeIcons.mail_bulk),
                              contentPadding: EdgeInsets.all(4.0),
                              border: OutlineInputBorder(),
                              labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (Validator.isNull(value)) {
                              return 'Email is required.';
                            } else if (!Validator.isEmail(value)) {
                              return 'Valid email required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon: Icon(LineAwesomeIcons.phone),
                              contentPadding: EdgeInsets.all(4.0),
                              border: OutlineInputBorder(),
                              labelText: 'Phone'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (Validator.isNull(value)) {
                              return 'Phone is required.';
                            } else if (!Validator.isNumeric(value) ||
                                value.length != 10) {
                              return 'Valid phone required.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(),
                              hintMaxLines: 3,
                              hintText:
                                  'Hey, i am interested in your property [${widget.propertyPrefix}${widget.propertyId}]',
                              labelText: 'Message'),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 16.0),
                        HomeLoanOption(
                          value: false,
                          onChange: (value) {},
                        ),
                        const SizedBox(height: 16.0),
                        OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                          },
                          child: Text('Request a Callback'),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
