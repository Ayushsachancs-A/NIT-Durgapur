# ☕ Constructors in Java – Complete Notes
_A Comprehensive Guide by ItTechGenie_

---

## 🧩 1. What is a Constructor?
A **constructor** is a **special method** in Java that is **used to initialize objects** when they are created.

- It has the **same name as the class**.  
- It **does not have a return type**, not even `void`.  
- It is **automatically called** when an object is created using the `new` keyword.

### 🧠 Syntax
```java
class ClassName {
    ClassName() {
        // initialization code
    }
}
```

**Example:**
```java
class Student {
    Student() {
        System.out.println("Student object is created!");
    }
}

public class Main {
    public static void main(String[] args) {
        Student s1 = new Student(); // constructor is called automatically
    }
}
```
**Output:**
```
Student object is created!
```

---

## 💡 2. Why Do We Use Constructors?
Constructors help to:
1. **Initialize instance variables** with default or user-defined values.
2. **Avoid code repetition**.
3. **Control object creation** and ensure consistent setup.

### ⚡ Example (Without Constructor)
```java
class Car {
    String brand;
    String color;
}
public class Main {
    public static void main(String[] args) {
        Car c1 = new Car();
        c1.brand = "Toyota";
        c1.color = "Red";
    }
}
```

### ✅ Example (With Constructor)
```java
class Car {
    String brand;
    String color;

    Car(String b, String c) {
        brand = b;
        color = c;
    }
}
public class Main {
    public static void main(String[] args) {
        Car c1 = new Car("Toyota", "Red"); // constructor sets values
    }
}
```

👉 Constructors make initialization **cleaner and safer**.

---

## 🧭 3. Types of Constructors in Java

| Type | Description | Example |
|------|--------------|----------|
| **Default Constructor** | Provided by Java if no constructor is defined. | `Person p = new Person();` |
| **No-Argument Constructor** | Defined by the user without parameters. | `Person() {}` |
| **Parameterized Constructor** | Accepts parameters to initialize object data. | `Person(String name, int age) {}` |

---

### 🧱 (1) Default Constructor
```java
class Employee {
    String name;
    int id;
}

public class Main {
    public static void main(String[] args) {
        Employee e = new Employee();
        System.out.println(e.name); // null
        System.out.println(e.id);   // 0
    }
}
```
✅ Java automatically adds: `Employee() {}`

---

### 🧱 (2) No-Argument Constructor
```java
class Employee {
    String company;
    Employee() {
        company = "ItTechGenie";
        System.out.println("Employee works at " + company);
    }
}
public class Main {
    public static void main(String[] args) {
        Employee e1 = new Employee();
    }
}
```
**Output:**
```
Employee works at ItTechGenie
```

---

### 🧱 (3) Parameterized Constructor
```java
class Employee {
    String name;
    int id;

    Employee(String n, int i) {
        name = n;
        id = i;
    }

    void display() {
        System.out.println("Employee: " + name + " | ID: " + id);
    }
}

public class Main {
    public static void main(String[] args) {
        Employee e1 = new Employee("Ravi", 101);
        e1.display();
    }
}
```
**Output:**
```
Employee: Ravi | ID: 101
```

---

## 🧩 4. Constructor Overloading
You can define **multiple constructors** with different parameter lists.

```java
class Book {
    String title;
    double price;

    Book() {
        title = "Unknown";
        price = 0.0;
    }

    Book(String t, double p) {
        title = t;
        price = p;
    }

    void display() {
        System.out.println("Book: " + title + ", Price: " + price);
    }
}

public class Main {
    public static void main(String[] args) {
        Book b1 = new Book();
        Book b2 = new Book("Java Fundamentals", 499.99);
        b1.display();
        b2.display();
    }
}
```
**Output:**
```
Book: Unknown, Price: 0.0
Book: Java Fundamentals, Price: 499.99
```

---

## ⚙️ 5. When to Use Which Constructor

| Situation | Constructor to Use |
|------------|--------------------|
| Default values required | No-Arg Constructor |
| Initialization at creation | Parameterized Constructor |
| Need flexibility | Constructor Overloading |
| No setup logic | Default Constructor |

---

## 🧠 6. Real-World Example – Bank Account
```java
class BankAccount {
    String accountHolder;
    double balance;

    BankAccount() {
        accountHolder = "Unknown";
        balance = 0.0;
    }

    BankAccount(String name, double initialDeposit) {
        accountHolder = name;
        balance = initialDeposit;
    }

    void display() {
        System.out.println(accountHolder + " has ₹" + balance + " in the account.");
    }
}

public class Main {
    public static void main(String[] args) {
        BankAccount a1 = new BankAccount();
        BankAccount a2 = new BankAccount("Ananya", 10000);

        a1.display();
        a2.display();
    }
}
```
**Output:**
```
Unknown has ₹0.0 in the account.
Ananya has ₹10000.0 in the account.
```

---

## 🧱 7. Key Points to Remember

| Rule | Explanation |
|------|--------------|
| Name must match class name | e.g., `class Car { Car() {} }` |
| No return type | Not even `void` |
| Called automatically | via `new` keyword |
| Cannot be `static`, `final`, or `abstract` | |
| Can be overloaded | Multiple constructors allowed |
| Not inherited | But can be called using `super()` |

---

## 🧩 8. Using `this()` and `super()` in Constructors
```java
class Person {
    Person() {
        System.out.println("Person created");
    }
}

class Employee extends Person {
    Employee() {
        super();
        System.out.println("Employee created");
    }
}

public class Main {
    public static void main(String[] args) {
        Employee e = new Employee();
    }
}
```
**Output:**
```
Person created
Employee created
```

---

## ✅ Summary

| Concept | Description |
|----------|-------------|
| Constructor | Special method for initialization |
| Default | Added automatically if none exists |
| No-Arg | Developer-defined, no parameters |
| Parameterized | Accepts parameters |
| Overloaded | Multiple constructors |
| `this()` | Calls another constructor |
| `super()` | Calls parent constructor |
| Called automatically | When using `new` keyword |

---

**Prepared by:**  
**ItTechGenie Java Specialist Trainer**  
© 2025 – All Rights Reserved  
