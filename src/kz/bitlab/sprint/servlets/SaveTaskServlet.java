package kz.bitlab.sprint.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.sprint.db.DBManager;
import kz.bitlab.sprint.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/save-task")
public class SaveTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("task_id"));
        String name = request.getParameter("task_name");
        String description = request.getParameter("task_description");
        String deadlineDate = request.getParameter("task_deadlineDate");
        String done = request.getParameter("task_done");

        Tasks tasks = DBManager.getTask(id);
        if(tasks!=null){
            tasks.setName(name);
            tasks.setDescription(description);
            tasks.setDeadlineDate(deadlineDate);
            tasks.setDone(done);

            DBManager.updateTask(tasks);
            response.sendRedirect("/details?task_id="+id);
        }else{
            response.sendRedirect("/");
        }
    }
}
