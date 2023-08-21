/******************************************************************************

                            Online Java Compiler.
                Code, Compile, Run and Debug java program online.
Write your code in this editor and press "Run" button to execute it.

*******************************************************************************/

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        System.out.println(check(number));
    }

    public static String check(int number) {
        String[] ones = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
        String[] tens = {"", "", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninty"};

        if (number == 0) {
            return "zero";
        }

        String[] thousands = {"", "thousand", "million", "billion", "trillion", "quadrillion"};
        String result = "";
        int index = 0;

        while (number > 0) {
            int s1 = number % 1000;
            if (s1 == 0) {
                s1 = number / 1000;
                return three_digit(s1) + " thousands";
            } else {
                if (s1 > 0) {
                    if (index > 0) {
                        result = three_digit(s1) + " " + thousands[index] + " " + result;
                    } else {
                        result = three_digit(s1) + " " + result;
                    }
                }
                number = number / 1000;
                index += 1;
            }
        }
        return result;
    }

    public static String three_digit(int number) {
        String[] ones = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
        String[] tens = {"", "", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninty"};

        if (number < 20) {
            return ones[number];
        } else if (number < 100) {
            return tens[number / 10] + " " + ones[number % 10];
        } else if (number < 1000) {
            if ((number % 100) / 10 == 1) {
                return ones[number / 100] + " Hundred " + ones[(number % 100)];
            } else {
                return ones[number / 100] + " Hundred " + tens[(number % 100) / 10] + ' ' + ones[(number % 100) % 10];
            }
        }
        return "";
    }
}

