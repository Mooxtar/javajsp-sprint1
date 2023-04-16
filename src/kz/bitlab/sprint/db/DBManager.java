package kz.bitlab.sprint.db;

import java.util.ArrayList;

public class DBManager {
    private static final ArrayList<Tasks> tasks = new ArrayList<>();
    private static Long id = 4l;

    static{
        tasks.add(
                new Tasks(
                        1l,
                        "Create Web application on Java EE",
                        "As homework we are given to create web application on JAVA EE",
                        "2023-04-08",
                        "No"
                )
        );

        tasks.add(
                new Tasks(
                        2l,
                        "Zapisat'sya na gym",
                        "On this friday I must apply to gym with 1fit application",
                        "2023-04-07",
                        "Yes"
                )
        );

        tasks.add(
                new Tasks(
                        3l,
                        "To do homeworks",
                        "We are given a plenty of tasks from our university teacher",
                        "2023-04-10",
                        "Yes"
                )
        );

        tasks.add(
                new Tasks(
                        4l,
                        "Buy groceries",
                        "There is no any tomatos at least in our house",
                        "2023-04-08",
                        "No"
                )
        );
    }

    public static void addTask(Tasks task){
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static Tasks getTask(Long id){
        return tasks
                .stream()
                .filter(tasks1 -> tasks1.getId()==id)
                .findFirst()
                .orElse(null);
    }

    public static ArrayList<Tasks> getAllTasks(){
        return tasks;
    }

    public static void updateTask(Tasks t){
        for (int i = 0; i < tasks.size(); i++) {
            if(tasks.get(i).getId()==t.getId()){
                tasks.set(i, t);
                break;
            }
        }
    }

    public static void deleteTask(Long id){
        for(int i = 0; i < tasks.size(); i++){
            if(tasks.get(i).getId() == id){
                tasks.remove(i);
                break;
            }
        }
    }
}
