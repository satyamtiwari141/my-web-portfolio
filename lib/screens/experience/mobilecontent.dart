import 'package:flutter/material.dart';
import 'package:steps/steps.dart';

class ExperiencesMobile extends StatelessWidget {
  const ExperiencesMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height * 0.81,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: Steps(
        direction: Axis.vertical,
        size: 20.0,
        path: {'color': Colors.lightBlue.shade200, 'width': 2.75},
        steps: [
          {
            'color': Color(0xff64FFDA),
            'background': Colors.indigo,
            'label': '🌟',
            'content': Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Open Source Contributor",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Software Developer",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Experienced Open Source Contributor, proficient in coding, bug fixing, documentation, and testing.Committed to best practices, my contributions enhance project functionality and stability.Actively engage in community discussions, offering valuable insights and support,driven by a passion for open-source principles and staying up-to-date with cutting-edge technologies.\n",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "December 2020 - March 2023",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          },
          {
            'color': Color(0xff64FFDA),
            'background': Colors.indigo,
            'label': '👷🏻‍♀️',
            'content': Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "CodeYantra - Slrtce",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "CoreMember",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Active Codeyantra core member: organized 2 coding competitions (200+ participants),delivered programming language lectures, and led a motivating seminar on coding's career relevance.\n",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "July 2022 - August 2023",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          },
          {
            'color': Color(0xff64FFDA),
            'background': Colors.indigo,
            'label': '👷🏻‍♀️',
            'content': Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Virtually Testing Foundation",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "CyberSecurity Engineer Intern",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "During a 10-week Cyber Security Engineer internship, I focused on practical learning and skill development.Tasks included working with technologies like Splunk and MITRE ATTACK. Together with fellow interns,we built a Virtual Machine environment for vulnerability testing and engaged in flag-based challenges to enhance bug identification abilities.\n",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "May 2022 - July 2022",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xffCCD6F6).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          },
        ],
      ),
    );
  }
}
