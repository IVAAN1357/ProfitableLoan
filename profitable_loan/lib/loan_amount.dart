import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          backgroundColor: const Color.fromRGBO(28, 73, 47, 1),
          title: const Text('Назад'),
        ),
        backgroundColor: const Color.fromRGBO(28, 73, 47, 1),
        body: SafeArea(
          child: Padding(
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
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 204, 0, 1),
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
                Slider(
                  activeColor: const Color.fromRGBO(255, 204, 0, 1),
                  inactiveColor: Colors.white,
                  value: _currentSliderValue,
                  max: 100000,
                  min: 5000,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = (value / 5000).toInt() * 5000 +
                          (value % 5000 / 5000).round() * 5000;
                    });
                  },
                ),
                const Text(
                  'Проценты',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
