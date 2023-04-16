<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.sprint.db.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

    <div class="container mt-5 pb-5">
        <%
            Tasks tasks = (Tasks) request.getAttribute("zadacha");
            if(tasks != null){
        %>
        <div class="row">
            <div class="col-6 mx-auto">

                    <div class="row">
                        <div class="col-12">
                            <label>NAME : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" class="form-control" readonly value="<%=tasks.getName()%>">
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-12">
                            <label>DESCRIPTION : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <textarea  class="form-control" readonly rows="10"><%=tasks.getDescription()%></textarea>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-12">
                            <label>DEADLINE : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input type="text" class="form-control" readonly value="<%=tasks.getDeadlineDate()%>">
                        </div>
                    </div>

                <div class="row mt-3">
                    <div class="col-12">
                        <label>DONE : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" readonly value="<%=tasks.getDone()%>">
                    </div>
                </div>

                    <div class="row mt-3">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editTask">
                                Edit Task
                            </button>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteTask">
                                Delete Task
                            </button>

                        </div>
                    </div>

                <!-- Modal -->
                <div class="modal fade" id="deleteTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="/delete-task" method="post">
                                <input type="hidden" name="id" value="<%=tasks.getId()%>">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" >Confirm Delete</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 class="text-center">Are you sure?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                <button class="btn btn-danger">YES</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

                        <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/save-task" method="post">
                                            <input type="hidden" name="task_id" value="<%=tasks.getId()%>">
                                            <div class="row">
                                                <div class="col-12">
                                                    <label>NAME : </label>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-12">
                                                    <input type="text" class="form-control" name="task_name" value="<%=tasks.getName()%>">
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-12">
                                                    <label>DESCRIPTION : </label>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-12">
                                                    <textarea name="task_description" class="form-control" rows="10"><%=tasks.getDescription()%></textarea>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-12">
                                                    <label>DEADLINE : </label>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-12">
                                                    <input type="date" class="form-control" name="task_deadlineDate" value="<%=tasks.getDeadlineDate()%>">
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-12">
                                                    <label>DONE : </label>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-12">
                                                    <select class="form-select" name="task_done">
                                                        <option <%=(tasks.getDone().equals("No")?"selected":"")%>>No</option>
                                                        <option <%=(tasks.getDone().equals("Yes")?"selected":"")%>>Yes</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row mt-3">
                                                <div class="col-12">
                                                    <button class="btn btn-primary">SAVE</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
            <%
                }else{
            %>
                <h3 class="text-center">
                    TASK NOT FOUND
                </h3>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
