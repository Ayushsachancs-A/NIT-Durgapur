
# 🧠 Abstract Class in Java – Explained with Real-World Example

## 🔍 What is an Abstract Class?

An **abstract class** in Java is a **partially implemented class** that acts as a **base or blueprint** for other classes.

It can:
- Contain **abstract methods** (methods without a body).
- Contain **non-abstract methods** (fully implemented).
- Have **fields, constructors, and static methods** like a normal class.
- **Cannot be instantiated directly** — only **subclasses** can create objects.

---

## 🧩 Syntax

```java
abstract class ClassName {
    abstract void method1(); // Abstract method (no body)
    void method2() {         // Concrete method
        System.out.println("This is a concrete method.");
    }
}
```

---

## ⚙️ Why Use an Abstract Class?

| Reason | Description |
|--------|--------------|
| 🧱 Common Base | To define a **common structure** or **behavior** for related classes. |
| ⚙️ Partial Implementation | When we want to **share some code** but leave certain details to be defined by subclasses. |
| 🔒 Template Design Pattern | To enforce a **specific workflow**, while allowing subclasses to customize parts. |
| 🚫 Prevent Direct Object Creation | You don’t want the base class to be instantiated (it only acts as a model). |

---

## 🏦 Real-World Example – Bank Account System

### Scenario
Every bank account (Savings, Current, Loan) has some **common operations**,  
but the **interest calculation** or **minimum balance rules** differ.

So we can define a **base abstract class** `BankAccount` and extend it in child classes.

---

### 💻 Code Example

```java
package com.one;

// Abstract class
abstract class BankAccount {
    String accountHolder;
    double balance;

    // Constructor
    BankAccount(String accountHolder, double balance) {
        this.accountHolder = accountHolder;
        this.balance = balance;
    }

    // Abstract method - must be implemented by subclasses
    abstract void calculateInterest();

    // Concrete method - shared by all accounts
    public void deposit(double amount) {
        balance += amount;
        System.out.println(amount + " deposited. New balance: ₹" + balance);
    }

    public void withdraw(double amount) {
        if (balance >= amount) {
            balance -= amount;
            System.out.println(amount + " withdrawn. Remaining balance: ₹" + balance);
        } else {
            System.out.println("Insufficient balance!");
        }
    }
}

// Subclass 1
class SavingsAccount extends BankAccount {
    SavingsAccount(String accountHolder, double balance) {
        super(accountHolder, balance);
    }

    @Override
    void calculateInterest() {
        double interest = balance * 0.04; // 4% interest
        balance += interest;
        System.out.println("Interest added ₹" + interest + " to Savings Account of " + accountHolder);
    }
}

// Subclass 2
class CurrentAccount extends BankAccount {
    CurrentAccount(String accountHolder, double balance) {
        super(accountHolder, balance);
    }

    @Override
    void calculateInterest() {
        System.out.println("Current Account has no interest for " + accountHolder);
    }
}

// Main class
public class AbstractClassDemo {
    public static void main(String[] args) {
        BankAccount savings = new SavingsAccount("Rajesh Kumar", 10000);
        BankAccount current = new CurrentAccount("Amit Sharma", 20000);

        savings.deposit(2000);
        savings.calculateInterest();

        current.withdraw(5000);
        current.calculateInterest();
    }
}
```

---

### 🧾 Output

```
2000.0 deposited. New balance: ₹12000.0
Interest added ₹480.0 to Savings Account of Rajesh Kumar
5000.0 withdrawn. Remaining balance: ₹15000.0
Current Account has no interest for Amit Sharma
```

---

## ⚖️ Abstract Class vs Interface

| Feature | Abstract Class | Interface |
|----------|----------------|------------|
| Methods | Can have both abstract and concrete methods | Can have abstract, default, and static methods |
| Variables | Can have instance variables | Variables are `public static final` by default |
| Inheritance | A class can extend **only one** abstract class | A class can implement **multiple interfaces** |
| Use Case | When classes are **closely related** | When you want **common behavior across unrelated classes** |

---

## 🧠 Key Takeaways

- Abstract class acts as a **template** — defines what *must* be done but not *how*.
- You **cannot create objects** of abstract classes.
- It improves **code organization, reusability, and maintainability**.
- Common use cases:  
  🔹 Payment gateways  
  🔹 Bank account systems  
  🔹 Vehicle types (Car, Bike, Truck)  
  🔹 Employee hierarchy (FullTime, Contract)

---

**Author:** ItTechGenie  
**Topic:** Java – Abstract Class with Real World Example  
**Filename:** `AbstractClass_Notes.md`
