import 'dart:math';

void main() async {
  String? s1;
  int a = 0;
  late bool b;
  Random random = new Random();
  int rn = random.nextInt(3) + 1;
  print("random number is $rn");

  switch (rn) {
    case 1:
      {
        s1 = rn.toString();
        Future.delayed(const Duration(seconds: 2),
            () => print("assigned variable is $s1"));
      }
      break;
    case 2:
      {
        a = 4;
        Future.delayed(
            const Duration(seconds: 2), () => print("assigned variable is $a"));
      }
      break;
    case 3:
      {
        b = true;
        Future.delayed(
            const Duration(seconds: 2), () => print("assigned variable is $b"));
      }
  }
  try {
    s1!.length;
    print(s1);
  } catch (_) {
    print("variable s1 is not assigned");
  }
  if (a != 0) {
    print(a);
  } else {
    print("variable a is not assiugned");
  }
  try {
    print(b);
  } catch (_) {
    print("variable b is not assigned");
  }

//   try {
//     print(s1);
//     print(a);
//     print(b);
//     if (s1 == null || a == null) {
//       throw Exception("variable is null");
//     }
//     // print('${s1}&${a}&${b}');
//   } catch (_) {
//     if (s1 != null) {
//       a = 4;
//       b = false;
//       //print('${s1}&${a}&${b}');

//       print(a);
//       print(b);
//     } else if (a != null) {
//       s1 = "not";
//       b = false;
//       //print('${s1}&${a}&${b}');
//       print(s1);
//       print(b);
//     } else {
//       a = 4;
//       s1 = "not";
//       //print('${s1}&${a}&${b}');
//       print(s1);
//       print(a);
//     }
//   }
}
