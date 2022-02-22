import 'package:flutter/material.dart';

class PercentCard extends StatefulWidget {
  var text;
  PercentCard(this.text, {Key? key}) : super(key: key);

  @override
  _PercentCardState createState() => _PercentCardState();
}

class _PercentCardState extends State<PercentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 124,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(74, 74, 74, 1),
          ),
        ),
      ),
    );
  }
}
