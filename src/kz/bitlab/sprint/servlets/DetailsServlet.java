package kz.bitlab.sprint.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.sprint.db.DBManager;
import kz.bitlab.sprint.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HomeServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = -1l;
        try {
            id = Long.parseLong(request.getParameter("task_id"));
        }
        catch (Exception e){
        }
        Tasks tasks = DBManager.getTask(id);
        request.setAttribute("zadacha", tasks);
        request.getRequestDispatcher("/details.jsp").forward(request, response);
    }
}
