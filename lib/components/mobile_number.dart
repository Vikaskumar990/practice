import 'package:flutter/material.dart';
import '../components/text_field_container.dart';
import '../constants.dart';

class RoundedInputMob extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  const RoundedInputMob({
    Key key,
    this.hintText,
    this.icon = Icons.phone,
    this.onChanged, TextEditingController controller, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: validator,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
