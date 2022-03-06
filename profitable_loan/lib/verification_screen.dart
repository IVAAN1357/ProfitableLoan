import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/project_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ProjectColors.darkGreen,
          title: const Text(
            'Назад',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Play',
              fontSize: 14,
            ),
          ),
        ),
        backgroundColor: ProjectColors.darkGreen,
        body: SizedBox.expand(
          child: Column(
            children: [
              const SizedBox(
                height: 82,
              ),
              const Text(
                'Ваша заявка отклонена',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Play',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              SvgPicture.asset(
                'assets/cancel.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
