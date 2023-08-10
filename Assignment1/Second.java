/******************************************************************************

                            Online Java Compiler.
                Code, Compile, Run and Debug java program online.
Write your code in this editor and press "Run" button to execute it.

*******************************************************************************/

import java.util.*;
public class Main
{
      public int[] smallerNumbers(int[] nums) {
        int n = nums.length;
        int[] count = new int[101];  
        for (int num : nums) {
            count[num]++;
        }
        
        for (int i = 1; i <= 100; i++) {
            count[i] += count[i - 1];
        }
        
        int[] result = new int[n];
        for (int i = 0; i < n; i++) {
            result[i] = nums[i] == 0 ? 0 : count[nums[i] - 1];
        }
        
        return result;
    }

    public static void main(String[] args) {
       Main solution = new Main();
        
        int[] nums1 = {8, 1, 2, 2, 3};
        int[] Ans = solution.smallerNumbers(nums1);
        System.out.println(Arrays.toString(Ans));  
      }
}

