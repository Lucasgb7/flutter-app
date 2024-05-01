import 'package:dwm2/model/model_data.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ControllerData {
  var model = ModelData();

  toggleIlum(int h) {
    if (h == 1) {
      // Trigger 1st light
      print('Trigger 1st light');
    } else if (h == 2) {
      // Trigger 2nd light
      print('Trigger 2nd light');
    } else if (h == 3) {
      // Trigger 3rd light
      print('Trigger 3rd light');
    } else {
      // Return nothing
      print('No light provided!');
    }
  }

  changeTemp(int t, int value) {
    switch (t) {
      // Sensor 1
      case 1:
        model.tempT1 = value as RxInt;
        break;
      // Sensor 2
      case 2:
        model.tempT2 = value as RxInt;
        break;
      // Sensor 3
      case 3:
        model.tempT3 = value as RxInt;
        break;

      default:
        StateError("Error! Sensor was not found!");
    }
  }
}