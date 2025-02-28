package com.carapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.carapp.model.Car;
import com.carapp.util.DBUtil;

public class CarDAO {

    // Create a new car
    public boolean insertCar(Car car) throws SQLException {
        String sql = "INSERT INTO cars (make, model, year, color, price, mileage, registration_number) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, car.getMake());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setString(4, car.getColor());
            statement.setBigDecimal(5, car.getPrice());
            statement.setInt(6, car.getMileage());
            statement.setString(7, car.getRegistrationNumber());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        car.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        }

        return false;
    }

    // Retrieve all cars
    public List<Car> getAllCars() throws SQLException {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM cars ORDER BY id ";

        try (Connection connection = DBUtil.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setMake(resultSet.getString("make"));
                car.setModel(resultSet.getString("model"));
                car.setYear(resultSet.getInt("year"));
                car.setColor(resultSet.getString("color"));
                car.setPrice(resultSet.getBigDecimal("price"));
                car.setMileage(resultSet.getInt("mileage"));
                car.setRegistrationNumber(resultSet.getString("registration_number"));
                car.setCreatedAt(resultSet.getTimestamp("created_at"));
                car.setUpdatedAt(resultSet.getTimestamp("updated_at"));

                cars.add(car);
            }
        }

        return cars;
    }

    // Retrieve a car by ID
    public Car getCarById(int id) throws SQLException {
        String sql = "SELECT * FROM cars WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Car car = new Car();
                    car.setId(resultSet.getInt("id"));
                    car.setMake(resultSet.getString("make"));
                    car.setModel(resultSet.getString("model"));
                    car.setYear(resultSet.getInt("year"));
                    car.setColor(resultSet.getString("color"));
                    car.setPrice(resultSet.getBigDecimal("price"));
                    car.setMileage(resultSet.getInt("mileage"));
                    car.setRegistrationNumber(resultSet.getString("registration_number"));
                    car.setCreatedAt(resultSet.getTimestamp("created_at"));
                    car.setUpdatedAt(resultSet.getTimestamp("updated_at"));

                    return car;
                }
            }
        }

        return null;
    }

    // Update an existing car
    public boolean updateCar(Car car) throws SQLException {
        String sql = "UPDATE cars SET make = ?, model = ?, year = ?, color = ?, price = ?, mileage = ?, registration_number = ? WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, car.getMake());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setString(4, car.getColor());
            statement.setBigDecimal(5, car.getPrice());
            statement.setInt(6, car.getMileage());
            statement.setString(7, car.getRegistrationNumber());
            statement.setInt(8, car.getId());

            int affectedRows = statement.executeUpdate();
            return affectedRows > 0;
        }
    }

    // Delete a car
    public boolean deleteCar(int id) throws SQLException {
        String sql = "DELETE FROM cars WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            int affectedRows = statement.executeUpdate();
            return affectedRows > 0;
        }
    }

    // Search for cars
    public List<Car> searchCars(String keyword) throws SQLException {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM cars WHERE make LIKE ? OR model LIKE ? OR registration_number LIKE ? ORDER BY id DESC";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            String searchTerm = "%" + keyword + "%";
            statement.setString(1, searchTerm);
            statement.setString(2, searchTerm);
            statement.setString(3, searchTerm);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Car car = new Car();
                    car.setId(resultSet.getInt("id"));
                    car.setMake(resultSet.getString("make"));
                    car.setModel(resultSet.getString("model"));
                    car.setYear(resultSet.getInt("year"));
                    car.setColor(resultSet.getString("color"));
                    car.setPrice(resultSet.getBigDecimal("price"));
                    car.setMileage(resultSet.getInt("mileage"));
                    car.setRegistrationNumber(resultSet.getString("registration_number"));
                    car.setCreatedAt(resultSet.getTimestamp("created_at"));
                    car.setUpdatedAt(resultSet.getTimestamp("updated_at"));

                    cars.add(car);
                }
            }
        }

        return cars;
    }
}