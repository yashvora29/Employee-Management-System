# Employee Management System

## 📌 Overview

The **Employee Management System** is a web-based application developed using **Advanced Java** technologies including **Servlets, JSP, JDBC, and MySQL**. It provides a secure platform where administrators can manage employee records while employees can log in to view their profiles.

This project was developed as part of an **Advanced Java Semester Project** and demonstrates the implementation of the MVC architecture, database connectivity, session management, and web application deployment on Apache Tomcat.

---

# 🚀 Features

* 🔐 Role-Based Login Authentication

  * Admin Login
  * Employee Login

* 👨‍💼 Employee Management

  * Add Employee
  * View Employee
  * Update Employee
  * Delete Employee

* 📄 Pagination

  * Displays employee records with pagination

* 🔄 Sorting

  * Sort employees by:

    * Name
    * Department
    * Salary

* 📧 Email Notification

  * Email notification functionality implemented for employee creation and updates.

* 🛡️ Security

  * Session Management
  * Role-based Authorization
  * JDBC Prepared Statements to reduce SQL Injection risks

* 🎨 Responsive User Interface

  * HTML
  * CSS
  * JavaScript
  * Bootstrap

---

# 🛠️ Technology Stack

* Java 8+
* Servlets
* JSP
* JDBC
* MySQL
* Maven
* Apache Tomcat 9
* HTML5
* CSS3
* JavaScript
* Bootstrap

---

# 📂 Project Structure

```
EmployeeManagementSystem
│
├── src
│   ├── controller
│   ├── dao
│   ├── model
│   └── util
│
├── WebContent
│   ├── css
│   ├── js
│   ├── WEB-INF
│   └── *.jsp
│
├── database.sql
├── pom.xml
└── README.md
```

---

# 🗄️ Database Setup

1. Install MySQL.
2. Create a database named:

```
EmployeeManagementSystem
```

3. Execute the provided:

```
database.sql
```

file to create the required tables and sample data.

---

# ⚙️ Configuration

Update the database credentials inside:

```
src/util/DBConnection.java
```

Example:

```java
private static final String URL = "jdbc:mysql://localhost:3306/EmployeeManagementSystem";
private static final String USER = "your_username";
private static final String PASS = "your_password";
```

If email functionality is enabled, update the sender email credentials inside:

```
src/util/EmailUtil.java
```

---

# ▶️ Running the Project

1. Clone the repository.

2. Import the project into Eclipse or your preferred Java IDE.

3. Execute:

```
database.sql
```

4. Update the database credentials.

5. Build the project:

```
mvn clean package
```

6. Deploy the generated WAR file on **Apache Tomcat 9**.

7. Open the application:

```
http://localhost:8080/EmployeeManagementSystem/
```

> **Note:** `localhost` works only on the machine where the application is deployed. Other users must deploy the project locally or host it on a server.

---

# 🔑 Default Credentials

## Admin

```
Username: admin
Password: admin123
```

## Employee

```
Username: employee
Password: emp123
```

---

# 📚 Concepts Demonstrated

* Java Servlets
* JSP
* JDBC
* MVC Architecture
* CRUD Operations
* Session Management
* Pagination
* Sorting
* Form Validation
* Maven Project Structure
* Apache Tomcat Deployment

---

# 👨‍💻 Author

**Yash Vora**

Advanced Java Semester Project
