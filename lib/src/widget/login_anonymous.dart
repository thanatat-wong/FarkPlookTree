import 'package:flutter/material.dart';

import '../config/language.dart';
import '../service/type_login.dart';

/// Widget main with social networks
class LoginAnonymous extends StatefulWidget {
  /// color main login
  final Color backgroundColor;

  ///color of card where are the login icons
  final Color cardColor;

  /// color of text in login
  final Color textColor;

  /// url logo main in login
  final String pathLogo;

  ///button when you want to avoid the login and go to the application content
  final bool isExploreApp;

  ///function when you want to avoid the login and go to the application content
  final Function functionExploreApp;

  ///widget to put a footer in your login
  final bool isFooter;

  /// custom widget footer
  final Widget widgetFooter;

  /// list type login import in login
  final List<LoginFreshTypeLoginModel> typeLoginModel;

  /// is signUp in login
  final bool isSignUp;

  ///widget signUp
  final Widget widgetSignUp;

  //model of key words used in login
  LoginFreshWords keyWord;

  LoginAnonymous(
      {@required this.pathLogo,
      this.typeLoginModel,
      this.isExploreApp,
      this.functionExploreApp,
      this.isSignUp,
      this.widgetSignUp,
      this.isFooter,
      this.widgetFooter,
      this.backgroundColor,
      this.cardColor,
      this.textColor,
      this.keyWord});

  @override
  _LoginAnonymousState createState() => _LoginAnonymousState();
}

class _LoginAnonymousState extends State<LoginAnonymous> {
  @override
  Widget build(BuildContext context) {
    widget.keyWord = widget.keyWord ?? LoginFreshWords();

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: widget.backgroundColor ?? Color(0xFF3EAF51),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'เข้าสู่ระบบแบบไม่ระบุตัวตน',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
      body: Stack(
        children: [
          Container(
            color: widget.backgroundColor ?? Color(0xFF3EAF51),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: Align(
                  alignment: FractionalOffset(0, 0),
                  child: Image.asset(
                    widget.pathLogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.58,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: widget.cardColor ?? Color(0xFFF3F3F5),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(),
                    Column(
                      children: [
                        buildLoginWith(),
                        buildWarning(),
                        buildLoginAnonymous(context),
                        (widget.isExploreApp == null ||
                                widget.isExploreApp == false)
                            ? SizedBox()
                            : SizedBox(
                                height: 20,
                              ),
                        (widget.isSignUp == null || widget.isSignUp == false)
                            ? SizedBox()
                            : buildSignUp(),
                        Text(
                          'หรือ\n',
                          style: TextStyle(
                              color: widget.textColor ?? Color(0xFF0F2E48),
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                        buildTypeLogin(context),
                      ],
                    ),
                    (widget.isFooter == null || widget.isFooter == false)
                        ? SizedBox()
                        : widget.widgetFooter
                  ],
                ),
              ))
        ],
      ),
    );
  }

  GestureDetector buildSignUp() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'หากคุณต้องการเก็บประวัติการปลูกของคุณ คุณสามารถ ',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    color: widget.textColor ?? Color(0xFF0F2E48),
                    fontWeight: FontWeight.normal,
                    fontSize: 12)),
            TextSpan(
                text: widget.keyWord.signUp,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: widget.textColor ?? Color(0xFF0F2E48),
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ]),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_buildContext) => widget.widgetSignUp));
      },
    );
  }

  Widget buildLoginAnonymous(BuildContext context) {
    return (widget.isExploreApp == null || widget.isExploreApp == false)
        ? SizedBox()
        : GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_buildContext) => widget.widgetSignUp));
            },
            child: SizedBox(
              width: 100,
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                        child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                          color: widget.textColor ?? Color(0xFF0F2E48),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                  )),
            ));
  }

  SizedBox buildTypeLogin(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: (widget.typeLoginModel.length > 3)
          ? MediaQuery.of(context).size.width * 0.90
          : MediaQuery.of(context).size.width * 0.80,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: this.getCardLogin()),
        ),
      ),
    );
  }

  Padding buildLoginWith() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('เข้าสู่ระบบแบบไม่ระบุตัวตน',
          style: TextStyle(
              color: widget.textColor ?? Color(0xFF0F2E48),
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    );
  }

  Padding buildWarning() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Text(
          'หากคุณเข้าสู่ระบบแบบไม่ระบุตัวตน คุณจะไม่สามารถเก็บประวัติ\nการปลูกของคุณได้ คุณแน่ใจหรือไม่ที่จะดำเนินการต่อ',
          style: TextStyle(
              color: widget.textColor ?? Color(0xFF0F2E48),
              fontSize: 14,
              fontWeight: FontWeight.bold)),
    );
  }

  List<Widget> getCardLogin() {
    List<Widget> list = [];

    for (LoginFreshTypeLoginModel tlm in widget.typeLoginModel) {
      list.add(GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: ExactAssetImage(
              tlm.logo,
            ),
          ),
        ),
        onTap: () {
          tlm.callFunction(context);
        },
      ));
    }

    return list;
  }
}
