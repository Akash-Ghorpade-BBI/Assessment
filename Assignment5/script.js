class Person{
    constructor(name,age,gender){
    this.name= name;
    this.age=age;
    this.gender=gender;
}

introduce(){
    console.log(`Hi I am ${this.name} I am ${this.age} years old I am ${this.gender}`);
}
}

class Student extends Person{
    
    constructor(name,age,gender,studentId){
        super(name,age,gender,studentId)
        this.studentId= studentId;
    }
}

class Teacher extends Person{
    constructor(name,age,gender,subject){
        super(name,age,gender,subject)
        this.subject= subject;
    }
}

const student =new Student("akash",18,"male",1234);
const teacher =new Teacher("smita",35,"female","math");
		
    student.introduce();
    console.log(`Student ID:${student.studentId}`);

    teacher.introduce();
    console.log(`subject is:${teacher.student}`);