import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider();
  double redGamerHeight = 0.5;
  double blueGamerHeight = 0.5;

  bool isBlueGamerWin = false;
  bool isRedGamerWin = false;

  onRedGamerTap() {
    if (redGamerHeight >= 0.03 && blueGamerHeight <= 0.03) {
      print("Red Gamer Wins");
      isRedGamerWin = true;
      notifyListeners();
    } else {
      redGamerHeight += 0.03;
      blueGamerHeight -= 0.03;
      notifyListeners();
    }
  }

  onBlueGamerTap() {
    if (redGamerHeight <= 0.03 && blueGamerHeight >= 0.03) {
      print("Blue Gamer Wins");
      isBlueGamerWin = true;
      notifyListeners();
    } else {
      redGamerHeight -= 0.03;
      blueGamerHeight += 0.03;
      notifyListeners();
    }
  }

  restartGame() {
    redGamerHeight = 0.5;
    blueGamerHeight = 0.5;
    notifyListeners();

    isBlueGamerWin = false;
    isRedGamerWin = false;
    notifyListeners();
  }
}
