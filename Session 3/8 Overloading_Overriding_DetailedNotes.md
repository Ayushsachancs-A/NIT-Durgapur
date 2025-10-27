# ⚙️ Java Function Overloading and Overriding — Detailed Notes

## 🧠 Overview
In Java, both **method overloading** and **method overriding** enable polymorphism — the ability for a method to behave differently based on context.

---

## 🧩 Method Overloading — Compile-Time Polymorphism

### 🔹 Definition
Method Overloading occurs when **multiple methods in the same class** share the **same name** but have **different parameters** (by number, type, or order).

It’s a **compile-time** decision — the compiler selects the appropriate method based on the provided arguments.

### 🔹 Advantages
- Enhances **code readability**.
- Allows **flexible usage** of similar functionality.
- Simplifies maintenance in large systems.

---

## 🏢 Real-World Example — E-Commerce Payment System

```java
package com.shop;

class PaymentService {

    // 1. Pay using credit card
    public void makePayment(String cardNumber, double amount) {
        System.out.println("Payment of ₹" + amount + " done using Credit Card: " + cardNumber);
    }

    // 2. Pay using UPI ID
    public void makePayment(String upiId) {
        System.out.println("Payment done using UPI ID: " + upiId);
    }

    // 3. Pay using Wallet + Offers
    public void makePayment(String walletId, double amount, String offerCode) {
        System.out.println("Payment of ₹" + amount + " done using Wallet: " + walletId +
                           " with offer code: " + offerCode);
    }
}

public class OverloadingDemo {
    public static void main(String[] args) {
        PaymentService pay = new PaymentService();

        pay.makePayment("1234-5678-9012-3456", 2500.00);         // Credit Card
        pay.makePayment("gopi@ybl");                             // UPI
        pay.makePayment("PaytmWallet001", 1800.00, "OFFER2025"); // Wallet + Offer
    }
}
```

### 🧩 Output
```
Payment of ₹2500.0 done using Credit Card: 1234-5678-9012-3456
Payment done using UPI ID: gopi@ybl
Payment of ₹1800.0 done using Wallet: PaytmWallet001 with offer code: OFFER2025
```

### 🧠 Explanation
Here, all `makePayment()` methods share the same name but have different parameter lists.  
The **compiler** determines which version to call at **compile time**.

---

## ⚙️ Rules of Overloading
| Rule | Description |
|------|--------------|
| Parameter count/type/order must differ | ✅ Allowed |
| Return type alone differs | ❌ Not allowed |
| Can change access modifier | ✅ Allowed |
| Can overload static methods | ✅ Allowed |

---

## 🎭 Method Overriding — Runtime Polymorphism

### 🔹 Definition
**Method Overriding** occurs when a **subclass redefines** a method of its **parent class** with the same signature (name, parameters, and return type).  
The **JVM** determines which method executes — hence **runtime polymorphism**.

### 🔹 Advantages
- Provides **customized behavior** in child classes.
- Enables **dynamic binding** in frameworks like Spring, Hibernate, etc.
- Supports **real-world inheritance hierarchy**.

---

## 🧰 Real-World Example — Employee Salary Calculation

```java
package com.company;

class Employee {
    public double calculateSalary() {
        return 30000.00; // Base salary
    }
}

class Manager extends Employee {
    @Override
    public double calculateSalary() {
        return super.calculateSalary() + 20000.00; // Adds managerial allowance
    }
}

class Developer extends Employee {
    @Override
    public double calculateSalary() {
        return super.calculateSalary() + 15000.00; // Adds project bonus
    }
}

public class OverridingDemo {
    public static void main(String[] args) {
        Employee emp1 = new Manager();
        Employee emp2 = new Developer();

        System.out.println("Manager Salary: ₹" + emp1.calculateSalary());
        System.out.println("Developer Salary: ₹" + emp2.calculateSalary());
    }
}
```

### 🧩 Output
```
Manager Salary: ₹50000.0
Developer Salary: ₹45000.0
```

### 🧠 Explanation
The **child class method** overrides the parent method.  
The method called depends on the **actual object type**, not the reference — demonstrating **runtime polymorphism**.

---

## ⚙️ Rules of Overriding

| Rule | Description |
|------|--------------|
| Same method name and parameters | ✅ Must be same |
| Same return type or covariant type | ✅ Allowed |
| Access level | Cannot be reduced |
| Static / final / private methods | ❌ Cannot be overridden |
| Constructor | ❌ Cannot be overridden |

---

## 💡 Real-World Analogy

| Concept | Analogy |
|----------|----------|
| **Overloading** | A payment gateway handling multiple payment types — same method name, different input. |
| **Overriding** | Different roles (Manager, Developer) customizing their salary calculation method. |

---

## 🧠 Tricky Example — Mixing Overloading and Overriding

```java
package com.tricky;

class Report {
    public void generate(String type) {
        System.out.println("Generating " + type + " report in PDF format");
    }

    public void generate(String type, boolean email) {
        System.out.println("Generating " + type + " report and emailing: " + email);
    }
}

class FinancialReport extends Report {
    @Override
    public void generate(String type) {
        System.out.println("Generating " + type + " report in Excel format");
    }

    // Overloaded version
    public void generate(int year) {
        System.out.println("Generating financial report for year: " + year);
    }
}

public class TrickDemo {
    public static void main(String[] args) {
        Report r1 = new FinancialReport();
        r1.generate("Sales");          // Overridden version (runtime)
        r1.generate("Audit", true);    // Parent's overloaded version
        // r1.generate(2025); ❌ Compile error

        FinancialReport fr = new FinancialReport();
        fr.generate(2025);             // Works fine
    }
}
```

### 🧩 Output
```
Generating Sales report in Excel format
Generating Audit report and emailing: true
Generating financial report for year: 2025
```

### 🧠 How It Works
1. `r1.generate("Sales")` → Overridden → `FinancialReport`’s version executes.
2. `r1.generate("Audit", true)` → Not overridden → Parent method executes.
3. `r1.generate(2025)` → ❌ Compile error (not known to parent type).
4. `fr.generate(2025)` → ✅ Works (type knows overloaded version).

---

## 🧾 Summary Table

| Feature | Overloading | Overriding |
|----------|--------------|-------------|
| **Definition** | Same name, different parameters | Same name & parameters (different classes) |
| **Polymorphism Type** | Compile-time | Runtime |
| **Binding Time** | Compile-time | Runtime |
| **Return Type** | Can differ | Must be same/covariant |
| **Inheritance Needed** | ❌ No | ✅ Yes |
| **Static Methods** | Can overload | Cannot override |
| **Access Level** | Can change | Cannot reduce visibility |

---

✅ **Conclusion:**
- Overloading improves **readability and flexibility**.  
- Overriding provides **runtime behavior customization**.  
- Both together demonstrate Java’s **powerful polymorphism** capabilities.

---
