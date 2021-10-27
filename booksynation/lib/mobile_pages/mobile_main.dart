import 'dart:io';
import 'package:booksynation/email_notifs.dart';
import 'package:booksynation/main.dart';
import 'package:booksynation/page/patient_info/widgets/contact_details.dart';
import 'package:booksynation/page/patient_info/widgets/essential_info.dart';
import 'package:booksynation/page/patient_info/widgets/patientData.dart';
import 'package:booksynation/page/patient_info/widgets/patient_profile.dart';
import 'package:booksynation/strings.dart';
import 'package:booksynation/userData.dart';
import 'package:booksynation/web_pages/web_data/assign_vaccine.dart';
import 'package:booksynation/web_pages/web_data/web_schedules_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MobileMain extends StatefulWidget {
  MobileMain({
    Key? key,
    required this.auth,
    @required this.currentUser,
  }) : super(key: key);
  final FirebaseAuth auth;
  final currentUser;

  @override
  _MobileMainState createState() =>
      _MobileMainState(auth: auth, currentUser: currentUser);
}

class _MobileMainState extends State<MobileMain> {
  _MobileMainState({
    required this.auth,
    @required this.currentUser,
  });
  final FirebaseAuth auth;
  final currentUser;
  String fullname = patient.firstName +
      ' ' +
      patient.lastName +
      ' ' +
      ((patient.suffix == 'N/A') ? '' : patient.suffix);
  File? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              navigatorData.currentWindow,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87),
            leading: null,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        drawer: sideMenu(context),
        body: navigatorData.mainBody == null
            ? onBoard(context)
            : navigatorData.mainBody,
      ),
    );
  }

  //TODO: side-menu
  Widget sideMenu(context) {
    final email = patient.email;
    final image = patient.profilePic;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Material(
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: image,
              name: fullname,
              email: email,
              onClicked: () {
                setState(
                  () {
                    Navigator.pop(context);
                    navigatorData.currentWindow = '';
                    navigatorData.mainBody = PatientSettings(
                      context: context,
                      auth: widget.auth,
                    );
                  },
                );
              },
            ),
            Container(
              height: height * 0.8,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        buildMenuItem(
                          text: 'Personal Information',
                          icon: Icons.people,
                          onClicked: () {
                            setState(
                              () {
                                Navigator.pop(context);
                                navigatorData.currentWindow =
                                    'Personal Information';
                                navigatorData.mainBody = personalInfo(
                                    context); //TODO: change screen direction
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        buildMenuItem(
                          text: 'My Appointment',
                          icon: Icons.phone_outlined,
                          onClicked: () {
                            setState(
                              () {
                                Navigator.pop(context);
                                navigatorData.currentWindow = '';
                                navigatorData.mainBody = myAppointment(context);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        buildMenuItem(
                          text: 'Settings',
                          icon: Icons.settings_outlined,
                          onClicked: () {
                            setState(
                              () {
                                Navigator.pop(context);
                                navigatorData.currentWindow = 'Settings';
                                navigatorData.mainBody = PatientSettings(
                                  context: context,
                                  auth: widget.auth,
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        buildSignOutItem(context),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/Logo_BSN.svg',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'BookSyNation',
                          style: TextStyle(
                            fontFamily: 'Antic Didone',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO: header
  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        image: DecorationImage(
          image: (patient.profilePic == 'images/user.png')
              ? AssetImage(patient.profilePic)
              : NetworkImage(patient.profilePic) as ImageProvider,
          colorFilter: new ColorFilter.mode(
              Colors.grey.withOpacity(0.30), BlendMode.modulate),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 5, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: (patient.profilePic == 'images/user.png')
                  ? AssetImage(patient.profilePic)
                  : NetworkImage(patient.profilePic) as ImageProvider,
            ),
            SizedBox(
              height: 20,
            ),
            Text(name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              patient.email,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  //TODO: side-menu-tiles
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.grey.withOpacity(0.5);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  //TODO: sign-out-tile
  Widget buildSignOutItem(context) {
    final color = Colors.black;
    final hoverColor = Colors.grey.withOpacity(0.5);

    return ListTile(
      title: Text('Sign-out', style: TextStyle(color: color)),
      leading: SvgPicture.asset(
        'images/signout_icon.svg',
        color: color,
        width: 18,
        alignment: Alignment.center,
      ),
      hoverColor: hoverColor,
      onTap: () => {
        setLocalSignOut(),
        auth.signOut(),
        navigatorData.mainBody = null,
        Navigator.pop(context),
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => App(),
          ),
        ),
      },
    );
  }

  //TODO: sign-out
  Widget signOutMenu({
    required String text,
    required SvgPicture icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    return ListTile(
      leading: icon,
      horizontalTitleGap: 3,
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  //covid19-info-functions
  void goToPersonalInfo(context) {
    setState(
      () {
        navigatorData.currentWindow = 'Personal Information';
        navigatorData.mainBody = personalInfo(context);
      },
    );
  }

  //covid19-info
  Widget covidInfo(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: height * 0.0023);
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );
    PageDecoration pageDecoration = PageDecoration(
        titleTextStyle: _normalTextStyle.copyWith(
            fontSize: height * 0.028, fontWeight: FontWeight.bold),
        bodyTextStyle: _normalTextStyle,
        titlePadding: EdgeInsets.fromLTRB(
            width * 0.08, height * 0.02, width * 0.08, height * 0.02),
        descriptionPadding:
            EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        imagePadding: EdgeInsets.zero,
        pageColor: Colors.white);

    DotsDecorator dotsDecoration = DotsDecorator(
      color: Color(0xFFBDBDBD),
      activeColor: Color(0xFF26A98A),
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    return IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: [
        PageViewModel(
            title: c19TitleText1,
            bodyWidget: Text(
              c19DescText1,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg1.png', scale: 1.25),
            decoration: pageDecoration),
        PageViewModel(
            title: c19TitleText2,
            bodyWidget: Text(
              c19DescText2,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg2.png', scale: 1.25),
            decoration: pageDecoration),
        PageViewModel(
            title: c19TitleText3,
            bodyWidget: Text(
              c19DescText3,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg3.png', scale: 1.25),
            decoration: pageDecoration),
        PageViewModel(
            title: c19TitleText4,
            bodyWidget: Text(
              c19DescText4,
              textAlign: TextAlign.justify,
              style: _normalTextStyle,
            ),
            image: Image.asset('images/c19vaxinfoimg4.png', scale: 1.25),
            footer: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF26A98A),
                    fixedSize: Size(width * 0.40, height * 0.065),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
                onPressed: () => goToPersonalInfo(context),
                child: Text(
                  btnTextUnderstand,
                  style: _btnTextStyle,
                )),
            decoration: pageDecoration)
      ],
      showSkipButton: true,
      showDoneButton: false,
      skip: Text(skipText,
          style: _btnTextStyle.copyWith(color: Color(0xFF26A98A))),
      nextColor: Color(0xFF26A98A),
      next: Icon(Icons.arrow_forward),
      dotsDecorator: dotsDecoration,
      globalBackgroundColor: Colors.white,
      skipFlex: 0,
      nextFlex: 0,
    );
  }

  //TODO: my-appointments-functions
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(appointAlertTitle1),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(appointAlertText1),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, okayText),
              child: const Text(okayText),
            ),
          ],
        );
      },
    );
  }

  void showFormAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text(appointAlertTitle2),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(appointAlertText2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, okayText),
              child: const Text(okayText),
            ),
          ],
        );
      },
    );
  }

  //TODO: my-appointments
  Widget myAppointment(context) {
    DateTime scheduleDate = scheduleData
        .dateScheduled; //Schedule of User's vaccine from firestore/ Book button pressed if not empty
    bool status =
        true; //Status of Vaccination of User from firestore (false when vaccine is missed, true otherwise)
    bool fillStatus =
        patient.fillStatus; //Status of Fill up Form of User from firestore
    print('FillStatus: ' +
        fillStatus.toString()); //TODO: no alert even if Fillstatus is false
    DateTime now = new DateTime.now();
    var formatter = new DateFormat('MM/dd/yyyy');
    String date = formatter.format(now);
    String schedule = formatter.format(scheduleDate);

    Future.delayed(Duration.zero, () {
      if (status && date == schedule) {
        showAlert(context);
      }
    });

    Widget getStatus(String schedule, bool status) {
      if (schedule != formatter.format(DateTime.utc(1969, 7, 20, 20, 18, 04))) {
        if (status) {
          return scheduleScreen(context);
        } else {
          return missedScreen(context);
        }
      } else {
        if (!fillStatus) {
          Future.delayed(Duration.zero, () {
            showFormAlert(context);
          });
        }
        return bookSchedule(context);
      }
    }

    return Scaffold(
      body: getStatus(schedule, status),
    );
  }

  //TODO: schedule-screen
  Widget scheduleScreen(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextStyle _normalTextStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Average',
      fontWeight: FontWeight.bold,
      fontSize: height * 0.035,
    );

    String uid = patient.uniqueId;
    print('Patient UID: ' + uid);
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    String getDateSchedule() {
      DateTime date = scheduleData.dateScheduled;
      String formattedSched = formatter.format(date);
      return formattedSched;
    }

    //TODO: if no schedule yet then show alert and redirect to forms or pending screen,
    //TODO: if missed patient and not yet rescheduled show alert or pending screen.
    //TODO: if removed then show patient removed need to fill up forms or delete account.

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.center,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                    width * 0.08, height * 0.02, width * 0.08, 0),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.20),
                    Text(
                      scheduleText1 + getDateSchedule(),
                      textAlign: TextAlign.center,
                      style: _normalTextStyle.copyWith(
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.bold),
                    ),
                    /*
                    Text(
                      'on ' + date,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.035,
                      ),
                    ), */
                    SizedBox(height: height * 0.10),
                    Image.asset('images/calendar.png'),
                    SizedBox(height: height * 0.10),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(scheduleText2,
                          textAlign: TextAlign.justify,
                          style: _normalTextStyle),
                    ),
                    SizedBox(height: height * 0.020),
                    Container(
                      width: width * 0.65,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        scheduleText3,
                        textAlign: TextAlign.justify,
                        style: _normalTextStyle,
                      ),
                    ),
                    SizedBox(height: height * 0.10),
                    QrImage(
                      data: uid,
                      size: 300,
                      embeddedImage: AssetImage('images/Logo_BSN.png'),
                      embeddedImageStyle:
                          QrEmbeddedImageStyle(size: Size(80, 80)),
                    ),
                    SizedBox(height: height * 0.10),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width * 0.38,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xFF26A98A).withOpacity(0.16),
                            blurRadius: 8,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ]),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                navigatorData.currentWindow = '';
                                navigatorData.mainBody = onBoard(context);
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF26A98A),
                            fixedSize: Size(
                              width * 0.35,
                              height * 0.065,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                          ),
                          child: Text(
                            btnTextBack,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.018,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //TODO: book-schedule
  Widget bookSchedule(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: 2.5);
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );

    //TODO: name dynamic implementation

    if (patient.fillStatus) {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.1,
                    left: width * 0.14,
                    right: width * 0.14,
                  ),
                  child: RichText(
                      text: TextSpan(
                          text: bookSchedText1,
                          style: _normalTextStyle,
                          children: <TextSpan>[
                        TextSpan(
                            text: fullname +
                                '!', //TODO: apply name dynamic implementation
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ])),
                ),
                Text(bookSchedText2,
                    textAlign: TextAlign.center, style: _normalTextStyle),
                Text(bookSchedText3,
                    textAlign: TextAlign.center, style: _normalTextStyle),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.075),
                  child: Image.asset('images/bookimg1.png', scale: 2),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.065),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          navigatorData.currentWindow = '';
                          navigatorData.mainBody = healthDeclaration(context);
                        },
                      ); //TODO:change button action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF26A98A),
                      fixedSize: Size(
                        width * 0.35,
                        height * 0.065,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                    child: Text(btnTextBook, style: _btnTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return covidInfo(context);
    }
  }

  //TODO: missed-screen
  Widget missedScreen(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: 1.5);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.14,
                    right: width * 0.14,
                    bottom: height * 0.025),
                child: Text(missedText1,
                    textAlign: TextAlign.center, style: _normalTextStyle),
              ),
              Image.asset(
                'images/missappt1.png',
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.025,
                    left: width * 0.14,
                    right: width * 0.14),
                child: Text(
                  (missedText2 +
                      "\n\n" +
                      contactDetail1 +
                      "\n" +
                      contactDetail2 +
                      "\n\n" +
                      missedText3), //TODO: implement dynamic contact details?
                  textAlign: TextAlign.center,
                  style: _normalTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //health-declaration
  Widget healthDeclaration(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final TextStyle _normalTextStyle = TextStyle(
        color: Colors.black,
        fontFamily: 'Antic Didone',
        decoration: TextDecoration.none,
        fontSize: height * 0.02,
        height: height * 0.0023);
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );

    PageDecoration pageDecoration = PageDecoration(
        titleTextStyle: _normalTextStyle.copyWith(
            fontSize: height * 0.028, fontWeight: FontWeight.bold),
        bodyTextStyle: _normalTextStyle,
        titlePadding: EdgeInsets.fromLTRB(
            width * 0.08, height * 0.02, width * 0.08, height * 0.02),
        descriptionPadding:
            EdgeInsets.only(left: width * 0.005, right: width * 0.025),
        imagePadding: EdgeInsets.zero,
        pageColor: Colors.white);

    DotsDecorator dotsDecoration = DotsDecorator(
      color: Color(0xFFBDBDBD),
      activeColor: Color(0xFF26A98A),
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

    return IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: [
        PageViewModel(
          title: healthDecTitle1,
          body: healthDecDescription1,
          image: Image.asset(
            'images/vaxinfoimg1.png',
            scale: 1.5,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: healthDecTitle2,
          useScrollView: false,
          body: healthDecDescription2,
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              elevation: 15,
              child: Image.asset(
                'images/healthdecimg1.png',
              ),
            ),
          ),
          footer: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF26A98A),
                  fixedSize: Size(width * 0.40, height * 0.065),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
              onPressed: () {
                User? user = FirebaseAuth.instance.currentUser;
                print("CurrentUser:" + user.toString());
                createScheduleVaccine(user);
                Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    navigatorData.currentWindow = '';
                    navigatorData.mainBody = myAppointment(context);
                  });
                });
              },
              child: Text(
                btnTextFinishBook,
                style: _btnTextStyle,
              )),
          decoration: pageDecoration,
        ),
      ],
      showDoneButton: false,
      nextColor: Color(0xFF26A98A),
      next: Text(
        'Agree',
      ),
      dotsDecorator: dotsDecoration,
      globalBackgroundColor: Colors.white,
      skipFlex: 0,
      nextFlex: 0,
      isProgressTap: true,
      isProgress: true,
      showNextButton: true,
      freeze: false,
      // animationDuration: 1000,
    );
  }

  //personal-info-main
  Widget personalInfo(context) {
    if (patient.fillStatus) {
      return lockedPersonalInfo();
    } else {
      return unlockedPersonalInfo(context);
    }
  }

  //TODO: unlocked-personal-info-page
  Widget unlockedPersonalInfo(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: height * 0.03),
                PatientProfile(height: height, width: width),
                SizedBox(height: height * 0.03),
                Text('Contact Details',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: height * 0.03),
                ContactDetails(height: height, width: width),
                SizedBox(height: height * 0.03),
                Text('Essential Information',
                    style: TextStyle(
                      fontSize: height * 0.024,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: height * 0.03),
                EssentialInfo(height: height, width: width),
                SizedBox(height: height * 0.1),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width * 0.65,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1D74E9).withOpacity(0.16),
                        blurRadius: 8,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ]),
                    child: ElevatedButton(
                      onPressed: () {
                        initialState = false;

                        allergies.add(patient.otherAllergies);
                        comorbidities.add(patient.others);

                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Submitting Your Data',
                              ),
                            ),
                          );

                          fillStatus = true;
                          patient.fillStatus = fillStatus;
                          updatePatientData();
                          fullname = patient.firstName +
                              ' ' +
                              patient.lastName +
                              ' ' +
                              ((patient.suffix == 'N/A') ? '' : patient.suffix);

                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              navigatorData.currentWindow = '';
                              navigatorData.mainBody = bookSchedule(context);
                            });
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please review the fields before submitting.',
                              ),
                            ),
                          );
                        }
                        //inserted function here to send email notif of new sched to missed patient
                        sendConfirmationBookingEmailNotif(patient.uniqueId);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        fixedSize: Size(
                          width * 0.65,
                          height * 0.060,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //TODO: locked-personal-info
  Widget lockedPersonalInfo() {
    List patientData = [
      Text('First Name: ' + patient.firstName),
      Text('Middle Name: ' + patient.middleName),
      Text('Last Name: ' + patient.lastName),
      Text('Suffix: ' + patient.suffix),
      Text('Sex: ' + patient.sex),
      Text('Bday: ' + patient.bday),
      Text('Age: ' + patient.age),
      Text('Civil Status: ' + patient.civStatus),
      Text('Philhealth: ' + patient.philhealth),
      Text('Address: ' + patient.address),
      Text('Region: ' + patient.region),
      Text('Province: ' + patient.province),
      Text('City: ' + patient.city),
      Text('Barangay: ' + patient.brgy),
      Text('Zip: ' + patient.zip),
      Text('Contact Num: ' + patient.contact),
      Text('Email Address: ' + patient.email),
      Text('Cov19 Classification: ' + patient.covclass),
      Text('Employed? : ' + patient.employed),
      Text('Pregnant? : ' + patient.pregnant),
      Text('PWD: ' + patient.disability),
      Text('Interacted Covid: ' + patient.interactedCovid),
      Text('Diagnosed with Covid: ' + patient.isDiagnosed),
      Text('Diagnosed Date: ' + patient.diagnosedDate),
      Text('Allergies: '),
      for (var item in patient.allergies) Text(item),
      Text('Comorbidities: '),
      for (var item in patient.comorbidities) Text(item),
      // Text('Other Allergies: ' + patient.otherAllergies),
      // Text('Other Comorbidities: ' + patient.others),
    ];
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
            itemCount: patientData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: patientData[index],
              );
            }),
      ),
    );
  }

  //TODO: onboarding
  Widget onBoard(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Builder(
      builder: (context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(50, 35, 50, 35),
              child: Column(
                children: [
                  SizedBox(height: height * 0.20),
                  Image.asset('images/onb1.png'),
                  SizedBox(height: height * 0.10),
                  Text(
                    'Fill up the online form.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Average',
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.035,
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    width: width * 0.65,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'You won’t need to fill up a written form in the vaccination site once you filled the online form.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                  Image.asset('images/imagecp.png'),
                  SizedBox(height: height * 0.10),
                  Text(
                    'Book a schedule for\nvaccination.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Average',
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.040,
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    width: width * 0.65,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Choose your schedule at your most appropriate time and date.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                  Image.asset('images/onb2.png'),
                  SizedBox(height: height * 0.10),
                  Container(
                    width: width * 0.60,
                    child: Text(
                      'Get notified when your schedule is near.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.040,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.020),
                  Container(
                    width: width * 0.70,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Be reminded of your vaccination schedule a day before to be ready for the appointment.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Average',
                        fontSize: height * 0.024,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.10),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width * 0.38,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xFF26A98A).withOpacity(0.16),
                          blurRadius: 8,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              navigatorData.currentWindow = '';
                              navigatorData.mainBody = covidInfo(this.context);
                            },
                          );
                          //TODO: change navigation to COVID-19 Info
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF26A98A),
                          fixedSize: Size(
                            width * 0.35,
                            height * 0.065,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                        ),
                        child: Text(
                          'PROCEED',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.018,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //vaccine-information
  Widget vaccineInfo(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              //TODO: Add lang ari ug widgets para sa contents etol
              //TODO: Mao ni sa first part sa screening katong after sa booknow
              Padding(
                padding: EdgeInsets.only(top: height * 0.065),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => healthScreening(context),
                      ),
                    ); //TODO:change button action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF26A98A),
                    fixedSize: Size(
                      width * 0.35,
                      height * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                  child: Text('GET STARTED', style: _btnTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget healthScreening(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final TextStyle _btnTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      fontSize: height * 0.018,
      decoration: TextDecoration.none,
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: height * 0.065),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => myAppointment(context),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF26A98A),
                    fixedSize: Size(
                      width * 0.35,
                      height * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                  child: Text('FINISH BOOKING', style: _btnTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PatientSettings extends StatefulWidget {
  const PatientSettings({
    Key? key,
    @required this.context,
    @required this.auth,
  }) : super(key: key);

  final context;
  final auth;
  @override
  _PatientSettingsState createState() => _PatientSettingsState();
}

class _PatientSettingsState extends State<PatientSettings> {
  String fullname = patient.firstName +
      ' ' +
      patient.lastName +
      ' ' +
      ((patient.suffix == 'N/A') ? '' : patient.suffix);
  File? image;
  @override
  Widget build(BuildContext context) {
    return patientSettings(widget.context);
  }

  //TODO: patient-settings-functions
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imagePermanent;
        print('Image path:' + image.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future uploadFile() async {
    Reference ref = FirebaseStorage.instance
        .ref('profilePics/${patient.uniqueId}/')
        .child('patient_image.png');
    try {
      await ref.putFile(image!).then((_image) async {
        await ref.getDownloadURL().then((value) {
          patient.profilePic = value;
          patientCollection
              .doc(patient.uniqueId)
              .update({
                'ProfilePic': patient.profilePic,
              })
              .then((value) => print('profile pic updated'))
              .catchError(
                  (error) => print('Failed to update profile pic: $error'));
        });
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  //TODO: patient-settings
  Widget patientSettings(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final newpasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(40, 35, 45, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Account Information',
                            style: TextStyle(
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: height * 0.020),
                      ],
                    ),
                    Column(
                      children: [
                        Stack(children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.white,
                            backgroundImage: image == null
                                ? (patient.profilePic == 'images/user.png')
                                    ? AssetImage(patient.profilePic)
                                    : NetworkImage(patient.profilePic)
                                        as ImageProvider
                                : FileImage(image!),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  pickImage();
                                },
                                icon:
                                    Icon(Icons.add_a_photo, color: Colors.grey),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(height: height * 0.020),
                        Center(
                          child: Container(
                            child: Text(fullname,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xFF192A3E))),
                          ),
                        ),
                        SizedBox(height: height * 0.020),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                        TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: patient.email,
                          ),
                        ),
                        SizedBox(height: height * 0.020),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Current Password',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty || value != userdata.password) {
                              return 'Please input current password.';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: height * 0.020),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('New Password',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                        TextFormField(
                          controller: newpasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input new password.';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.020),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: width * 0.65,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1D74E9).withOpacity(0.16),
                            blurRadius: 8,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ]),
                        child: ElevatedButton(
                          onPressed: () async {
                            final isValid = _formKey.currentState!.validate();
                            if (isValid) {
                              try {
                                await widget.auth.currentUser!
                                    .updatePassword(newpasswordController.text)
                                    .then((value) {
                                  userDataCollection
                                      .doc(userdata.uniqueId)
                                      .update({
                                        'password': newpasswordController.text,
                                      })
                                      .then((value) => print('Add Admin User'))
                                      .catchError((error) => print(
                                          'Failed to add Admin user: $error'));
                                  uploadFile();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Saving Changes, Please reauthenticate.',
                                      ),
                                    ),
                                  );
                                  Future.delayed(const Duration(seconds: 3),
                                      () {
                                    setLocalSignOut();
                                    widget.auth.signOut();
                                    navigatorData.mainBody = null;
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => App(),
                                      ),
                                    );
                                  });
                                });
                              } on FirebaseAuthException catch (e) {
                                print(e);
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Password is too weak.',
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Password update unsuccessful.',
                                      ),
                                    ),
                                  );
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please review the fields before submitting.',
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[700],
                            fixedSize: Size(
                              width * 0.65,
                              height * 0.060,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.018,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
