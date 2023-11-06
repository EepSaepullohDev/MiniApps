<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Add Konsumen</title>

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

</head>
<body>

<div class="container">

    <h1 class="p-3"> Add Konsumen </h1>

    <%--@elvariable id="konsumen" type=""--%>
    <form:form action="/saveKonsumen" method="post" modelAttribute="konsumen">

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="nama">Name</label>
                <div class="col-md-6">
                    <form:input type="text" path="nama" id="nama"
                                class="form-control input-sm" required="required" placeholder="Enter your name here"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="alamat">Address</label>
                <div class="col-md-6">
                    <form:textarea type="text" path="alamat" id="alamat"
                                class="form-control input-sm" required="required" placeholder="Enter your address here"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="kota">City</label>
                <div class="col-md-6">
                    <form:input type="text" path="kota" id="kota"
                                class="form-control input-sm" required="required" placeholder="Enter your city here"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="provinsi">Province</label>
                <div class="col-md-6">
                    <form:input type="text" path="provinsi" id="provinsi"
                                class="form-control input-sm" required="required" placeholder="Enter your province here"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="tglRegistrasi">Registration Date</label>
                <div class="col-md-6">
                    <form:input type="date" path="tglRegistrasi" id="tglRegistrasi"
                                class="form-control input-sm" required="required" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="status">Status</label>
                <div class="col-md-6">
                    <form:input type="text" path="status" id="status"
                                class="form-control input-sm" required="required" placeholder="Active or Inactive"/>
                </div>
            </div>
        </div>

        <div class="row p-2">
            <div class="col-md-2">
                <button type="submit" value="Register" class="btn btn-success">Save</button>
            </div>
        </div>

    </form:form>

</div>

<script th:inline="javascript">
    window.onload = function() {

        var msg = "${message}";
        console.log(msg);
        if (msg == "Save Failure") {
            Command: toastr["error"]("Something went wrong with the save.")
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