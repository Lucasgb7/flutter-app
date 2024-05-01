import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Default data
class ModelData {
  // Lighting
  var ilumH1 = false.obs;
  var ilumH2 = true.obs;
  var ilumH3 = false.obs;
  // Temperature
  var tempT1 = 25.obs;
  var tempT2 = 24.obs;
  var tempT3 = 20.obs;

  // Settings
  // Temperature Unit -> 1: C / 2: K
  var tempUnit = 1.obs;
  var projectTheme = Colors.blue.obs;
}