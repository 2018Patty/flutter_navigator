import 'package:flutter/material.dart';
import 'login.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => Login(),
        // '/attraction' : (context) => Attraction(),
      },
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    double widthViewport = MediaQuery.of(context).size.width;
    double heightViewPort = MediaQuery.of(context).size.height;
    final userController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
          width: widthViewport * 0.7,
          height: heightViewPort,
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Home'),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Your name',
                ),
                keyboardType: TextInputType.text,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Welcome()),
                  // );
                  Navigator.pushNamed(
                    context,
                    '/welcome',
                    arguments: {
                      // 'user': 'Pattaraporn Warinatrawej',
                      'user': userController.text,
                      'password': '456',
                    },
                  );
                },
                child: const Text('Welcome'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
