import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/project_colors.dart';
import 'package:bordered_text/bordered_text.dart';
import 'verification_screen.dart';
import 'dart:async';
import 'dart:math';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => TimerState();
}

class TimerState extends State<TimerScreen> {
  String _time = "0:00";
  int time = 0;
  late Timer timer;

  void _startTimer() {
    Random random = Random();
    int endTime = random.nextInt(30) + 15;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time++;
      setState(() {
        int minutes = time ~/ 60;
        int firstSeconds = time % 60 ~/ 10;
        int secondSeconds = time % 60 % 10;
        _time = "$minutes:$firstSeconds$secondSeconds";
      });
      if (time == endTime) {
        timer.cancel();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerificationScreen()));
      }
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Идет обработка заявки, просьба подождать',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Play',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: ProjectColors.gray,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: BorderedText(
                    strokeWidth: 2.0,
                    strokeColor: Colors.white,
                    child: Text(
                      _time,
                      style: TextStyle(
                        fontFamily: 'Play',
                        shadows: const [
                          Shadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                          ),
                        ],
                        fontWeight: FontWeight.w700,
                        color: ProjectColors.yellow,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
