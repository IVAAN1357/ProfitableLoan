import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loan_amount.dart';
import 'widgets/input_field.dart';
import 'modules/project_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ProjectColors.darkGreen,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 84, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField('ФИО'),
                InputField('Телефон'),
                InputField('Адрес электронной почты'),
                InputField(
                  'Пароль',
                  isPassword: true,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        checkColor: ProjectColors.darkGreen,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        shape: const CircleBorder(),
                        value: value,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value = value;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Я согласен с политикой конфиденциальности',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0))),
                          backgroundColor: MaterialStateProperty.all(
                              ProjectColors.yellow),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const LoanAmountScreen(title: 'Loan')));
                        },
                        child: const Text(
                          'Отправить',
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
