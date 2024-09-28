import 'package:flutter/material.dart';

import 'colors.dart';


class ColorNotifier with ChangeNotifier {
  bool isDark = false;

  set setIsDark(v) {
    isDark = v;
    notifyListeners();
  }

  get getIsdark => isDark;

  get getwhite => isDark ? darkwhite : white;

  get getbgcolor => isDark ? bgcolor : darkbgcolor;

  get getbgcolor10 => isDark ? bgcolor : White1;
  get getbgcolor11 => isDark ? colorbg : white;

  get getbgcolor1 => isDark ? darkbgcolor : bgcolor;


  get getblackcolor => isDark ? blackcolor : darkblackcolor;
  get getblackcolor2 => isDark ? white :  White1;

  get getgrey => isDark ? grey : darkgrey;
  get getgrey1 => isDark ? grey3 : grey2;

  get getbottomcolor => isDark ? darkbottomcolor : bottomcolor;

  get getbgfildcolor => isDark ? bgfildcolor : darkbgfildcolor;

  get getdarkblackcolor1 => isDark ? darkblackcolor1 : darkblackcolor1;

  get getblack1 => isDark ? darkblackcolor1 : darkblackcolor1;

  get getwhite1 => isDark ? darkwhite1 : darkwhite1;

  get greengrey => isDark ? white : grey;

  get black1 => isDark ? darkblackcolor1 : darkgrey;

  get bottom1 => isDark ? bottom : grey10;

  get bottom2 => isDark ? bottom : darkbgcolor;

  get bottom => isDark ? bgcolor : white;

  get blublack1 => isDark ? blueblack : bgcolor;
  get Getgrey => isDark ? grey4 : const Color(0xffF5F5F5);
  get Getblack => isDark ? bgcolor : const Color(0xffF5F5F5);
  get Getblgr => isDark ? bgcolor : darkwhite1;
  get Getblg1 => isDark ? grey4 : bule;
  get Getblg2 => isDark ? colorBg : White1;
  get Tab => isDark ? tab1 : tab;


  get verifi => isDark ? Image.asset('assets/night mode.svg') : Image.asset('assets/sun.svg');
  // ignore: non_constant_identifier_names
  void isavalable(bool value) {
    isDark = value;
    notifyListeners();
  }
}


