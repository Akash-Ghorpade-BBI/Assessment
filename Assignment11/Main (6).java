/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/

abstract class Vehicle {
    protected String make;
    protected String model;

    public Vehicle(String make, String model) {
        this.make = make;
        this.model = model;
    }

    public String get_make() {
        return make;
    }

    public String get_model() {
        return model;
    }

    public void display_info() {
        System.out.println("Make: " + make);
        System.out.println("Model: " + model);
    }
}

class Car extends Vehicle {
    private String fuel_type;

    public Car(String make, String model, String fuel_type) {
        super(make, model);
        this.fuel_type = fuel_type;
    }

    public String get_fuel_type() {
        return fuel_type;
    }

    @Override
    public void display_info() {
        super.display_info();
        System.out.println("Fuel Type: " + fuel_type);
    }
}


class Motorcycle extends Vehicle {
    private int engine_capacity;

    public Motorcycle(String make, String model, int engine_capacity) {
        super(make, model);
        this.engine_capacity = engine_capacity;
    }

    public int get_engine_capacity() {
        return engine_capacity;
    }

    @Override
    public void display_info() {
    super.display_info();
    System.out.println("Engine Capacity: " + engine_capacity + "cc");
    }
}

public class Main {
    
    public static void main(String[] args) {
    Car car = new Car("Toyota", "Camry", "Gasoline");
    Motorcycle motorcycle = new Motorcycle("Honda", "CBR600RR", 600);

    System.out.println("Car Information:");
    car.display_info();
    //System.out.println("Fuel Type: " + car.get_fuel_type());

    System.out.println("\nMotorcycle Information:");
    motorcycle.display_info();
    //System.out.println("Engine Capacity: " + motorcycle.get_engine_capacity() + "cc");
    }
}
