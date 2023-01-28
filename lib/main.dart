import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:research_project/ar-scene.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 230, 25, 11),
          fontFamily: 'Kanit',
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: const MyHomePage(title: 'Flutter Demo Gym AR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(224, 24, 24, 0),
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/images/gym_home.jpg'),
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  'Welcome Stranger!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 12, 12, 12),
                      letterSpacing: 0.5),
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(
                "Don't know what to do? No problem!\nWith our new technology you are able to do every exercise right.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 96, 96, 96),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const ArScene();
                    }),
                  );
                },
                child: const Text('Start the AR-scene'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
