package com.test.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.test.model.DBManager;
import com.test.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DownloadReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("loggedInStudent") != null) {
            Student loggedInStudent = (Student) session.getAttribute("loggedInStudent");
            rollNo = rollNo != null && !rollNo.isEmpty() ? rollNo : loggedInStudent.getRollNo();
        }

        DBManager dbManager = new DBManager();
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Student Report");

        // Create header row
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Roll No");
        header.createCell(1).setCellValue("Name");
        header.createCell(2).setCellValue("Email");
        header.createCell(3).setCellValue("Date of Birth");
        header.createCell(4).setCellValue("Maths");
        header.createCell(5).setCellValue("Physics");
        header.createCell(6).setCellValue("Chemistry");
        header.createCell(7).setCellValue("Computer Science");
        header.createCell(8).setCellValue("Total");

        if (rollNo == null || rollNo.isEmpty()) {
            // Download all students' data
            List<Student> students = dbManager.getAllStudents();
            int rowNum = 1;
            for (Student student : students) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(student.getRollNo());
                row.createCell(1).setCellValue(student.getName());
                row.createCell(2).setCellValue(student.getEmail());
                row.createCell(3).setCellValue(student.getDob().toString());
                row.createCell(4).setCellValue(student.getMaths());
                row.createCell(5).setCellValue(student.getPhysics());
                row.createCell(6).setCellValue(student.getChemistry());
                row.createCell(7).setCellValue(student.getComputerScience());
                row.createCell(8).setCellValue(student.getTotal());
            }
            response.setHeader("Content-Disposition", "attachment; filename=AllStudentsReport.xlsx");
        } else {
            // Download a specific student's data
            Student student = dbManager.getStudent(rollNo);
            if (student != null) {
                Row row = sheet.createRow(1);
                row.createCell(0).setCellValue(student.getRollNo());
                row.createCell(1).setCellValue(student.getName());
                row.createCell(2).setCellValue(student.getEmail());
                row.createCell(3).setCellValue(student.getDob().toString());
                row.createCell(4).setCellValue(student.getMaths());
                row.createCell(5).setCellValue(student.getPhysics());
                row.createCell(6).setCellValue(student.getChemistry());
                row.createCell(7).setCellValue(student.getComputerScience());
                row.createCell(8).setCellValue(student.getTotal());

                response.setHeader("Content-Disposition", "attachment; filename=StudentReport_" + rollNo + ".xlsx");
            } else {
                response.sendRedirect("studentLogin.jsp?error=Student not found");
                workbook.close();
                dbManager.close();
                return;
            }
        }

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        try (OutputStream out = response.getOutputStream()) {
            workbook.write(out);
        } finally {
            workbook.close();
            dbManager.close();
        }
    }
}
