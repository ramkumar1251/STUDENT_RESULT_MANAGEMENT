package com.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DBManager {

    private static final String URL = "jdbc:sqlserver://ANUBHAVI\\SQLEXPRESS:1433;databaseName=StudentDB;trustServerCertificate=true";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa1234";

    private Connection connection;

    public DBManager() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            if (connection != null) {
                System.out.println("Connected to the database successfully!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public Connection getConnection() {
        return connection;
    }

    public boolean validateStudent(String rollNo) {
        String query = "SELECT COUNT(*) FROM students WHERE rollNo = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, rollNo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addStudent(Student student) {
        String query = "INSERT INTO students (rollNo, name, email, dob, maths, physics, chemistry, computerScience, total) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getRollNo());
            stmt.setString(2, student.getName());
            stmt.setString(3, student.getEmail());
            stmt.setDate(4, Date.valueOf(student.getDob())); // Convert LocalDate to SQL DATE
            stmt.setInt(5, student.getMaths());
            stmt.setInt(6, student.getPhysics());
            stmt.setInt(7, student.getChemistry());
            stmt.setInt(8, student.getComputerScience());
            stmt.setInt(9, student.getTotal());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStudent(Student student) {
        String query = "UPDATE students SET name = ?, email = ?, dob = ?, maths = ?, physics = ?, chemistry = ?, computerScience = ?, total = ? WHERE rollNo = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setDate(3, Date.valueOf(student.getDob())); // Convert LocalDate to SQL DATE
            stmt.setInt(4, student.getMaths());
            stmt.setInt(5, student.getPhysics());
            stmt.setInt(6, student.getChemistry());
            stmt.setInt(7, student.getComputerScience());
            stmt.setInt(8, student.getTotal());
            stmt.setString(9, student.getRollNo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Student getStudent(String rollNo) {
        String query = "SELECT * FROM students WHERE rollNo = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, rollNo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Student student = new Student();
                student.setRollNo(rs.getString("rollNo"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setDob(rs.getDate("dob").toLocalDate()); // Convert SQL DATE to LocalDate
                student.setMaths(rs.getInt("maths"));
                student.setPhysics(rs.getInt("physics"));
                student.setChemistry(rs.getInt("chemistry"));
                student.setComputerScience(rs.getInt("computerScience"));
                student.setTotal(rs.getInt("total"));
                return student;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void removeStudent(String rollNo) {
        String query = "DELETE FROM students WHERE rollNo = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, rollNo);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM students";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Student student = new Student();
                student.setRollNo(rs.getString("rollNo"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setDob(rs.getDate("dob").toLocalDate()); // Convert SQL DATE to LocalDate
                student.setMaths(rs.getInt("maths"));
                student.setPhysics(rs.getInt("physics"));
                student.setChemistry(rs.getInt("chemistry"));
                student.setComputerScience(rs.getInt("computerScience"));
                student.setTotal(rs.getInt("total"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

