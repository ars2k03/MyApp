import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Contact.dart';
import 'Home_Screen.dart';
import 'Image.dart';
import 'Projects.dart';
import 'Skills.dart';
import 'chatbot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "A R S",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),

        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        )
      ),
      home: const Home(),
    );

  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectIndex = 2;

  final List <Widget> list = [
    HomeScreen(),
    Skills(),
    Chatbot(),
    Projects(),
    Contact()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A R S"),
        centerTitle: true,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage("assets/images/me_3.png"),
              ),
            ),
          ),
        ),

      ),

      body: list[selectIndex],

      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        index: selectIndex,
        onTap: (selectIndex) => setState(() {this.selectIndex = selectIndex;}),
        items: [
          Icon(Icons.home, size: 30,),
          Icon(FontAwesomeIcons.laptopCode, size: 30,),
          Icon(FontAwesomeIcons.robot, size: 30,),
          Icon(FontAwesomeIcons.diagramProject, size: 30, ),
          Icon(Icons.call, size: 30,),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 230,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.zero,
                  accountName: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("A R S Arafat"),
                  ),
                  accountEmail: const Text("arafatsohan2003@gmail.com"),
                  currentAccountPictureSize: const Size.square(100),
                  currentAccountPicture: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => ImageDetail(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/me_2.png"),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.person_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text("Projects"),
              leading: const Icon(
                FontAwesomeIcons.diagramProject,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Projects()),
                );
              },
            ),
            ListTile(
              title: const Text("Skills"),
              leading: const Icon(
                FontAwesomeIcons.laptopCode,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Skills()),
                );
              },
            ),
            ListTile(
              title: const Text("Contact Me"),
              leading: const Icon(Icons.call),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}