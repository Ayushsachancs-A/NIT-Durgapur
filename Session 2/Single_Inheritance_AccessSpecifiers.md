# 🧭 Java Inheritance with All Access Specifiers

## 🧠 Concept Recap — Java Access Specifiers in Inheritance

| **Specifier** | **Visibility within Same Class** | **Within Same Package** | **In Subclass (same package)** | **In Subclass (different package)** | **Outside Package (non-subclass)** |
|----------------|-----------------------------------|--------------------------|----------------------------------|-------------------------------------|
| `private`      | ✅ Yes                            | ❌ No                    | ❌ No                            | ❌ No                               |
| *(default)* (no modifier) | ✅ Yes | ✅ Yes | ✅ Yes | ❌ No |  
| `protected`    | ✅ Yes                            | ✅ Yes                   | ✅ Yes                           | ✅ Yes (through inheritance only)   |
| `public`       | ✅ Yes                            | ✅ Yes                   | ✅ Yes                           | ✅ Yes                             |

---

## ✅ Example: Access Specifiers in Inheritance

```java
package com.ittechgenie;

// Base class (Parent)
class Employee {
    private void privateWork() {
        System.out.println("Private: Confidential task (not inherited)");
    }

    void defaultWork() { // default access
        System.out.println("Default: Works within same package");
    }

    protected void protectedWork() {
        System.out.println("Protected: Works in same or subclass");
    }

    public void publicWork() {
        System.out.println("Public: Works everywhere");
    }

    void showAll() {
        System.out.println("\nInside Employee class:");
        privateWork();
        defaultWork();
        protectedWork();
        publicWork();
    }
}

// Derived class (Child)
class Manager extends Employee {
    void manage() {
        System.out.println("\nInside Manager class:");
        // privateWork();  ❌ Not accessible (private members are not inherited)
        defaultWork();     // ✅ Accessible (same package)
        protectedWork();   // ✅ Accessible
        publicWork();      // ✅ Accessible
    }
}

// Runner class (Main)
public class Main {
    public static void main(String[] args) {
        Manager m = new Manager();

        // Access through Manager object
        m.manage();

        // From subclass reference
        System.out.println("\nAccessing directly from main:");
        // m.privateWork(); ❌ Not accessible
        m.defaultWork();    // ✅ Accessible (same package)
        m.protectedWork();  // ✅ Accessible (same package)
        m.publicWork();     // ✅ Accessible (everywhere)
    }
}
```

---

## 🧩 Output

```
Inside Manager class:
Default: Works within same package
Protected: Works in same or subclass
Public: Works everywhere

Accessing directly from main:
Default: Works within same package
Protected: Works in same or subclass
Public: Works everywhere
```

---

## 🧾 Explanation of Behavior

| **Access Specifier** | **Inheritance Behavior** | **Example Behavior in Code** |
|-----------------------|---------------------------|-------------------------------|
| **private** | ❌ Not inherited — accessible only inside the same class. | `privateWork()` can be called only inside `Employee`, not in `Manager`. |
| **default (no modifier)** | ✅ Inherited *only within the same package*. | `defaultWork()` accessible in `Manager` and `Main` since both are in `com.ittechgenie`. |
| **protected** | ✅ Inherited both in same package and in subclass (even from other packages). | `protectedWork()` accessible in `Manager` and in `Main`. |
| **public** | ✅ Always inherited and accessible from anywhere. | `publicWork()` accessible everywhere. |

---

## 🌍 Example of Protected Across Packages

If the subclass is in a **different package**:

```java
package com.management;
import com.ittechgenie.Employee;

public class Manager extends Employee {
    void manage() {
        // defaultWork(); ❌ Not accessible (different package)
        protectedWork();   // ✅ Accessible (because subclass)
        publicWork();      // ✅ Accessible
    }
}
```

Here, `protected` still works because it’s inherited through subclassing, but `default` no longer works since it’s package-private.

---

## 🧩 Real-World Analogy

| **Access Specifier** | **Analogy in Workplace** |
|-----------------------|--------------------------|
| **private** | Confidential info only HR can see (not shared with employees). |
| **default** | Department-level info — visible to all team members in same office. |
| **protected** | Company-wide internal policies — shared to all branches (including inherited subsidiaries). |
| **public** | Public announcements — accessible by everyone (including outsiders). |

---

✅ **Summary:**
- `private` → Not inherited.  
- `default` → Inherited only within same package.  
- `protected` → Inherited everywhere through subclass.  
- `public` → Always inherited and accessible.

---
