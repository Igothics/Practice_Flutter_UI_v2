import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/address_text_form_field.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/birthday_text_form_field.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/display_name_text_form_field.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/email_text_form_field.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/gender_text_form_field.dart';

import 'phone_number_text_form_field.dart';

class UserProfileFormCard extends StatelessWidget {
  const UserProfileFormCard({
    super.key,
    required this.cardKey,
    required this.formKey,
    this.margin,
    this.contentPadding,
  });
  final GlobalKey? cardKey;
  final GlobalKey<FormState>? formKey;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: cardKey,
      margin: margin,
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: Form(
          key: formKey,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0,),
              DisplayNameTextFormField(label: 'Name:',),
              EmailTextFormField(label: 'Email:',),
              PhoneNumberTextFormField(label: 'Phone:',),
              GenderTextFormField(label: 'Gender:',),
              BirthdayTextFormField(label: 'Birthday:',),
              AddressTextFormField(label: 'Address:',),
              SizedBox(height: 16.0,),
            ],
          ),
        ),
      ),
    );
  }
}
