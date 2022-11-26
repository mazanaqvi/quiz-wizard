import 'package:flutter/material.dart';

var dimColor = const Color(0xFF8F90A6);
var mainColor = Color.fromRGBO(241, 102, 2, 1);
var ratingColor = const Color(0xFFFFB039);
var backgroundScreenColor = const Color(0xFFF2F2F2);
var greyColor = const Color(0xFFe4e4e4);
var appleColor = const Color(0xFF545454);
var darkGreyColor = const Color(0xFF97989E);
var lightGreyColor = const Color(0xFFF0F0F0);
var blackGreyColor = const Color(0xFF8C8C8C);
var greyBlackColor = const Color(0xFF505050);

var whiteColor = Colors.white;
var secondaryColor = const Color(0xFF555770);
var gradientColors = [
  const Color(0xFFF39757),
  const Color(0xFFEF7842),
  const Color(0xFFED6032),
];
var gradientDisableColors = [
  const Color(0x55F39757),
  const Color(0x55EF7842),
  const Color(0x55ED6032),
];

Map<int, Color> mainColorShades = {
  50: const Color(0xFFd66235),
  100: const Color(0xFFbe572f),
  200: const Color.fromARGB(255, 169, 53, 7),
  300: const Color.fromARGB(255, 154, 55, 16),
  400: const Color.fromARGB(255, 204, 74, 23),
  500: const Color.fromARGB(255, 206, 72, 19),
  600: const Color.fromARGB(255, 191, 65, 15),
  700: const Color.fromARGB(255, 169, 61, 18),
  800: const Color.fromARGB(255, 155, 54, 15),
  900: const Color.fromARGB(141, 170, 81, 8),
};

const Color secondaryTextColor = Color(0xFF2AB7CA);
const Color tertiaryTextColor = Color(0xFFFE4A49);
const Color tabColor = Color(0xFFE6E6EA);
const Color tabBorderColor = Color(0xFFFED766);
const Color tabBorderColor2 = Color(0xFFF4F4F8);
const Color warningColor = Color(0xFFFE4A49);

MaterialColor materialMainColor = MaterialColor(0xFFf16602, mainColorShades);

BoxDecoration roundSimpleBoxDecoration() {
  return BoxDecoration(
    color: const Color(0xFFF4F4F8),
    borderRadius: BorderRadius.circular(15),
  );
}

TextStyle regularText() => const TextStyle(fontSize: 16, color: Colors.black);
TextStyle regularBoldText() => const TextStyle(
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle regularSmallText() => const TextStyle(
      fontSize: 14,
    );

TextStyle boldSmallText() => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
TextStyle smallText() => const TextStyle(
      fontSize: 14,
    );

TextStyle boldHeadingText() => const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
TextStyle headingText() => const TextStyle(
      fontSize: 20,
    );
TextStyle titleText() => const TextStyle(
      fontSize: 25,
    );
TextStyle extraBoldText() => const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
    );
TextStyle styledFont({double? fontSize, Color? color}) => TextStyle(
      fontSize: fontSize,
      color: color,
    );
TextStyle buttonText() => const TextStyle(color: Colors.white, fontSize: 16);
BoxDecoration tileDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(
            2.0,
            2.0,
          ),
          blurRadius: 5.0,
          spreadRadius: 0.1,
        ),
      ],
    );
TextStyle dropDownstyle() => TextStyle(
    fontFamily: "defaultFont",
    color: mainColor,
    fontWeight: FontWeight.bold,
    fontSize: 16);
