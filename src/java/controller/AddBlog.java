/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class AddBlog extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("title"));
        displayInfo(request.getParameter("filename"));
        System.out.println(request.getParameter("desc"));
    }

    public static void displayInfo(String f) throws IOException {
        File file = new File(f);
        System.out.println("========================================");
        System.out.println("          name:" + file.getName());
        System.out.println("  is directory:" + file.isDirectory());
        System.out.println("        exists:" + file.exists());
        System.out.println("          path:" + file.getPath());
        System.out.println(" absolute file:" + file.getAbsoluteFile());
        System.out.println(" absolute path:" + file.getAbsolutePath());
        System.out.println("canonical file:" + file.getCanonicalFile());
        System.out.println("canonical path:" + file.getCanonicalPath());
    }
}
