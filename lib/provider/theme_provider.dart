import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Colors.blueGrey,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class ThemeProvider extends ChangeNotifier {
  int selectedColor = 0;
  ThemeData themeData = ThemeData();
  void changeTheme(){
    selectedColor +=1;
    if(selectedColor>6){
      selectedColor=0;
    }
    notifyListeners();
  }
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark,
    );
  }
}