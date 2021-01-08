import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/entities/property_enquiry_request_entity.dart';
import 'package:nepal_homes/feature_property_enquiry/presentation/cubits/property_enquiry_cubit.dart';
import 'package:nepal_homes/feature_property_enquiry/utils/providers.dart';
import 'package:validators/validators.dart' as Validator;

import 'widgets/agent_info.dart';
import 'widgets/header.dart';
import 'widgets/home_loan_option.dart';

class PropertyEnquiryDialog extends StatefulWidget {
  final String agentName;
  final String agentAvatar;
  final String agencyName;
  final String agentContact;
  final String propertyId;
  final String propertyCode;

  const PropertyEnquiryDialog({
    Key key,
    this.agentName,
    this.agentAvatar,
    this.agencyName,
    this.agentContact,
    this.propertyId,
    this.propertyCode,
  }) : super(key: key);

  @override
  _PropertyEnquiryDialogState createState() => _PropertyEnquiryDialogState();
}

class _PropertyEnquiryDialogState extends State<PropertyEnquiryDialog> {
  final _formKey = GlobalKey<FormState>();
  var contactForm;

  @override
  void initState() {
    super.initState();
    contactForm = PropertyEnquiryRequestEntity(propertyId: widget.propertyId);
  }

  @override
  void didUpdateWidget(covariant PropertyEnquiryDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    contactForm = PropertyEnquiryRequestEntity(
      propertyId: widget.propertyId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final node = FocusScope.of(context);
    return PropertyEnquiryProviders.propertyEnquiryBlocProvider(
      child: Builder(
        builder: (context) =>
            BlocConsumer<PropertyEnquiryCubit, PropertyEnquiryState>(
                listener: (context, state) {
          if (state is PropertyEnquiryErrorState) {
            context.showMessage(state.message);
          } else if (state is PropertyEnquirySuccessState) {
            Navigator.pop(context);
            context.showMessage(state.message);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is PropertyEnquiryLoadingState,
            child: AnimatedContainer(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const PropertyEnquiryHeader(),
                          const SizedBox(height: 8),
                          AgentInfo(
                            agentAvatar: widget.agentAvatar,
                            agentContact: widget.agentContact,
                            agentName: widget.agentName,
                            agencyName: widget.agentName,
                            propertyCode: widget.propertyCode,
                            propertyId: widget.propertyId,
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
                                      prefixIcon: Icon(LineAwesomeIcons
                                          .identification_badge),
                                      contentPadding: EdgeInsets.all(4.0),
                                      border: OutlineInputBorder(),
                                      labelText: 'Name'),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  onSaved: (value) => contactForm =
                                      contactForm.copyWith(name: value),
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
                                      prefixIcon:
                                          Icon(LineAwesomeIcons.mail_bulk),
                                      contentPadding: EdgeInsets.all(4.0),
                                      border: OutlineInputBorder(),
                                      labelText: 'Email'),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  onSaved: (value) => contactForm =
                                      contactForm.copyWith(email: value),
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
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      prefixIcon: Icon(LineAwesomeIcons.phone),
                                      contentPadding: EdgeInsets.all(4.0),
                                      border: OutlineInputBorder(),
                                      labelText: 'Phone'),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  onSaved: (value) => contactForm =
                                      contactForm.copyWith(phone: value),
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
                                  maxLength: 140,
                                  buildCounter: (BuildContext context,
                                          {int currentLength,
                                          int maxLength,
                                          bool isFocused}) =>
                                      Text('$currentLength/$maxLength'),
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      contentPadding: EdgeInsets.all(12.0),
                                      border: OutlineInputBorder(),
                                      hintMaxLines: 3,
                                      hintText:
                                          'Hey, i am interested in your property [${widget.propertyCode}]',
                                      labelText: 'Message'),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  onSaved: (value) => contactForm =
                                      contactForm.copyWith(message: value),
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
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      context
                                          .read<PropertyEnquiryCubit>()
                                          .postEnquiry(
                                              enquiryRequest: contactForm);
                                    }
                                  },
                                  child: (state is PropertyEnquiryLoadingState)
                                      ? ProgressView()
                                      : Text('Request a Callback'),
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
            ),
          );
        }),
      ),
    );
  }
}
