import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:research_project/more-info.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'dart:math' as math;

class ArScene extends StatefulWidget {
  const ArScene({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArSceneState createState() => _ArSceneState();
}

class _ArSceneState extends State<ArScene> {
  late ARKitController arkitController;
  ARKitReferenceNode? boxNode;
  Timer? timer;

  // models
  String model = '';
  String model1 = 'models.scnassets/Incline_bench_press_model.usdz';
  String model2 = 'models.scnassets/Heavy_leg_press.usdz';

  @override
  void dispose() {
    timer?.cancel();
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('GYM AR'),
          backgroundColor: const Color.fromRGBO(224, 24, 24, 1),
          shadowColor: const Color.fromRGBO(224, 24, 24, 0),
        ),
        body: ARKitSceneView(
          detectionImagesGroupName: 'AR Resources',
          enableTapRecognizer: true,
          enablePinchRecognizer: true,
          enablePanRecognizer: true,
          enableRotationRecognizer: true,
          debug: true,
          onARKitViewCreated: onARKitViewCreated,
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.addCoachingOverlay(CoachingOverlayGoal.anyPlane);
    this.arkitController.onNodeTap = (nodes) => onNodeTapHandler();
    this.arkitController.onAddNodeForAnchor = onAnchorWasFound;

    this.arkitController.onNodePinch = (pinch) => _onPinchHandler(pinch);
    this.arkitController.onNodePan = (pan) => _onPanHandler(pan);
    this.arkitController.onNodeRotation =
        (rotation) => _onRotationHandler(rotation);
    // addNode();
  }

  void onAnchorWasFound(ARKitAnchor anchor) {
    debugPrint(anchor.identifier);

    setState(() {
      final node = ARKitReferenceNode(
        name: 'node1',
        url: 'models.scnassets/Incline_bench_press_model.usdz',
        isHidden: false,
        position: vector.Vector3(-0.2, -0.3, -0.5),
        eulerAngles: vector.Vector3(0.3, 0, 0),
        light: ARKitLight(
          type: ARKitLightType.directional,
        ),
      );
      arkitController.add(node);

      final node2 = ARKitReferenceNode(
        name: 'node2',
        url: 'models.scnassets/Heavy_leg_press.usdz',
        isHidden: false,
        position: vector.Vector3(-0.2, -0.3, -0.5),
        eulerAngles: vector.Vector3(0.3, 0, 0),
        light: ARKitLight(
          type: ARKitLightType.directional,
        ),
      );

      if (anchor.identifier == '2D1E6C78-601E-54A5-FC37-2FE5A0340185') {
        arkitController.add(node);
        boxNode = node;
        arkitController.remove('node2');
      } else if (anchor.identifier == '88A34468-C336-0652-FA6A-3504FF1F12F8') {
        arkitController.add(node2);
        boxNode = node;
        arkitController.remove('node1');
      }
    });

    // final node2 = ARKitReferenceNode(
    //   url: model2,
    //   position: vector.Vector3(-0.2, -0.3, -0.5),
    //   eulerAngles: vector.Vector3(0.3, 0, 0),
    //   light: ARKitLight(
    //     type: ARKitLightType.directional,
    //   ),
    // );

    // if (anchor.identifier == '2D1E6C78-601E-54A5-FC37-2FE5A0340185') {
    //   arkitController.add(node);
    //   arkitController.removeAnchor(node2.url);
    // } else if (anchor.identifier == '88A34468-C336-0652-FA6A-3504FF1F12F8') {
    //   arkitController.add(node2);
    //   arkitController.removeAnchor(node.url);
    // }
  }

// Add 3D model to AR
  // void addNode() {
  //   final node = ARKitReferenceNode(
  //       url: 'models.scnassets/Incline_bench_press_model.usdz',
  //       // scale: Vector3.all(0.005),
  //       position: vector.Vector3(0, -0.3, -0.5),
  //       eulerAngles: vector.Vector3(0, 0, 0),
  //       light: ARKitLight(
  //         type: ARKitLightType.directional,
  //       ));
  //   arkitController.add(node);
  //   // boxNode = node;
  // }

// Go to detail page of model
  void onNodeTapHandler() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return const MoreInfo();
      }),
    );
  }

  void _onPinchHandler(List<ARKitNodePinchResult> pinch) {
    final pinchNode = pinch.firstWhereOrNull(
      (e) => e.nodeName == boxNode?.name,
    );
    if (pinchNode != null) {
      final scale = vector.Vector3.all(pinchNode.scale);
      boxNode?.scale = scale;
    }
  }

  void _onPanHandler(List<ARKitNodePanResult> pan) {
    final panNode = pan.firstWhereOrNull((e) => e.nodeName == boxNode?.name);
    if (panNode != null) {
      final old = boxNode?.eulerAngles;
      final newAngleY = panNode.translation.x * math.pi / 180;
      boxNode?.eulerAngles =
          vector.Vector3(old?.x ?? 0, newAngleY, old?.z ?? 0);
    }
  }

  void _onRotationHandler(List<ARKitNodeRotationResult> rotation) {
    final rotationNode = rotation.firstWhereOrNull(
      (e) => e.nodeName == boxNode?.name,
    );
    if (rotationNode != null) {
      final rotation = boxNode?.eulerAngles ??
          vector.Vector3.zero() + vector.Vector3.all(rotationNode.rotation);
      boxNode?.eulerAngles = rotation;
    }
  }
}


// example of loading 2 objects based on different images
// import 'package:arkit_plugin/arkit_plugin.dart';
// import 'package:flutter/material.dart';

// class ARScene extends StatefulWidget {
//   @override
//   _ARSceneState createState() => _ARSceneState();
// }

// class _ARSceneState extends State<ARScene> {
//   ARKitController arKitController;
//   ARKitReferenceNode model1;
//   ARKitReferenceNode model2;

//   @override
//   void initState() {
//     super.initState();
//     model1 = ARKitReferenceNode(
//       url: 'assets/model1.scn',
//     );
//     model2 = ARKitReferenceNode(
//       url: 'assets/model2.scn',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ARKitSceneView(
//         detectionImagesGroupName: 'image',
//         onARKitViewCreated: onARKitViewCreated,
//       ),
//     );
//   }

//   void onARKitViewCreated(ARKitController arKitController) {
//     this.arKitController = arKitController;
//     final config = ARKitImageTrackingConfiguration();
//     config.detectionImages = [
//         ARKitReferenceImage(image: Image.asset('assets/image1.jpeg'), name: 'image1'),
//         ARKitReferenceImage(image: Image.asset('assets/image2.jpeg'), name: 'image2')
//     ];
//     arKitController.setup(config);
//     arKitController.onNodeTapped = (name) {
//       if(name == 'image1') {
//         arKitController.add(model1);
//       }else if(name == 'image2') {
//         arKitController.add(model2);
//       }
//     };
//   }

//   @override
//   void dispose() {
//     arKitController?.dispose();
//     super.dispose();
//   }
// }

