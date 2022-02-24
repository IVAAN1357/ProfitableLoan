import 'package:flutter/material.dart';
import 'package:profitable_loan/modules/project_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PercentCard extends StatefulWidget {
  String text;

  PercentCard(this.text, {Key? key}) : super(key: key);

  @override
  _PercentCardState createState() => _PercentCardState();
}

class _PercentCardState extends State<PercentCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: isPressed ? Border.all(color: ProjectColors.yellow) : null,
          color: isPressed ? ProjectColors.gray : Colors.white,
        ),
        height: 124,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 26, 14, 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: isPressed,
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: SvgPicture.asset(
                    'lib/assets/ok.svg',
                  ),
                ),
              ),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isPressed ? ProjectColors.yellow : const Color.fromRGBO(74, 74, 74, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
