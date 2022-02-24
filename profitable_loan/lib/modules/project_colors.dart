import 'package:flutter/material.dart';

abstract class ProjectColors {
  static Color darkGreen = const Color.fromRGBO(28, 73, 47, 1);
  static Color yellow = const Color.fromRGBO(255, 204, 0, 1);
  static Color gray = const Color.fromRGBO(132, 132, 132, 1);
  static Map<int, Color> colors = {
    50: const Color.fromRGBO(28, 73, 47, .1),
    100: const Color.fromRGBO(28, 73, 47, .2),
    200: const Color.fromRGBO(28, 73, 47, .3),
    300: const Color.fromRGBO(28, 73, 47, .4),
    400: const Color.fromRGBO(28, 73, 47, .5),
    500: const Color.fromRGBO(28, 73, 47, .6),
    600: const Color.fromRGBO(28, 73, 47, .7),
    700: const Color.fromRGBO(28, 73, 47, .8),
    800: const Color.fromRGBO(28, 73, 47, .9),
    900: const Color.fromRGBO(28, 73, 47, 1),
  };
}
