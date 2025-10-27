
# ⚙️ Exception Handling in Java — Complete Notes

---

## 🧠 What is an Exception?

An **Exception** in Java is an **unexpected or abnormal event** that occurs during program execution and disrupts the normal flow of instructions.

For example:
- Division by zero  
- File not found  
- Invalid user input  
- Database connection failure  

When an exception occurs, **Java creates an exception object** and passes it to the **JVM exception-handling mechanism**.

---

## 🧩 Difference Between Exception and Error

| Feature | **Exception** | **Error** |
|----------|----------------|-----------|
| Meaning | Conditions that programs should catch and handle | Problems that occur **outside the control** of the program |
| Recovery | Can be **handled** by the program | **Cannot be handled**; only fixed by changing environment or code |
| Examples | `IOException`, `NullPointerException`, `SQLException` | `OutOfMemoryError`, `StackOverflowError` |
| Package | `java.lang.Exception` | `java.lang.Error` |
| Cause | User or program mistakes | System or JVM issues |

---

## ⚙️ How to Handle Exceptions

Java provides **five key keywords** for exception handling:

| Keyword | Description |
|----------|--------------|
| `try` | Block of code that may cause an exception |
| `catch` | Block that handles a specific exception |
| `finally` | Executes always, whether exception occurs or not |
| `throw` | Used to explicitly throw an exception |
| `throws` | Declares exceptions that a method can throw |

---

### 💻 Syntax

```java
try {
    // risky code
} catch (ExceptionType e) {
    // handle exception
} finally {
    // always executed
}
```

---

## 🧩 Types of Exceptions in Java

```
Throwable
│
├── Error (cannot be recovered)
│
└── Exception
     ├── Checked Exceptions (Compile-Time)
     │    ├── IOException
     │    ├── SQLException
     │    └── FileNotFoundException
     │
     └── Unchecked Exceptions (Runtime)
          ├── ArithmeticException
          ├── NullPointerException
          ├── ArrayIndexOutOfBoundsException
          └── NumberFormatException
```

---

## 📜 Built-in Exceptions in Java

### 🔹 **Checked Exceptions** (Compile-time)
| Exception | Description |
|------------|--------------|
| `IOException` | When input/output fails |
| `SQLException` | When database access fails |
| `FileNotFoundException` | When file not found |
| `ClassNotFoundException` | When class is not available |
| `InterruptedException` | When thread is interrupted |

### 🔹 **Unchecked Exceptions** (Runtime)
| Exception | Description |
|------------|--------------|
| `ArithmeticException` | Division by zero |
| `NullPointerException` | Accessing null object |
| `ArrayIndexOutOfBoundsException` | Invalid array index |
| `NumberFormatException` | Invalid string-to-number conversion |
| `IllegalArgumentException` | Invalid argument passed |
| `InputMismatchException` | Scanner receives wrong type of input |

### 🔹 **Errors**
| Error | Description |
|--------|-------------|
| `OutOfMemoryError` | JVM ran out of memory |
| `StackOverflowError` | Infinite recursion |
| `VirtualMachineError` | JVM internal failure |

---

## 🏦 Real-World Example: Banking Transaction

```java
public class BankingExample {
    public static void main(String[] args) {
        double balance = 5000.0;
        double withdrawAmount = 7000.0;

        try {
            if (withdrawAmount > balance) {
                throw new ArithmeticException("Insufficient Balance!");
            }
            balance -= withdrawAmount;
            System.out.println("Withdrawal Successful. Remaining Balance: ₹" + balance);
        } catch (ArithmeticException e) {
            System.out.println("Transaction Failed: " + e.getMessage());
        } finally {
            System.out.println("Transaction completed.");
        }
    }
}
```

### 🧾 Output
```
Transaction Failed: Insufficient Balance!
Transaction completed.
```

---

## 💼 Real-World Use Case 2 — Reading a File Safely

```java
import java.io.*;

public class FileExample {
    public static void main(String[] args) {
        try {
            BufferedReader br = new BufferedReader(new FileReader("data.txt"));
            System.out.println(br.readLine());
            br.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found. Please check the path.");
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        } finally {
            System.out.println("File read operation completed.");
        }
    }
}
```

### 🧾 Output
```
File not found. Please check the path.
File read operation completed.
```

---

## 💻 Real-World Use Case 3 — Multiple Catch Blocks Example

