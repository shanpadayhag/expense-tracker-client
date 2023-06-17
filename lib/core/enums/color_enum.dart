import 'package:flutter/material.dart';

enum ColorEnum {
  deepLilac(Color(0xff9652ce)),
  bluishPurple(Color(0xff6c4ce9)),
  ultraMarineBlue(Color(0xff456efe));

  final Color value;
  const ColorEnum(this.value);
}
