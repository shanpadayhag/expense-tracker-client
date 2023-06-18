import 'package:flutter/material.dart';

enum ColorEnum {
  deepLilac(Color(0xff9652ce)),
  bluishPurple(Color(0xff6c4ce9)),
  ultraMarineBlue(Color(0xff456efe)),
  pictonBlue(Color(0xff2cbef8)),
  brinkPink(Color(0xfffe627a)),
  desertStorm(Color(0xfff8f8fa)),
  paleSky(Color(0xff6f7582)),
  starDust(Color(0xffA1A1A1));

  final Color value;
  const ColorEnum(this.value);
}
