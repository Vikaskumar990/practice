import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import './src/class_builder.dart';
import './src/home.dart';
//import './src/notification.dart';
//import './src/settings.dart';
//import 'package:kf_drawer/kf_drawer.dart';
import 'business/verification_screen.dart';
import 'login/login_screen.dart';
// import 'onboarding/Home/home_screen.dart';
import 'onboarding/screen_one.dart';
import 'signup/signup_screen.dart';
import 'welcome/welcome_screen.dart';
import 'constants.dart';
int initScreen;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  initScreen = 0;
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: initScreen == 0 || initScreen == null ? 'welcomepage' : 'home',
      routes: {
        "welcomepage" : (context) => WelcomeScreen(),
        "login" : (context) => LoginScreen(),
        "signup"  : (context) => SignUpScreen(),
        "medSupply" : (context) => VerificationScreen(),
        'home' : (context) => Home(),
        'onboard' : (context) => OnboardingScreenOne(),

      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
/*
class MyHomePage extends KFDrawerContent {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
        initialPage: ClassBuilder.fromString('Home'),
        items: [
          KFDrawerItem.initWithPage(
            text: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            page: Home(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              "Notifications",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
            ),
            page: Notifications(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            page: Settings(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            page: Settings(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            page: Settings(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            page: Settings(),
          ),
          KFDrawerItem.initWithPage(
            text: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            page: Settings(),
          ),
        ]);
  }

  /*final List _tabIcons = List.unmodifiable([
    {'icon': 'assets/img.jpg', 'title': 'shop'},
    {'icon': 'assets/img.jpg', 'title': 'shop'},
    {'icon': 'assets/img.jpg', 'title': 'shop'},
    {'icon': 'assets/img.jpg', 'title': 'shop'},
    {'icon': 'assets/img.jpg', 'title': 'shop'},
  ]);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage('images/img.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ABC",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "doct",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            "Logout",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1.0),
        ),
      ),
    );
  }
}
*/