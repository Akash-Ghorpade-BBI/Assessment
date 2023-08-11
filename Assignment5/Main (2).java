/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
class Person{
    String name;
    int age;
    String gender;
    
    public Person(String name,int age,String gender){
        this.name= name;
        this.age=age;
        this.gender=gender;
    }
    
    public void introduce(){
        System.out.println("Hi I am"+ name+"I am"+age +"year old I am"+gender);
    }
}


class Student extends Person{
    int studentId;
    
    public Student(String name,int age,String gender,int studentId){
        super(name,age,gender);
        this.studentId=studentId;
    }
}


class Teacher extends Person{
    String subject;
    
    public Teacher(String name,int age,String gender,String subject){
        super(name,age,gender);
        this. subject =subject;
    }
}



public class Main
{
	public static void main(String[] args) {
		Student student =new Student("akash",18,"male",1234);
		Teacher teacher =new Teacher("smita",35,"female","math");
		
		student.introduce();
		System.out.println("My StudentId is "+student.studentId);
		
		teacher.introduce();
		System.out.println("My Subject is "+teacher.subject);
	}
}
