# 💻 Multiple Inheritance in Java

In Java, **multiple inheritance through classes** is **not supported** directly (to avoid ambiguity known as the “Diamond Problem”).  
However, Java **supports multiple inheritance through interfaces** — a class can implement multiple interfaces and inherit their abstract methods.

---

## 🧠 Concept Recap
- **Single inheritance**: One class inherits from another.  
- **Multiple inheritance**: A class inherits from multiple sources.  
- **Why not via classes?** To avoid ambiguity when two parent classes have the same method.  
- **How possible in Java?** By implementing multiple interfaces.

---

## 💻 Example: Multiple Inheritance Using Interfaces (Real-World Banking Example)

```java
// Interface 1
interface PaymentGateway {
    void processPayment(double amount);
}

// Interface 2
interface NotificationService {
    void sendNotification(String message);
}

// Class implementing multiple interfaces
class OnlineBanking implements PaymentGateway, NotificationService {
    
    private String accountHolder;

    public OnlineBanking(String accountHolder) {
        this.accountHolder = accountHolder;
    }

    @Override
    public void processPayment(double amount) {
        System.out.println("Processing payment of ₹" + amount + " for " + accountHolder);
    }

    @Override
    public void sendNotification(String message) {
        System.out.println("Sending SMS notification: " + message);
    }

    public void displayBalance() {
        System.out.println("Balance check successful for " + accountHolder);
    }
}

// Main class
public class MultipleInheritanceDemo {
    public static void main(String[] args) {
        OnlineBanking ob = new OnlineBanking("Rajesh Kumar");
        ob.processPayment(12000);
        ob.sendNotification("Your transaction of ₹12000 was successful.");
        ob.displayBalance();
    }
}
```

---

## 🧾 Output
```
Processing payment of ₹12000 for Rajesh Kumar
Sending SMS notification: Your transaction of ₹12000 was successful.
Balance check successful for Rajesh Kumar
```

---

## ⚙️ Explanation
- `OnlineBanking` inherits behavior from **two interfaces**:  
  - `PaymentGateway` → handles payment operations.  
  - `NotificationService` → handles alert notifications.  
- This allows combining features from multiple sources, just like **mixing modules** in large enterprise projects.

---

## 💡 Real-World Analogy
Think of a **mobile banking app**:
- It uses a **PaymentGateway** to handle money transfers.
- It also uses a **NotificationService** to send transaction updates.

By implementing both, the app behaves as a single system combining multiple services — this is multiple inheritance through interfaces.

---

✅ **Key Takeaway**
> Java allows multiple inheritance through interfaces, ensuring modular, reusable, and conflict-free design for complex enterprise applications.