```java
public class MultipleCatchExample {
    public static void main(String[] args) {
        try {
            int[] marks = {90, 80, 70};
            System.out.println(marks[3]); // ArrayIndexOutOfBounds
            int result = 50 / 0; // ArithmeticException
        }
        catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Array index is invalid: " + e.getMessage());
        }
        catch (ArithmeticException e) {
            System.out.println("Cannot divide by zero.");
        }
        catch (Exception e) {
            System.out.println("General Exception: " + e.getMessage());
        }
        finally {
            System.out.println("Program executed successfully.");
        }
    }
}
```

---

## 💣 `throw` and `throws` Example

```java
class PaymentService {
    void processPayment(double amount) throws Exception {
        if (amount <= 0) {
            throw new Exception("Invalid Payment Amount");
        }
        System.out.println("Payment processed successfully for ₹" + amount);
    }
}

public class ThrowThrowsDemo {
    public static void main(String[] args) {
        PaymentService service = new PaymentService();
        try {
            service.processPayment(-500);
        } catch (Exception e) {
            System.out.println("Payment Error: " + e.getMessage());
        }
    }
}
```

---

## ⚙️ Custom (User-Defined) Exceptions

### 💡 What is a Custom Exception?

A **custom exception** (or **user-defined exception**) is one that you create by **extending** either:
- `Exception` (checked exception) or
- `RuntimeException` (unchecked exception)

This helps handle **domain-specific business rules**.

---

### 🏦 Real-World Example 1 — InsufficientBalanceException

```java
class InsufficientBalanceException extends Exception {
    public InsufficientBalanceException(String message) {
        super(message);
    }
}

class BankAccount {
    private double balance = 5000;

    public void withdraw(double amount) throws InsufficientBalanceException {
        if (amount > balance) {
            throw new InsufficientBalanceException("Not enough funds. Available balance: ₹" + balance);
        }
        balance -= amount;
        System.out.println("Withdrawal successful! Remaining balance: ₹" + balance);
    }
}

public class CustomExceptionDemo {
    public static void main(String[] args) {
        BankAccount account = new BankAccount();
        try {
            account.withdraw(8000);
        } catch (InsufficientBalanceException e) {
            System.out.println("Transaction Failed: " + e.getMessage());
        }
    }
}
```

### 🧾 Output
```
Transaction Failed: Not enough funds. Available balance: ₹5000.0
```

---

### 🧠 Real-World Example 2 — InvalidAgeException

```java
class InvalidAgeException extends RuntimeException {
    public InvalidAgeException(String message) {
        super(message);
    }
}

class VoterRegistration {
    void registerVoter(int age) {
        if (age < 18) {
            throw new InvalidAgeException("Age must be 18 or above to register.");
        }
        System.out.println("Registration successful.");
    }
}

public class AgeValidationDemo {
    public static void main(String[] args) {
        VoterRegistration voter = new VoterRegistration();
        try {
            voter.registerVoter(16);
        } catch (InvalidAgeException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

### 🧩 Real-World Example 3 — InvalidEmailException

```java
class InvalidEmailException extends Exception {
    public InvalidEmailException(String message) {
        super(message);
    }
}

class RegistrationSystem {
    void validateEmail(String email) throws InvalidEmailException {
        if (!email.contains("@") || !email.endsWith(".com")) {
            throw new InvalidEmailException("Invalid email format!");
        }
        System.out.println("Email verified successfully: " + email);
    }
}

public class EmailValidationDemo {
    public static void main(String[] args) {
        RegistrationSystem reg = new RegistrationSystem();
        try {
            reg.validateEmail("usergmail.com");
        } catch (InvalidEmailException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

## ✅ Summary

| Concept | Description |
|----------|--------------|
| **Exception** | Abnormal event handled by program |
| **Error** | Serious problem, not recoverable |
| **Checked Exception** | Checked at compile-time |
| **Unchecked Exception** | Occurs at runtime |
| **Custom Exception** | User-defined for business logic |
| **Keywords** | try, catch, finally, throw, throws |

---

## 🧠 Key Takeaways

- Use **specific catch blocks** to handle predictable errors.  
- Use **finally** for closing resources like files or DB connections.  
- Create **custom exceptions** for domain-specific error messages.  
- Avoid catching `Exception` directly unless necessary.  
- Logging exceptions helps in debugging production systems.

---

**Author:** ItTechGenie  
**Topic:** Java — Exception Handling (Complete Notes)  
**Filename:** `ExceptionHandling_FullNotes.md`
