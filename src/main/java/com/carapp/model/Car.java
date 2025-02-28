package com.carapp.model;

import java.math.BigDecimal;
import java.sql.Timestamp;



public class Car {
    private int id;
    private String make;
    private String model;
    private int year;
    private String color;
    private BigDecimal price;
    private int mileage;
    private String registrationNumber;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Default constructor
    public Car() {
    }

    // Constructor with essential fields
    public Car(String make, String model, int year, String color, BigDecimal price, int mileage, String registrationNumber) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.color = color;
        this.price = price;
        this.mileage = mileage;
        this.registrationNumber = registrationNumber;
    }

    // Constructor with all fields
    public Car(int id, String make, String model, int year, String color, BigDecimal price, int mileage,
               String registrationNumber, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.make = make;
        this.model = model;
        this.year = year;
        this.color = color;
        this.price = price;
        this.mileage = mileage;
        this.registrationNumber = registrationNumber;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getMileage() {
        return mileage;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Car [id=" + id + ", make=" + make + ", model=" + model + ", year=" + year + ", color=" + color
                + ", price=" + price + ", mileage=" + mileage + ", registrationNumber=" + registrationNumber + "]";
    }
}