import 'dart:math';

void main() async {
  String? s1;
  int a=0;
  late bool b;

  Random random = new Random();
  int rn = random.nextInt(3) + 1;
  print("random number is $rn");

  switch (rn) {
    case 1:
      {
        s1 = rn.toString();
        Future.delayed(const Duration(seconds: 2),
            () => print("assigned variable is $s1"));//printing the assigned value after 2 sec
      }
      break;
    case 2:
      {
        a = 4;
        Future.delayed(
            const Duration(seconds: 2), 
            () => print("assigned variable is $a"));//printing the assigned value after 2 sec
      }
      break;
    case 3:
      {
        b = true;
        Future.delayed(
            const Duration(seconds: 2), 
            () => print("assigned variable is $b"));//printing the assigned value after 2 sec
      }
  }
  
  try {
    s1!.length; //if s1 notassigned we can enterd in catch block
    print(s1);
  } catch (_) {
    print("variable s1 is not assigned");// if not assigned then print
  }
  
  if(a!=0){
    print(a); //if a is assigned by switchcase then prints the assigned value
  }
  else{
    print("variable a is not assiugned");// if not assigned then print
  }
 
  
  try {
    print(b); //if b is assigned by switchcase then prints the assigned value
  } catch (_) {
    print("variable b is not assigned");// if not assigned then print
  }
}
