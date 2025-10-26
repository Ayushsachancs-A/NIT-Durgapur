# ☕ Java Control Flow — Loops, Conditionals, and Functions

This tutorial explains Java control flow step-by-step with **real-world examples** and **progressive complexity** — from basics to advanced.

---

# 1️⃣ Conditionals (if / else if / else / switch)

## 1.1 If / Else — Basics
**Use when:** simple true/false branching.

```java
int qty = 7;
double price = 499.0;
double total = qty * price;

if (total >= 3000) {
    System.out.println("Eligible for free shipping");
} else {
    System.out.println("Shipping charges apply");
}
```
**Real world:** An e-commerce checkout decides **free shipping** threshold.  
**Why:** Clear, readable for single condition.

---

## 1.2 Else-If Ladder — Multiple Rules
**Use when:** 2–4 mutually exclusive ranges.

```java
double orderValue = 8800;
double discount;

if (orderValue >= 10000) {
    discount = 0.15;
} else if (orderValue >= 5000) {
    discount = 0.10;
} else if (orderValue >= 2000) {
    discount = 0.05;
} else {
    discount = 0.0;
}
System.out.println("Discount: " + (discount * 100) + "%");
```
**Real world:** Tiered discounts (common in Indian festival sales).  
**Why:** Keeps range logic explicit.

---

## 1.3 Switch — Clean Option Selection
**Use when:** many exact cases (enums/strings/ints).

```java
String paymentMode = "UPI";
switch (paymentMode) {
    case "CARD" -> System.out.println("Processing via card gateway");
    case "UPI"  -> System.out.println("Processing via UPI handle");
    case "COD"  -> System.out.println("Cash to be collected on delivery");
    default     -> System.out.println("Unsupported payment mode");
}
```
**Real world:** Choosing **payment processor** based on mode.  
**Why:** Cleaner than long chains of if-else for discrete choices.

---

## 1.4 Guard Clauses (Early Returns)
**Use when:** validate early; avoid deep nesting.

```java
public static double computeGstInclusive(double baseAmount) {
    if (baseAmount <= 0) return 0.0;        // guard
    double gst = baseAmount * 0.18;
    return baseAmount + gst;
}
```
**Real world:** In billing, invalid/zero input returns early.  
**Why:** Improves readability, reduces nesting.

---

# 2️⃣ Loops (for, while, do-while, enhanced for, labels)

## 2.1 For Loop — Indexed Iteration
**Use when:** you need index or bounds.

```java
int[] marks = {78, 85, 92, 67};
int sum = 0;
for (int i = 0; i < marks.length; i++) {
    sum += marks[i];
}
System.out.println("Avg: " + (sum / (double) marks.length));
```
**Real world:** Computing **average score** from an array.

---

## 2.2 Enhanced For (For-Each)
**Use when:** you just need the element, not the index.

```java
List<String> cities = List.of("Mumbai", "Chennai", "Delhi");
for (String c : cities) {
    System.out.println("Ship to: " + c);
}
```
**Real world:** Iterate delivery cities for routing.  
**Why:** Safer & cleaner than index loops.

---

## 2.3 While Loop — Unknown Iterations (Read Until Done)
**Use when:** loop count not known in advance.

```java
int page = 1;
boolean hasMore = true;
while (hasMore) {
    hasMore = fetchAndProcessPage(page++); // returns false when last page
}
```
**Real world:** Pagination over a REST API until no more results.

---

## 2.4 Do-While — Run At Least Once
**Use when:** must execute body at least once.

```java
Scanner sc = new Scanner(System.in);
int pin;
do {
    System.out.print("Enter 4-digit PIN: ");
    pin = sc.nextInt();
} while (pin < 1000 || pin > 9999);
System.out.println("PIN accepted");
```
**Real world:** Input validation loops at kiosks/ATMs.

---

## 2.5 Break / Continue / Labels (Advanced Control)
**Use when:** escape loops early; skip iterations.

```java
search:
for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[r].length; c++) {
        if (grid[r][c] == target) {
            System.out.println("Found at " + r + "," + c);
            break search; // break outer loop
        }
    }
}
```
**Real world:** Matrix search (e.g., seat allocation).  
**Why:** Labels help break nested loops cleanly.

---

# 3️⃣ Functions (Methods)

## 3.1 Pure Function — Deterministic & Testable
```java
public static int percent(int part, int whole) {
    if (whole == 0) return 0;
    return (int) Math.round((part * 100.0) / whole);
}
```
**Real world:** Show progress percentage in file uploads.  
**Why:** No side effects → easy to unit test.

---

## 3.2 Method Overloading — Same Name, Different Params
```java
public static double applyDiscount(double amount) { return amount * 0.95; }
public static double applyDiscount(double amount, double rate) { return amount * (1 - rate); }
```
**Real world:** Flat vs configurable discount APIs.

---

## 3.3 Static vs Instance Methods
```java
class Tax {
    static double gst(double base) { return base * 0.18; }
}
class Invoice {
    private final double base;
    Invoice(double base) { this.base = base; }
    double total() { return base + Tax.gst(base); }
}
```
**Real world:** Utility (static) + domain (instance) separation.

