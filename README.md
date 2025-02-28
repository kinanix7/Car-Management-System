# Car Management System

## Project Description

The Car Management System is a web-based application designed to manage a fleet of vehicles efficiently. It allows users to perform CRUD (Create, Read, Update, Delete) operations on car records, ensuring streamlined management of vehicle information.

## Features

- **Add New Cars**: Input details such as make, model, year, color, and registration number.
- **View Cars**: Display a list of all vehicles with sorting and filtering options.
- **Update Car Information**: Modify existing car details as needed.
- **Delete Cars**: Remove cars from the system when they are no longer in service.
- **Search Functionality**: Quickly locate vehicles based on various attributes.

## Screenshot

![Car Management System UI](/dashboard.png)

## Technologies Used

- **Backend**: Java with Spring Boot framework
- **Frontend**: HTML5, CSS3, JavaScript (with frameworks like React or Angular)
- **Database**: MySQL or PostgreSQL
- **API Documentation**: Swagger UI

## Prerequisites

Before setting up the project, ensure you have the following installed:

- Java Development Kit (JDK) 8 or higher
- Maven or Gradle build tools
- MySQL or PostgreSQL database server
- Git for version control

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kinanix7/Car-Management-System.git
   cd Car-Management-System
   ```

2. **Configure the Database**:
   - Create a database named `car_management_system`.
   - Update the `application.properties` (or `application.yml`) file in `src/main/resources` with your database credentials:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/car_management_system
     spring.datasource.username=your_username
     spring.datasource.password=your_password
     spring.jpa.hibernate.ddl-auto=update
     ```

3. **Build and Run the Application**:
   - Use Maven to build the project:
     ```bash
     mvn clean install
     ```
   - Start the Spring Boot application:
     ```bash
     mvn spring-boot:run
     ```
   - The application should now be running at `http://localhost:8080`.

## API Documentation

Once the application is running, you can access the API documentation via Swagger UI at:
```
http://localhost:8080/swagger-ui.html
```

## Contribution

Contributions are welcome! If you'd like to contribute, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

