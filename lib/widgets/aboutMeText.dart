import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeText extends StatelessWidget {
  final TextAlign textAlign;
  final double fontSize;

  const AboutMeText({Key key, this.textAlign, this.fontSize}) : super(key: key);

  TextStyle _textStyle(double fSize, bool bold) {
    return GoogleFonts.montserrat(
      fontSize: fSize ?? 14,
      fontWeight: !bold ? FontWeight.w100 : FontWeight.w400,
      letterSpacing: 1.0,
      height: 2.0,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTextStyle(
        textAlign: TextAlign.justify, // Set text alignment here
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width < 600 ? fontSize : fontSize + 2,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
          height: 2.0,
          color: Colors.white,
        ),
        child: Text(
          "I am a dedicated software engineer with expertise in web and mobile development. My proficiency spans various programming languages and technologies, enabling the creation of dynamic and user-centric digital solutions. I leverage my background in cybersecurity to address challenges from a holistic security perspective. My strong aptitude for problem-solving is evident in my approach to tackling intricate technical issues. My solid grounding in mathematics enhances analytical thinking and drives me to innovate and develop robust software solutions.",
                style: MediaQuery.of(context).size.width < 600
              ? _textStyle(fontSize, false)
              : _textStyle(fontSize + 2, false),),
      ),
    );
  }
}
