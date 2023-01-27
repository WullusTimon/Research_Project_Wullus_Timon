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
                      '1. Lie on your back on a flat bench. Grip a barbell with hands slightly wider than shoulder width. The bar should be directly over the shoulders.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '2. Press your feet firmly into the ground and keep your hips on the bench throughout the entire movement.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '3. Keep your core engaged and maintain a neutral spine position throughout the movement. Avoid arching your back.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '4. Slowly lift the bar or dumbbells off the rack, if using. Lower the bar to the chest, about nipple level, allowing elbows to bend out to the side, about 45 degrees away from the body.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '5. Stop lowering when your elbows are just below the bench. Press feet into the floor as you push the bar back up to return to starting position.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      '5. Perform 5 to 10 reps, depending on weight used. Perform up to 3 sets.',
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
