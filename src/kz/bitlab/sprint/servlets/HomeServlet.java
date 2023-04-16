package kz.bitlab.sprint.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.sprint.db.DBManager;
import kz.bitlab.sprint.db.Tasks;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        ArrayList<Tasks> tasks = DBManager.getAllTasks();
        request.setAttribute("zadachi", tasks);
        request.getRequestDispatcher("/tasks.jsp").forward(request, response);
    }
}
