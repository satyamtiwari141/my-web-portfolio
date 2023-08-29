import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Colors
const Color myPrimaryColor = Color(0xffC0392B);
const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

// Social Media
const mySocialIcons = [
  "https://img.icons8.com/metro/308/ffffff/linkedin.png",
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
  "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
  "https://img.icons8.com/android/480/ffffff/twitter.png",
];

const mySocialLinks = [
  "https://www.linkedin.com/in/satyamrtiwari/",
  "https://github.com/satyamtiwari141/",
  "https://www.instagram.com/sat.awk/",
  "https://www.facebook.com/profile.php?id=100092402347005",
  "https://twitter.com/satyamtiwari973",
];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
final myCommunityLogo = [
  'assets/images/eddiehub.png',
];

final myCommunityLinks = [
  "https://www.eddiehub.org",
];

// Tools & Tech
final myTools = [
  "Flutter + Dart",
  "C/C++",
  "Python",
  "SQL",
  "Linux",
];

final myTools1 = [
  "HTML + CSS",
  "JavaScript",
  "MS-Azure",
  "AWS",
  "Firebase",
  "MongoDB",
];

// services
final myServicesIcons = [
  "assets/images/appic.png",
  "assets/images/ui.png",
  "assets/images/open.png",
];

//certificates
final myCertificatesBanner = [
  "assets/images/c1.png",
  "assets/images/c2.jpg",
  "assets/images/c3.jpg",
  "assets/images/c4.jpg",
];

final myCertificatesTitles = [
  "MicroSoft Certified",
  "Code Debugging",
  "100 Day's of Code Program",
  "Google IT Automation With Python",
];

final myCertificatesDescriptions = [
  "Completed Microsoft Azure AZ-900 Certification its fundamendal certificat provided by Microsoft ",
  "Participated in Code Debugging Competition and win organized by SLRTCE",
  "Particpated in 100 Day\'s of Code Program it's 100 long days of program of CodeIN Community\'s",
  "This six-course certificate, developed by Google, is designed to provide IT professionals with in-demand skills",
];

final myCertificatesLinks = [
  "https://drive.google.com/file/d/1swFOok7-aZzOS8mF_n3t5hAi_Y-5_WPx/view?usp=sharing",
  "https://drive.google.com/file/d/1QSh2nNgBuipjvlNl6tLV3SoIXggz4N41/view?usp=sharing",
  "https://drive.google.com/file/d/19mvvRFvFVkw7OSnSYu5I4QBZdOW_0GhE/view?usp=sharing",
  "https://drive.google.com/file/d/1n4BW0eTfk50VF94-mnRQGp7NJG6Jo3dU/view?usp=sharing",
];

// projects
final myProjectsBanner = [
  "assets/images/deaf-sign.png",
  "assets/images/weather.png",
  "assets/images/TaskTrove.png",
  "assets/images/Wallet-Watcher.png",

];

final myProjectsIcons = [
  "assets/images/deaf.png",
  "assets/images/weather-logo.png",
  "assets/images/TaskTrove-logo.png",
  "assets/images/Wallet-Watcher-logo.png",
];

final myProjectsTitles = [
  "SignTalk",
  "SkyCast",
  "TaskMinder",
  "Wallet Watcher",
];

final myProjectsDescriptions = [
  "Revolutionary Flutter app: Translating sign language to empower the deaf community.",
  "Flutter weather app integrated with OpenWeatherAPI for real-time forecasts.",
  "Streamline tasks, set reminders, and boost productivity with our intuitive and feature-packed to-do app.",
  "Now it's easy to manage your weekly expanses with the help of Expanse-Tracker!",
];

final myProjectsLinks = [
  "https://github.com/satyamtiwari141/DeafSignChatApplication.git",
  "https://github.com/satyamtiwari141/WeatherApp.git",
  "https://github.com/satyamtiwari141/todo_app.git",
  "https://github.com/satyamtiwari141/Wallet-Watcher.git",
];

// Contact
final myContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.mail,
];

final myContactTitles = [
  "Location",
  "Phone",
  "Email",
];

final myContactDetails = [
  "Mumbai, India",
  "+91 9022148506",
  "tsatyam141@gmail.com"
];