---

## 3.4 Methods Returning Optional (Avoid null)
```java
public static Optional<String> findPanMask(String pan) {
    if (pan == null || pan.length() != 10) return Optional.empty();
    return Optional.of(pan.substring(0, 5) + "*****");
}
```
**Real world:** Masking PAN for privacy.  
**Why:** `Optional` communicates “may be absent”.

---

## 3.5 Try-With-Resources (Resource-Safe Functions)
```java
public static long countLines(Path file) throws IOException {
    try (BufferedReader br = Files.newBufferedReader(file)) {
        long count = 0;
        while (br.readLine() != null) count++;
        return count;
    }
}
```
**Real world:** File processing in back-office jobs.  
**Why:** Auto-closes resources → no leaks.

---

# 4️⃣ Putting It Together — Real Use Cases

## 4.1 Order Discount + Shipping + Invoice Total
```java
class OrderItem {
    String sku; int qty; double unitPrice;
    OrderItem(String sku, int qty, double unitPrice) {
        this.sku = sku; this.qty = qty; this.unitPrice = unitPrice;
    }
}

class PricingService {
    static double subtotal(List<OrderItem> items) {
        double total = 0.0;
        for (OrderItem it : items) total += it.qty * it.unitPrice;
        return total;
    }

    static double discountRate(double subtotal) {
        if (subtotal >= 10000) return 0.15;
        else if (subtotal >= 5000) return 0.10;
        else if (subtotal >= 2000) return 0.05;
        else return 0.0;
    }

    static double shippingCharge(String mode, double subtotal) {
        if (subtotal >= 3000) return 0.0;
        return switch (mode) {
            case "EXPRESS" -> 199.0;
            case "STANDARD" -> 79.0;
            default -> 149.0;
        };
    }

    static double totalPayable(List<OrderItem> items, String mode) {
        double sub = subtotal(items);
        double discounted = sub * (1 - discountRate(sub));
        double gst = discounted * 0.18;
        return discounted + gst + shippingCharge(mode, sub);
    }
}
```
**Why:** Combines **loops**, **conditionals**, and **functions** into one cohesive flow.

---

## 4.2 Retry with Exponential Backoff
```java
public static <T> T retry(int maxAttempts, Supplier<T> call, long baseDelayMs) {
    int attempts = 0;
    while (true) {
        try {
            return call.get();
        } catch (Exception ex) {
            attempts++;
            if (attempts >= maxAttempts) throw ex;
            long delay = (long) (baseDelayMs * Math.pow(2, attempts - 1));
            try { Thread.sleep(delay); } catch (InterruptedException ignored) {}
        }
    }
}
```
**Real world:** Payment gateway or API call retry logic.  
**Why:** Handles transient network errors gracefully.

---

## 4.3 Fraud Rule Engine (Readable Conditionals)
```java
record Order(double value, String country, LocalTime time, boolean cod) {}

static boolean isSuspicious(Order o) {
    if (o.value() > 100000) return true;
    if (o.cod() && o.value() > 25000) return true;
    if (!o.country().equals("IN")) return true;
    return o.time().isAfter(LocalTime.of(23, 0));
}
```
**Real world:** Fraud detection checks in payment systems.

---

## 4.4 CSV Aggregation with Streams (Loop Alternative)
```java
Map<String, Double> salesByCity = Files.lines(Path.of("sales.csv"))
    .map(line -> line.split(","))
    .filter(arr -> arr.length == 2)
    .collect(Collectors.groupingBy(
        arr -> arr[0].trim(),
        Collectors.summingDouble(arr -> Double.parseDouble(arr[1].trim()))
    ));

salesByCity.forEach((city, amt) -> System.out.println(city + " -> " + amt));
```
**Real world:** Summarizing sales per city from CSV.

---

# 5️⃣ Advanced Tips
- Prefer **enums** in switches for type safety.  
- Return `Optional` instead of `null`.  
- Use **guard clauses** to reduce nesting.  
- Choose correct loop type (`while` for unknown count, `for` for indexes).  
- Use **streams** for declarative aggregation.  
- Prioritize readability and maintainability.  

---

# 🧩 Mini-Exercises

### 1️⃣ Print Even Order IDs
```java
for (int id = 1; id <= 20; id++) {
    if (id % 2 != 0) continue;
    System.out.print(id + " ");
}
```

### 2️⃣ EMI Category Function
```java
static String emiBucket(double amt) {
    if (amt <= 0) return "INVALID";
    if (amt < 5000) return "NO_EMI";
    if (amt <= 20000) return "3_MONTHS";
    if (amt <= 60000) return "6_MONTHS";
    return "12_MONTHS";
}
```

### 3️⃣ Find First City Starting with “Che”
```java
List<String> cities = List.of("Mumbai","Chennai","Delhi","Chengalpattu");
String found = null;
for (String c : cities) {
    if (c.startsWith("Che")) { found = c; break; }
}
System.out.println(found); // Chennai
```
