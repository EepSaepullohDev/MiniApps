<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View Konsumen List</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>

</head>
<body>

<div class="container">

    <h1 class="p-3">Konsumen List</h1>

    <form:form method="get" action="/viewKonsumenList">
        <div class="d-flex justify-content-between" style="width:100%; margin-bottom: 20px;"> <!-- Updated width to 80% for the container -->
            <div class="d-flex justify-content-start" style="width: 30%;">
                <div class="input-group" style="width: 100%;">
                    <input type="text" class="form-control" placeholder="Search by Name" name="keyword">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">Search</button>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end" style="width: 70%;"> <!-- Updated width to 70% for the "Add New Anime" button -->
                <button type="button" class="btn btn-primary" onclick="window.location.href='/addKonsumen'">
                    Add Konsumen
                </button>
            </div>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>City</th>
                <th>Province</th>
                <th>Registration Date</th>
                <th>Status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="konsumen" items="${konsumenList}">
                <tr>
                    <td>${konsumen.nama}</td>
                    <td>${konsumen.alamat}</td>
                    <td>${konsumen.kota}</td>
                    <td>${konsumen.provinsi}</td>
                    <td>
                        <fmt:formatDate value="${konsumen.tglRegistrasi}" pattern="dd-MM-yyyy" />
                    </td>
                    <td>${konsumen.status}</td>
                    <td><button type="button" class="btn btn-success">
                        <a href="/editKonsumen/${konsumen.id}">Edit</a>
                    </button></td>
                    <td><button type="button" class="btn btn-danger">
                        <a href="/deleteKonsumen/${konsumen.id}">Delete</a>
                    </button></td>
                </tr>
            </c:forEach>
        </table>
    </form:form>
</div>

<script th:inline="javascript">
    window.onload = function() {

        var msg = "${message}";
        console.log(msg);
        if (msg == "Save Success") {
            Command: toastr["success"]("Konsumen added successfully!!")
        } else if (msg == "Delete Success") {
            Command: toastr["success"]("Konsumen deleted successfully!!")
        } else if (msg == "Delete Failure") {
            Command: toastr["error"]("Some error occurred, couldn't delete user")
        } else if (msg == "Edit Success") {
            Command: toastr["success"]("Konsumen updated successfully!!")
        }

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    }
</script>

</body>

</html>