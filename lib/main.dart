import 'package:flutter/material.dart';
import 'package:task_manager_app/Home_Screen.dart';
import 'package:task_manager_app/Routes/Profile_Page.dart';
import 'package:task_manager_app/Task_Provider.dart';
import 'package:task_manager_app/pages/First_page.dart';
import 'package:task_manager_app/pages/Second_page.dart';
import 'package:task_manager_app/pages/Third_page.dart';
import 'package:provider/provider.dart';
import 'Routes/PieChart_page.dart';


void main() {
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => MyProvider()
          )
        ],
          child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isdarktheme=false;

  void toggletheme(){
    setState(() {
      isdarktheme= !isdarktheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Pages
      themeMode: isdarktheme ? ThemeMode.dark :ThemeMode.light,

      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(toggletheme: toggletheme,isdarktheme: isdarktheme),
        '/first': (context) => FirstPage(toggletheme: toggletheme,isdarktheme: isdarktheme,),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage(),
        '/profile':(context) => const ProfilePage(),
        '/piechart':(context) => const PiechartPage(),
      },



      //Themes
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(
            239, 204, 246, 1.0),
        primary:const Color.fromRGBO(246, 188, 246, 1.0),
      ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        ),

          bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
      ),
      ),

      //dark theme
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(33, 33, 33, 1.0),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
