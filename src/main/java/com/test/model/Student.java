package com.test.model;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class Student {
    private String rollNo;
    private String name;
    private String email;
    private LocalDate dob;
    private int maths;
    private int physics;
    private int chemistry;
    private int computerScience;
    private int total;

    // Getters and Setters
    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public int getMaths() {
        return maths;
    }

    public void setMaths(int maths) {
        this.maths = maths;
    }

    public int getPhysics() {
        return physics;
    }

    public void setPhysics(int physics) {
        this.physics = physics;
    }

    public int getChemistry() {
        return chemistry;
    }

    public void setChemistry(int chemistry) {
        this.chemistry = chemistry;
    }

    public int getComputerScience() {
        return computerScience;
    }

    public void setComputerScience(int computerScience) {
        this.computerScience = computerScience;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    // Convenience method to get subjects
    public Map<String, Integer> getSubjects() {
        Map<String, Integer> subjects = new HashMap<>();
        subjects.put("maths", maths);
        subjects.put("physics", physics);
        subjects.put("chemistry", chemistry);
        subjects.put("computerScience", computerScience);
        return subjects;
    }
}
