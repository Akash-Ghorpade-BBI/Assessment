/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
public class Main {

    public static void main(String[] args) {
        String input = "babad";
        String result = Solution.longestPalin(input);
        System.out.println("Longest palindromic substring: " + result);
    }
}


class Solution {
    static String longestPalin(String s) {
        int len = 0;
        String ans = "";

        for (int i = 0; i < s.length(); i++) {
        StringBuilder curr = new StringBuilder();

        for (int j = i; j < s.length(); j++) {
         curr.append(s.charAt(j));

            if (is_Palin(curr.toString())) {
                if (curr.length() > len) {
                    ans = curr.toString();
                    len = curr.length();
                }
            }
        }
    }
return ans;
}

    static boolean is_Palin(String s) {
        int n = s.length();
        int st = 0;
        int end = n - 1;

        while (st < end)
        {
            if (s.charAt(st) != s.charAt(end)) {
            return false;
            }
            st++;
            end--;
        }
        return true;
    }
}
