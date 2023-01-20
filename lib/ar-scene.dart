import 'package:flutter/material.dart';
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

  @override
  void dispose() {
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
        enableTapRecognizer: true,
        enablePinchRecognizer: true,
        enablePanRecognizer: true,
        enableRotationRecognizer: true,
        // debug: true,
        onARKitViewCreated: onARKitViewCreated,
      ));

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.addCoachingOverlay(CoachingOverlayGoal.anyPlane);
    this.arkitController.onNodeTap = (nodes) => onNodeTapHandler();
    this.arkitController.onNodePinch = (pinch) => _onPinchHandler(pinch);
    this.arkitController.onNodePan = (pan) => _onPanHandler(pan);
    this.arkitController.onNodeRotation =
        (rotation) => _onRotationHandler(rotation);
    addNode();
  }

// Add 3D model to AR
  void addNode() {
    final node = ARKitReferenceNode(
        url: 'models.scnassets/Incline_bench_press_model.usdz',
        // scale: Vector3.all(0.005),
        position: vector.Vector3(0, -0.3, -0.5),
        eulerAngles: vector.Vector3(0, 0, 0),
        light: ARKitLight(
          type: ARKitLightType.directional,
        ));
    arkitController.add(node);
    boxNode = node;
  }

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
