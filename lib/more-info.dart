import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  bool isSwitch = false;
  bool? isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(224, 24, 24, 0),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                      'assets/images/Incline_barbell_bench_press.png'),
                ),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                        child: Text(
                          "CHEST",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: const Color.fromARGB(255, 100, 9, 9),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                        child: Text(
                          "UPPER BODY",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'Incline bench press',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 12, 12, 12),
                        letterSpacing: 0.5),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "The purpose of the incline press is to focus more of the work on the upper pecs.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 96, 96, 96),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        'How to?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 12, 12, 12),
                            letterSpacing: 0.5),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '1. Place feet flat on the floor as you lean back slightly, so your back rests against the bench with a neutral spine.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '2. Place feet flat on the floor as you lean back slightly, so your back rests against the bench with a neutral spine.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '3. Press the weight upward over your eyes or slightly higher, with elbows extended to 45 degrees.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '4. Place feet flat on the floor as you lean back slightly, so your back rests against the bench with a neutral spine.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '5. Repeat the press and perform around 5 reps or more. Keep in mind that reps depend on your goals and the weight. Someone using heavier weights may do fewer reps than someone using lighter weights.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
