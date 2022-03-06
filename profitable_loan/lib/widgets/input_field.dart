import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField(this._name, {Key? key, this.isPassword = false}) : super(key: key);
  final String _name;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontFamily: 'Gilroy',
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 4, bottom: 16),
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextField(
              cursorColor: Colors.black,
              obscureText: isPassword,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              )),
        ),
      ),
    ]);
  }
}
