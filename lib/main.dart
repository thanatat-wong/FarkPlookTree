import 'package:farkplooktreeapp/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'Pages/homePage.dart';
import 'login_fresh.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //You have to create a list with the type of login's that you are going to import into your application

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().currentUser),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {},
        title: 'FarkPlookTree',
        theme: ThemeData(
          fontFamily: 'Kanit',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
        // Scaffold(body: buildLoginFresh())
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return Home();
    }
    return Scaffold(body: buildLoginFresh());
  }

  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            _buildContext.read<AuthenticationService>().signInWithFacebook();
          },
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            _buildContext.read<AuthenticationService>().signInWithGoogle();
          },
          logo: TypeLogo.google),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
            ));
          },
          logo: TypeLogo.userPassword),
    ];

    return LoginFresh(
        pathLogo: 'assets/thumbnail.png',
        isExploreApp: true,
        functionExploreApp: () {
          // develop what they want the ExploreApp to do when the user clicks
        },
        isFooter: true,
        widgetFooter: this.widgetFooter(),
        typeLoginModel: listLogin,
        isSignUp: true,
        widgetSignUp: this.widgetLoginFreshSignUp(),
        widgetLoginAnonymous: this.widgetLoginAnonymous());
  }

  Widget widgetLoginFreshUserAndPassword() {
    return LoginFreshUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(user);
          print(password);
          _context
              .read<AuthenticationService>()
              .signIn(email: user, password: password)
              .then((value) => {
                    if (value == "Signed in")
                      {
                        Navigator.of(_context).pop(MaterialPageRoute(
                          builder: (_context) => Home(),
                        )),
                      }
                  });
          print('-------------- end call----------------');

          isRequest(false);
        });
      },
      logo: './assets/thumbnail.png',
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/thumbnail.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(email);
          print(
              _context.read<AuthenticationService>().sendRecoveryEmail(email));

          print('-------------- end call----------------');
          isRequest(false);
        });
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
    );
  }

  Widget widgetFooter() {
    return LoginFreshFooter(
      logo: 'assets/PATT_Foundation.png',
      text: 'สนับสนุนโดย',
      funFooterLogin: () {
        // develop what they want the footer to do when the user clicks
      },
    );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
        isFooter: true,
        widgetFooter: this.widgetFooter(),
        logo: 'assets/thumbnail.png',
        funSignUp: (BuildContext _context, Function isRequest,
            SignUpModel signUpModel) {
          isRequest(true);

          print(signUpModel.email);
          print(signUpModel.password);
          print(signUpModel.repeatPassword);
          print(signUpModel.surname);
          print(signUpModel.name);

          _context
              .read<AuthenticationService>()
              .signUp(
                  email: signUpModel.email,
                  password: signUpModel.password,
                  firstname: signUpModel.name,
                  lastname: signUpModel.surname)
              .then((value) {
            Navigator.of(_context).pop();
          });

          isRequest(false);
        });
  }

  Widget widgetLoginAnonymous() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            _buildContext.read<AuthenticationService>().signInWithFacebook();
          },
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            _buildContext.read<AuthenticationService>().signInWithGoogle();
          },
          logo: TypeLogo.google),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
            ));
          },
          logo: TypeLogo.userPassword),
    ];
    return LoginAnonymous(
      pathLogo: 'assets/thumbnail.png',
      isExploreApp: true,
      functionExploreApp: () {
        // develop what they want the ExploreApp to do when the user clicks
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      typeLoginModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetLoginFreshSignUp(),
    );
  }
}
