# ☕ Inheritance in Java – Complete Notes
_A Comprehensive Guide by ItTechGenie_

---

## 🧩 1. What is Inheritance?

**Inheritance** is an **Object-Oriented Programming (OOP)** concept where one class **acquires the properties and behaviors** (fields and methods) of another class.

> It represents an **“IS-A” relationship** between parent (superclass) and child (subclass).

---

### 🧠 Definition
In Java, inheritance allows a class (**child/subclass**) to **reuse the fields and methods** of another class (**parent/superclass**).

### ✅ Syntax
```java
class Parent {
    // parent fields and methods
}

class Child extends Parent {
    // additional fields and methods
}
```

**Example:**
```java
class Vehicle {
    void start() {
        System.out.println("Vehicle is starting...");
    }
}

class Car extends Vehicle {
    void drive() {
        System.out.println("Car is driving...");
    }
}

public class Main {
    public static void main(String[] args) {
        Car c = new Car();
        c.start(); // Inherited from Vehicle
        c.drive(); // Defined in Car
    }
}
```
**Output:**
```
Vehicle is starting...
Car is driving...
```

✅ The `Car` class **inherits** the `start()` method from `Vehicle`.

---

## 💡 2. Why Use Inheritance?

| Reason | Description |
|--------|--------------|
| **Code Reusability** | Common functionality is written once in the parent class and reused in child classes. |
| **Extensibility** | Easy to add new features without modifying existing code. |
| **Maintainability** | Common changes can be made in one place (the base class). |
| **Polymorphism** | Enables method overriding for flexible behavior. |
| **Readability** | Logical grouping of related classes improves clarity. |

---

## 🧭 3. Types of Inheritance in Java

| Type | Description | Supported in Java |
|------|--------------|------------------|
| **Single Inheritance** | One class inherits another. | ✅ Yes |
| **Multilevel Inheritance** | A class inherits from another derived class. | ✅ Yes |
| **Hierarchical Inheritance** | Multiple classes inherit from the same parent. | ✅ Yes |
| **Multiple Inheritance** | A class inherits from more than one class. | ❌ No (Ambiguity problem) |
| **Hybrid Inheritance** | Combination of multiple inheritance types. | ⚠️ Only via interfaces |

---

### 🧱 (1) Single Inheritance
```java
class Employee {
    void work() {
        System.out.println("Employee works...");
    }
}

class Manager extends Employee {
    void manage() {
        System.out.println("Manager manages team...");
    }
}

public class Main {
    public static void main(String[] args) {
        Manager m = new Manager();
        m.work();
        m.manage();
    }
}
```
**Output:**
```
Employee works...
Manager manages team...
```

---

### 🧱 (2) Multilevel Inheritance
```java
class Bank {
    void displayBank() {
        System.out.println("Welcome to ItTechGenie Bank!");
    }
}

class Branch extends Bank {
    void branchInfo() {
        System.out.println("Branch: Mumbai");
    }
}

class Account extends Branch {
    void accountType() {
        System.out.println("Account Type: Savings");
    }
}

public class Main {
    public static void main(String[] args) {
        Account a = new Account();
        a.displayBank();
        a.branchInfo();
        a.accountType();
    }
}
```
**Output:**
```
Welcome to ItTechGenie Bank!
Branch: Mumbai
Account Type: Savings
```

---

### 🧱 (3) Hierarchical Inheritance
```java
class Payment {
    void pay() {
        System.out.println("Processing payment...");
    }
}

class CreditCard extends Payment {
    void creditInfo() {
        System.out.println("Payment via Credit Card");
    }
}

class UPI extends Payment {
    void upiInfo() {
        System.out.println("Payment via UPI");
    }
}

public class Main {
    public static void main(String[] args) {
        CreditCard c = new CreditCard();
        UPI u = new UPI();
        c.pay();
        c.creditInfo();
        u.pay();
        u.upiInfo();
    }
}
```
**Output:**
```
Processing payment...
Payment via Credit Card
Processing payment...
Payment via UPI
```

---

### ⚠️ (4) Multiple Inheritance (Not Supported in Classes)
Java **does not support multiple inheritance** directly because of **ambiguity**.

```java
class A {
    void show() { System.out.println("From A"); }
}

class B {
    void show() { System.out.println("From B"); }
}

// ❌ Error: multiple inheritance not allowed
class C extends A, B { }
```

---

