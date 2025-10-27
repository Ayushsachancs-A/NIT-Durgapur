
# 📘 File Handling in Java — Complete Notes

---

## 🧠 What is File Handling?

**File Handling** in Java refers to the process of **creating, reading, writing, updating, and deleting files** using Java programs.

It allows Java applications to **store data permanently** in a file on disk, so data is **not lost** when the program ends.

Java provides the `java.io` and `java.nio` packages to perform file operations.

---

## 🎯 Why Do We Use File Handling?

| Reason | Explanation |
|---------|--------------|
| 🧾 Data Persistence | Store data permanently (e.g., user info, logs, reports). |
| 🔁 Data Sharing | Share data between applications through text or binary files. |
| 💾 Backup | Save records or logs for later retrieval. |
| 🔍 Configuration | Read settings from config files instead of hardcoding. |
| 🧩 Integration | Communicate with other systems that use files as input/output. |

---

## 🧩 Packages Used

| Package | Purpose |
|----------|----------|
| `java.io` | Basic input/output using streams. |
| `java.nio.file` | Advanced I/O (non-blocking, efficient, modern approach). |

---

## 📂 Types of File Handling in Java

| Type | Description | Example Classes |
|------|--------------|-----------------|
| **Text File Handling** | For `.txt`, `.csv`, `.log`, etc. — stores readable characters. | `FileReader`, `FileWriter`, `BufferedReader`, `BufferedWriter` |
| **Binary File Handling** | For images, videos, or serialized objects. | `FileInputStream`, `FileOutputStream`, `ObjectInputStream`, `ObjectOutputStream` |

---

## 🧮 File Class Overview

Java provides the `File` class (`java.io.File`) to handle file operations like creation, deletion, and checking file info.

### Example: Basic File Operations

```java
import java.io.File;
import java.io.IOException;

public class FileBasicDemo {
    public static void main(String[] args) {
        File file = new File("C:\\JavaFiles\\student.txt");

        try {
            if (file.createNewFile()) {
                System.out.println("File created: " + file.getName());
            } else {
                System.out.println("File already exists.");
            }

            System.out.println("Absolute Path: " + file.getAbsolutePath());
            System.out.println("Writable: " + file.canWrite());
            System.out.println("Readable: " + file.canRead());
            System.out.println("File Size: " + file.length() + " bytes");

        } catch (IOException e) {
            System.out.println("An error occurred: " + e.getMessage());
        }
    }
}
```

---

## ✍️ Writing to a File

```java
import java.io.FileWriter;
import java.io.IOException;

public class FileWriteDemo {
    public static void main(String[] args) {
        try {
            FileWriter writer = new FileWriter("student.txt");
            writer.write("Student Name: Rajesh Kumar\n");
            writer.write("Department: Computer Science\n");
            writer.write("Marks: 89");
            writer.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred while writing: " + e.getMessage());
        }
    }
}
```

---

## 📖 Reading from a File

```java
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class FileReadDemo {
    public static void main(String[] args) {
        try (BufferedReader reader = new BufferedReader(new FileReader("student.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.out.println("An error occurred while reading: " + e.getMessage());
        }
    }
}
```

---

## 🔁 Appending to a File

```java
import java.io.FileWriter;
import java.io.IOException;

public class FileAppendDemo {
    public static void main(String[] args) {
        try (FileWriter writer = new FileWriter("student.txt", true)) {
            writer.write("\nGrade: A");
            System.out.println("Data appended successfully.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

## 🚮 Deleting a File

```java
import java.io.File;

public class FileDeleteDemo {
    public static void main(String[] args) {
        File file = new File("student.txt");
        if (file.delete()) {
            System.out.println("Deleted: " + file.getName());
        } else {
            System.out.println("Failed to delete the file.");
        }
    }
}
```

---

## 🧱 Real-World Scenario – Employee Record Management

```java
import java.io.*;
import java.util.Scanner;

public class EmployeeRecordSystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        File file = new File("employees.txt");

        try (FileWriter fw = new FileWriter(file, true)) {
            System.out.print("Enter Employee ID: ");
            String id = sc.nextLine();

            System.out.print("Enter Employee Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Salary: ");
            String salary = sc.nextLine();

            fw.write("ID: " + id + ", Name: " + name + ", Salary: " + salary + "\n");
            System.out.println("✅ Record saved successfully.");

        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

## 🧩 Advanced: Reading/Writing Objects (Serialization)

```java
import java.io.*;

class Student implements Serializable {
    String name;
    int marks;
    Student(String name, int marks) {
        this.name = name;
        this.marks = marks;
    }
}

public class ObjectSerializationDemo {
    public static void main(String[] args) {
        Student s1 = new Student("Rajesh Kumar", 90);

        try (ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("studentObj.ser"))) {
            out.writeObject(s1);
            System.out.println("✅ Object serialized successfully.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }

        try (ObjectInputStream in = new ObjectInputStream(new FileInputStream("studentObj.ser"))) {
            Student s2 = (Student) in.readObject();
            System.out.println("🎓 Student Name: " + s2.name + ", Marks: " + s2.marks);
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

## 📊 Comparison: Text vs Binary File Handling

| Feature | Text File | Binary File |
|----------|------------|-------------|
| Data Type | Human-readable | Machine-readable |
| Classes | `FileReader`, `FileWriter` | `FileInputStream`, `FileOutputStream` |
| Speed | Slower | Faster |
| Use Case | Logs, Reports, Configs | Images, Videos, Serialized Data |

---

## 🧠 Key Points to Remember

1. Always **close streams** using `close()` or use **try-with-resources**.
2. Use `BufferedReader`/`BufferedWriter` for efficiency.
3. Handle exceptions with `try-catch-finally`.
4. Use `File.separator` for OS-independent paths.
5. Prefer `java.nio.file` (`Files`, `Paths`) for modern projects.

---

## ✅ Real-World Applications

| Use Case | Example |
|-----------|----------|
| Banking System | Store customer logs & transactions |
| College System | Save student grades & attendance |
| E-commerce | Save purchase invoices |
| Web Apps | Store logs and cached files |
| Cloud Storage | Read/write configuration or audit logs |

---

**Author:** ItTechGenie  
**Topic:** Java — File Handling (Complete Notes)  
**Filename:** `FileHandling_Notes.md`
