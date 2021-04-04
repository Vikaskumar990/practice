import 'package:flutter/material.dart';
import '../components/text_field_container.dart';
import '../constants.dart';

class RoundedImage extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedImage({
    Key key,
    this.onChanged,
    Null Function() onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Upload Licence",
          icon: Icon(
            Icons.image,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.upload_file,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
