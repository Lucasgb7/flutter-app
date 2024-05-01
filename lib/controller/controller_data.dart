import 'package:dwm2/model/model_data.dart';
import 'package:dwm2/view/firebase_helper.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ControllerData {
  var model = ModelData();

  updateIlum(String h, bool value){
    switch (h) {
      case 'h1':
        model.ilumH1.value = value;
        break;
      case 'h2':
        model.ilumH2.value = value;
        break;
      case 'h3':
        model.ilumH3.value = value;
        break;

      default:
        StateError("Error! Ligth was not found!");
    }
  }

  toggleIlum(String h) {
    switch (h) {
      case 'h1':
        model.ilumH1.value = (model.ilumH1.value ? false : true);
        updateFirebase('/ilum', 'h1', model.ilumH1.value);
        break;
      case 'h2':
        model.ilumH2.value = (model.ilumH2.value ? false : true);
        updateFirebase('/ilum', 'h2', model.ilumH2.value);
        break;
      case 'h3':
        model.ilumH3.value = (model.ilumH3.value ? false : true);
        updateFirebase('/ilum', 'h3', model.ilumH3.value);
        break;

      default:
        StateError("Error! Ligth was not found!");
    }
  }

  changeTemp(String t, int value) {
    switch (t) {
      // Sensor 1
      case 't1':
        model.tempT1.value = value;
        break;
      // Sensor 2
      case 't2':
        model.tempT2.value = value;
        break;
      // Sensor 3
      case 't3':
        model.tempT3.value = value;
        break;

      default:
        StateError("Error! Sensor was not found!");
    }
  }

  convertTemp(int tempUnit) {
    // Check if the value was changed
    if (tempUnit != model.tempUnit.value) {
      model.tempUnit.value = tempUnit;
      // Celsius
      if (tempUnit == 1) {
        model.tempT1.value = model.tempT1.value - 273;
        model.tempT2.value = model.tempT2.value - 273;
        model.tempT3.value = model.tempT3.value - 273;
      } else { // Kelvin
        model.tempT1.value = model.tempT1.value + 273;
        model.tempT2.value = model.tempT2.value + 273;
        model.tempT3.value = model.tempT3.value + 273;
      }
    }
  }
}