# Student Management System

A simple student management system built using Java, JSP, MySQL, HTML, and CSS. This application allows teachers to add, view, update, and delete student marks through an admin page. The application is deployed on Apache Tomcat.

## Features

- **CRUD Operations**: Create, Read, Update, and Delete student records.
- **Authentication**: Session management to ensure only authenticated users can access the admin page.
- **Responsive Design**: Basic CSS styling for a clean interface.

## Technologies Used

- **Backend**: Java, JSP
- **Frontend**: HTML, CSS
- **Database**: MySQL
- **Server**: Apache Tomcat

## Installation and Setup

### Prerequisites

- JDK (Java Development Kit)
- Apache Tomcat
- MySQL
- Web Browser

### Steps to Install and Run

1. **Download and Install Apache Tomcat**:
    - Visit the [Apache Tomcat download page](https://tomcat.apache.org/download-90.cgi).
    - Download the Windows Service Installer for Tomcat 9.
    - Run the installer and follow the instructions. Set up the admin username and password during installation.

2. **Start Apache Tomcat**:
    - Open a command prompt.
    - Navigate to the `bin` directory of your Tomcat installation:
      ```sh
      cd "C:\Program Files\Apache Software Foundation\Tomcat 9.0\bin"
      ```
    - Start the Tomcat server:
      ```sh
      Tomcat9.exe
      ```

3. **Access Tomcat Manager**:
    - Open your web browser and go to `http://localhost:8080`.
    - Click on the **Manager App** link and sign in with the admin credentials set during installation.

4. **Deploy the Application**:
    - In the Tomcat Web Application Manager, deploy your application by uploading the WAR file or deploying the directory.
