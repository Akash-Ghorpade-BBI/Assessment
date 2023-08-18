/******************************************************************************

                            Online Java Compiler.
                Code, Compile, Run and Debug java program online.
Write your code in this editor and press "Run" button to execute it.

*******************************************************************************/
import java.util.*;
public class Main
{
	public static void main(String[] args) {
		String str="2TZ1C1N1NJSNAOETOP7T8N4FZEULH3DJKZH7PDLP3C54JJKDOTUIPEGO8097";
		int a=str.length();
		int b=a-4;
		String s1=str.substring(b, a);
        String s2=str.substring(0, b);
        String ans="";
        int y=0;
        System.out.println(s2);
        int c=Integer.parseInt(s1);
        for(int i=0;i<4;i++){
            
            char ch=s1.charAt(i);
            int x=Integer.parseInt(String.valueOf(ch));;
            y=y+x;
            //System.out.println(y);
            ans+=s2.substring(y, y+8);
            y=y+8;      
            }
        System.out.println(ans);
    }
}
