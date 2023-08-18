import 'dart:core';

void main() {
  String str = "2TZ1C1N1NJSNAOETOP7T8N4FZEULH3DJKZH7PDLP3C54JJKDOTUIPEGO8097";
  int a = str.length;
  int b = a - 4;
  String s1 = str.substring(b, a);
  String s2 = str.substring(0, b);
  String ans = "";
  int y = 0;
  print(s2);
  int c = int.parse(s1);
  for (int i = 0; i < 4; i++) {
    String ch = s1[i];
    int x = int.parse(ch);
    y = y + x;
    ans += s2.substring(y, y + 8);
    y = y + 8;
  }
  print(ans);
}
