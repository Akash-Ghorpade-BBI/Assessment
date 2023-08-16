/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
	import java.io.*;
public class Main
{
    
    
	public static void main(String args[]) throws IOException
    {
           Object Number[][]={{"0","1","1"},
                              {"1","0","0"},
                              {"0","1","1"}};
       
        
        int count=0;
        for(int i=0;i<=2;i++){
            if(Number[i][0]==Number[i][1] && Number[i][1]==Number[i][2] && Number[i][0]!=" " && Number[i][1]!=" " && Number[i][2]!=" "){
                count++;
                System.out.println("win");
                
            }
            else if(Number[i][0]==" " || Number[i][1]==" " || Number[i][2]==" "){
                count++;
                System.out.println("pending");
                
            }
                
            
            if(Number[0][i]==Number[1][i] && Number[0][i]==Number[2][i] && Number[0][i]!=" " && Number[1][i]!=" " && Number[2][i]!=" "){
                count++;
                System.out.println("win");
                
            }
            else if(Number[0][i]==" " && Number[1][i]==" " && Number[2][i]==" "){
                count++;
                System.out.println("pending");
                
            }
        }  
        
        if(Number[0][0]==Number[1][1] && Number[1][1]==Number[2][2] && Number[0][0]!=" " && Number[1][2]!=" " && Number[2][2]!=" "){
                count++;
                System.out.println("win");
                
            }
        else if(Number[0][0]==" " && Number[1][2]==" " && Number[2][2]==" "){
                count++;
                System.out.println("pending");
                
            }    
            
            
        if(Number[0][2]==Number[1][1] && Number[1][1]==Number[2][0] && Number[0][2]!=" " && Number[1][2]!=" " && Number[2][0]!=" "){
                count++;
                System.out.println("win");
               
        } 
         else if( Number[0][2]==" " && Number[1][2]==" " && Number[2][0]==" "){
                count++;
                System.out.println("pending");
                
            }    
        if(count==0){
            System.out.println("draw");
        }
        
        
        
    }
	
}