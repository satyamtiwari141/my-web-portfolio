// ignore: avoid_web_libraries_in_flutter
import 'package:myportfolio/animations/entranceFader.dart';
import 'package:myportfolio/constants.dart';
import 'package:myportfolio/screens/Certificates/certificates.dart';
import 'package:myportfolio/screens/about/about.dart';
import 'package:myportfolio/screens/contact/contact.dart';
import 'package:myportfolio/screens/education/educationdesktop.dart';
import 'package:myportfolio/screens/experience/experience.dart';
import 'package:myportfolio/screens/home/home.dart';
import 'package:myportfolio/screens/navBar/navBarLogo.dart';
import 'package:myportfolio/screens/portfolio/portfolio.dart';
import 'package:myportfolio/screens/skills/skills.dart';
import 'package:myportfolio/widgets/arrowOnTop.dart';
import 'package:myportfolio/widgets/footer.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionListener = ItemPositionsListener.create();

  final List<String> _sectionsName = [
    "Home",
    "About",
    "Education",
    "Skills",
    "Work Experience",
    "Projects",
    "Achievements",
    "Contact"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.school,
    Icons.center_focus_weak_rounded,
    Icons.work,
    Icons.build,
    Icons.emoji_events,
    Icons.phone,
  ];

  void _scroll(int i) {
    _itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return EducationDesktop();
    } else if (i == 3) {
      return Skills();
    } else if (i == 4) {
      return Experience();
    } else if (i == 5) {
      return Portfolio();
    } else if (i == 6) {
      return Certificates();
    } else if (i == 7) {
      return Contact();
    } else if (i == 8) {
      return SizedBox(
        height: 40.0,
      );
    } else if (i == 9) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else if (i == 10) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: MediaQuery.of(context).size.width > 1000
          ? _appBarTabDesktop()
          : AppBar(
            backgroundColor: Colors.black,
            //  backgroundColor: Colors.transparent,
            //  elevation: 0.0,
            ),
      drawer: MediaQuery.of(context).size.width < 1000 ? _appBarMobile() : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: myPrimaryColor,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 11,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return MediaQuery.of(context).size.width > 1000
        ? EntranceFader(
            offset: Offset(0, -20),
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: myPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                hoverColor: myPrimaryColor,
                onPressed: () => _scroll(index),
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    title: Text(childText),
                  ),
                )),
          );
  }

  Widget _appBarTabDesktop() {
    return AppBar(
     backgroundColor: Colors.black,
     // elevation: 0.0,
     // backgroundColor: Colors.transparent,
      title: MediaQuery.of(context).size.width < 800
          ? EntranceFader(
              duration: Duration(seconds: 1),
              offset: Offset(0, -20),
              delay: Duration(seconds: 3),
              child: NavBarLogo())
          : EntranceFader(
              offset: Offset(0, -20),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
        EntranceFader(
          offset: Offset(0, -20),
          delay: Duration(seconds: 3),
          duration: Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: myPrimaryColor,
              hoverColor: Colors.white.withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                //side: BorderSide(color: myPrimaryColor)
              ),
              onPressed: () {
                html.window.open(
                    'https://drive.google.com/file/d/10gILoy0SIIb16sThy-05prQ-qQ3aulPu/view',
                    "pdf");
              },
              child: Text(
                "Resume",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _appBarMobile() {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: myPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: myPrimaryColor)),
                  onPressed: () {
                    launchURL(
                        "https://drive.google.com/file/d/10gILoy0SIIb16sThy-05prQ-qQ3aulPu/view");
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Resume",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
