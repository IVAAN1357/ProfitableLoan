import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/percent_card.dart';
import 'modules/project_colors.dart';
import 'timer.dart';

class LoanAmountScreen extends StatefulWidget {
  const LoanAmountScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoanAmountScreen> createState() => LoanAmountState();
}

class LoanAmountState extends State<LoanAmountScreen> {
  double _currentSliderValue = 50000;

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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Сумма кредита',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(207, 207, 207, 0.1),
                    ),
                    child: Center(
                      child: Text(
                        _currentSliderValue.round().toString(),
                        style: TextStyle(color: ProjectColors.yellow, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
              Slider(
                activeColor: ProjectColors.yellow,
                inactiveColor: Colors.white,
                value: _currentSliderValue,
                max: 100000,
                min: 5000,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = (value / 5000).round() * 5000;
                  });
                },
              ),
              const Text(
                'Проценты',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: PercentCard('0% для новых клиентов'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PercentCard('Более 0%\n'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PercentCard('С плохой кредитной историей'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 32, 22, 0),
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
                      backgroundColor: MaterialStateProperty.all(ProjectColors.yellow),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const TimerScreen()));
                    },
                    child: const Text(
                      'Оформить',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Play',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