### ✅ (5) Hybrid Inheritance via Interfaces
```java
interface Printable {
    void print();
}

interface Showable {
    void show();
}

class Report implements Printable, Showable {
    public void print() {
        System.out.println("Printing Report...");
    }
    public void show() {
        System.out.println("Showing Report...");
    }
}

public class Main {
    public static void main(String[] args) {
        Report r = new Report();
        r.print();
        r.show();
    }
}
```
**Output:**
```
Printing Report...
Showing Report...
```

✅ Multiple inheritance **works with interfaces**, since there’s no implementation ambiguity.

---

## 🏢 4. Real-World Example – Employee Management System
```java
class Person {
    protected String name;
    protected int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void displayDetails() {
        System.out.println("Name: " + name + " | Age: " + age);
    }
}

class Employee extends Person {
    protected String department;
    protected double salary;

    public Employee(String name, int age, String department, double salary) {
        super(name, age);
        this.department = department;
        this.salary = salary;
    }

    public void work() {
        System.out.println(name + " works in " + department + " department.");
    }
}

class Manager extends Employee {
    private int teamSize;

    public Manager(String name, int age, String department, double salary, int teamSize) {
        super(name, age, department, salary);
        this.teamSize = teamSize;
    }

    public void manageTeam() {
        System.out.println(name + " manages a team of " + teamSize + " employees.");
    }
}

public class Main {
    public static void main(String[] args) {
        Manager m1 = new Manager("Ananya", 35, "IT", 120000, 10);
        m1.displayDetails();
        m1.work();
        m1.manageTeam();
    }
}
```
**Output:**
```
Name: Ananya | Age: 35
Ananya works in IT department.
Ananya manages a team of 10 employees.
```

✅ Reusability achieved — `Person` class data is reused in `Employee` and `Manager`.

---

## 🔐 5. Access Modifiers and Inheritance

| Modifier | Same Class | Same Package | Subclass (Different Package) | Other Classes |
|-----------|-------------|---------------|------------------------------|----------------|
| **public** | ✅ | ✅ | ✅ | ✅ |
| **protected** | ✅ | ✅ | ✅ | ❌ |
| **default (no modifier)** | ✅ | ✅ | ❌ | ❌ |
| **private** | ✅ | ❌ | ❌ | ❌ |

### Example Demonstrating Access Modifiers
```java
package company;

public class Employee {
    public String name = "Ravi";
    protected int age = 30;
    double salary = 50000; // default
    private String password = "Emp@123";

    public void display() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Salary: " + salary);
        System.out.println("Password: " + password);
    }
}

package company.hr;

import company.Employee;

public class Manager extends Employee {
    public void showDetails() {
        System.out.println("Name: " + name);   // ✅ public
        System.out.println("Age: " + age);     // ✅ protected
        // System.out.println("Salary: " + salary); ❌ not accessible
        // System.out.println("Password: " + password); ❌ not accessible
    }
}
```
**Output:**
```
Name: Ravi
Age: 30
```

### Key Takeaways
| Modifier | Inheritance Behavior |
|-----------|----------------------|
| **private** | Not inherited. |
| **default** | Inherited within same package only. |
| **protected** | Inherited in subclass even in other packages. |
| **public** | Inherited everywhere. |

---

## 🧠 6. `super` Keyword
Used in subclass to call parent constructor or methods.

```java
class Employee {
    String company = "ItTechGenie";
}

class Manager extends Employee {
    String company = "GlobalTech";

    void display() {
        System.out.println("Local: " + company);
        System.out.println("Parent: " + super.company);
    }
}

public class Main {
    public static void main(String[] args) {
        new Manager().display();
    }
}
```
**Output:**
```
Local: GlobalTech
Parent: ItTechGenie
```

---

## ✅ 7. Summary

| Concept | Description |
|----------|-------------|
| **Inheritance** | Mechanism of acquiring parent class properties/methods. |
| **Extends Keyword** | Used for class inheritance. |
| **Implements Keyword** | Used for interface inheritance. |
| **super()** | Refers to parent constructor or field. |
| **Types Supported** | Single, Multilevel, Hierarchical. |
| **Multiple Inheritance** | Supported via interfaces. |
| **Access Modifiers** | Control visibility and inheritance scope. |

---

**Prepared by:**  
**ItTechGenie Java Specialist Trainer**  
© 2025 – All Rights Reserved  
