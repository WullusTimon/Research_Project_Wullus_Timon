import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:research_project/ml/screens/camera.dart';

class MyMLHomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const MyMLHomePage(this.cameras, {super.key});
  @override
  _MyMLHomePageState createState() => _MyMLHomePageState();
}

class _MyMLHomePageState extends State<MyMLHomePage> {
  String predOne = '';
  double confidence = 0;
  double index = 0;

  @override
  void initState() {
    super.initState();
    loadTfliteModel();
  }

  loadTfliteModel() async {
    String? res;
    res = await Tflite.loadModel(
        model: "assets/ml/model_unquant.tflite",
        labels: "assets/ml/labels.txt");
    // debugPrint(res);
  }

  setRecognitions(outputs) {
    // print(outputs);

    if (outputs[0]['index'] == 0) {
      index = 0;
    } else {
      index = 1;
    }

    confidence = outputs[0]['confidence'];

    setState(() {
      predOne = outputs[0]['label'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Scan for equipment",
          style: TextStyle(fontFamily: 'Kanit'),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 25, 11),
      ),
      body: Stack(
        children: [
          Camera(widget.cameras, setRecognitions),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: const Color.fromARGB(255, 230, 25, 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                    index == 0
                                        ? 'box handschoen ${(confidence * 100).toStringAsFixed(0)} %'
                                        : 'Gym matje ${(confidence * 100).toStringAsFixed(0)} %',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20.0,
                                        fontFamily: 'Kanit'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              // Expanded(
                              //   flex: 8,
                              //   child: SizedBox(
                              //     height: 32.0,
                              //     child: Stack(
                              //       children: [
                              //         LinearProgressIndicator(
                              //           valueColor:
                              //               const AlwaysStoppedAnimation<Color>(
                              //                   Colors.redAccent),
                              //           value: index == 0 ? confidence : 0.0,
                              //           backgroundColor:
                              //               Colors.redAccent.withOpacity(0.2),
                              //           minHeight: 50.0,
                              //         ),
                              //         Align(
                              //           alignment: Alignment.centerRight,
                              //           child: Text(
                              //             '${index == 0 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                              //             style: const TextStyle(
                              //                 color: Colors.white,
                              //                 fontWeight: FontWeight.w600,
                              //                 fontSize: 20.0),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                          // const SizedBox(
                          //   height: 16.0,
                          // ),
                          // Row(
                          //   children: [
                          //     const Expanded(
                          //       flex: 2,
                          //       child: Text(
                          //         'GymMat',
                          //         style: TextStyle(
                          //             color: Colors.orangeAccent,
                          //             fontWeight: FontWeight.w600,
                          //             fontSize: 20.0),
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 16.0,
                          //     ),
                          //     Expanded(
                          //       flex: 8,
                          //       child: SizedBox(
                          //         height: 32.0,
                          //         child: Stack(
                          //           children: [
                          //             LinearProgressIndicator(
                          //               valueColor:
                          //                   const AlwaysStoppedAnimation<Color>(
                          //                       Colors.orangeAccent),
                          //               value: index == 1 ? confidence : 0.0,
                          //               backgroundColor: Colors.orangeAccent
                          //                   .withOpacity(0.2),
                          //               minHeight: 50.0,
                          //             ),
                          //             Align(
                          //               alignment: Alignment.centerRight,
                          //               child: Text(
                          //                 '${index == 1 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                          //                 style: const TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.w600,
                          //                     fontSize: 20.0),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
