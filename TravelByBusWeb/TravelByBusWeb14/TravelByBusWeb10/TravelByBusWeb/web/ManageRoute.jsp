<%--
  Created by IntelliJ IDEA.
  User: Chamika Prabath
  Date: 9/15/2019
  Time: 8:18 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Travel By Bus</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">


    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">



    <%-- <script src="js/jquery.dataTables.js" type="text/javascript"></script>--%>
    <%-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>--%>
    <script src="js/google-map.js"></script>
    <script src="js/main.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.html">Travel<span>ByBus</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="SignIn.jsp" class="nav-link">Sign In</a></li>
                <%if (session.getAttribute("type")!=null){%>

                <%if(session.getAttribute("type").toString().equalsIgnoreCase("Admin")){%>
                <li class="nav-item"><a href="ManageBus.jsp" class="nav-link">Manage Buses</a></li>
                <li class="nav-item"><a href="ManageRoute.jsp" class="nav-link">Manage Routes</a></li>
                <li class="nav-item"><a href="ManageSchedule.jsp" class="nav-link">Schedules</a></li>
                <li class="nav-item"><a href="tempuser.jsp" class="nav-link">Tickets</a></li>
                <li class="nav-item"><a href="ManagerCardApproval.jsp" class="nav-link">Approval</a></li>
                <li class="nav-item"><a href="ViewCharts.jsp" class="nav-link">Analysis</a></li>

                <%}else if(session.getAttribute("type").toString().equalsIgnoreCase("Customer")){%>

                <li class="nav-item"><a href="ViewSchedule.jsp" class="nav-link">Bus Schedule</a></li>
                <li class="nav-item"><a href="PaymentMethod.jsp" class="nav-link">Payment Method</a></li>
                <li class="nav-item"><a href="RequestCard.jsp" class="nav-link">Request Card</a></li>
                <%}%>

                <%}else{%>


                <li class="nav-item"><a href="Register.jsp" class="nav-link">Register</a></li>

                <%}%>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>

    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
        <div class="col-md-9 ftco-animate pb-5">
            <div class="container">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="routeNo">Route No</label>
                        <input type="text" class="form-control" id="routeNo" placeholder="177">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="price">Price (Per Point)</label>
                        <input type="text" class="form-control" id="price">
                    </div>

                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="rStart">Route Start</label>
                        <input type="text" class="form-control" id="rStart" placeholder="Kaduwela">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="rEnd">Route End</label>
                        <input type="text" class="form-control" id="rEnd" placeholder="Kollupitiya">
                    </div>
                </div>

                <div class="form-group">
                    <label for="bStops">Bus Stops</label>
                    <input type="text" class="form-control" id="bStops">
                </div>
                <div class="col-md-3 form-group">
                    <input type="button" value="Add" id="add" class="btn btn-primary py-3 px-4" >
                    <input type="button" value="update" id="update" class="btn btn-secondary py-3 px-4" >
                </div>
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Route Management <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Route Management</h1>
            </div>
        </div>
    </div>
</section>


<table id="tableRoute" class="table table-bordered table-striped table-hover table-responsive-md ">
    <thead>
    <tr>
        <th>Route No</th>
        <th>Route Start</th>
        <th>Route End</th>
        <%--<th>Bus Stops</th>--%>
        <th>Price(Per point)</th>
        <th>Added By</th>
        <th>Edit Records</th>
        <th>Delete Records</th>
    </tr>
    </thead>
    <tbody>

    </tbody>

</table>






<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script src="js/jquery-3.3.1.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.buttons.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="js/select2.full.min.js"></script>
<script src="js/buttons.print.min.js"></script>
<script src="js/Chart.js"></script>

<script src="js/main.js"></script>

<%--  <!--Export table button CSS-->

  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css">--%>


</body>
</html>

<script>
    var table;
    var routeIdForUpdate="";
    $(document).ready(function () {

        table=$('#tableRoute').dataTable({
            language : {
                "zeroRecords": " "
            },
            "lengthMenu": [[ -1], ["All"]],


            ordering: false,  // Disabels COLUMN ordering
            scrollY: "600px",
            scrollCollapse: false,

        });
        loadTable();
        $("#update").hide();


    });


    function deleteRoute(data) {

        $.ajax({

            type: 'POST',
            url: '/DeleteRoute',
            data: {
                'routeId': data

            },

            success:function () {
                window.location.href="ManageRoute.jsp";
                $('#routeNo').val("");
                $('#price').val("");
                $('#rStart').val("");
                $('#rEnd').val("");
                $('#bStops').val("")

                routeIdForUpdate="";
                $("#update").hide();
                // table.draw();
            }

        })
        //table.ajax.reload();
    };

    function editRoute(data) {
        routeIdForUpdate=data;
        $.ajax({

            type: 'POST',
            url: '/UpdateRoute',
            cache: false,
            dataType: 'json',
            data: {
                'routeId': data,
                'query':'selectQ'

            },

            success: function (result, textStatus, jqXHR) {

                // table.draw();
                $('#routeNo').val(result[0].r_No);
                $('#price').val(result[0].price_per_point);
                $('#rStart').val(result[0].point_A);
                $('#rEnd').val(result[0].point_B);
                $('#bStops').val(result[0].bus_Stop)

                $("#update").show();

            }

        })
        //table.ajax.reload();
    };
    function loadTable(){

        $.ajax({
            url: '/ViewRoute',
            type: 'POST',
            cache: false,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data, textStatus, jqXHR) {
                console.log(data[0]);
                $("#tableRoute> tbody").html("");
                var busStop=data[0].bus_Stop;
                var splitStops = busStop.split(',')

                /*var selectStops="<select class='form-control' id='aa'>  splitStops.forEach(stop => {<option value="+stop+">"+stop+"</option></select>}";*/
                for (var i = 0; i < data.length; i++) {

                    var tab = '';
                    tab += "<tr class='text-dark'>";
                    tab += "<td>";
                    tab += data[i].r_No;
                    tab += "</td>"
                    tab += "<td>";
                    tab += data[i].point_A;
                    tab += "</td>";
                    tab += "<td>";
                    tab += data[i].point_B;
                    tab += "</td>";
                  /*  tab += "<td>";
                    tab += selectStops;
                    tab += "</td>";*/
                    tab += "<td>";
                    tab += data[i].price_per_point;
                    tab += "</td>";
                    tab += "<td>";
                    tab += data[i].add_uid;
                    tab += "</td>";
                    tab += "<td>";
                    tab +="<input type='button' class='btn btn-primary edit_btn' onclick=editRoute("+data[i].r_ID+") id="+data[i].r_No+" value='Edit Route'><i class='glyphicon glyphicon-pencil'></i></input>";
                    tab += "</td>";
                    tab += "<td>";
                    tab +="<input type='button' class='btn btn-primary delete_btn' onclick=deleteRoute("+data[i].r_ID+") id="+data[i].r_No+" value='Delete Route'><i class='glyphicon glyphicon-pencil'></i></input>";
                    tab += "</td>";
                    tab += "</tr>";
                    $('#tableRoute > tbody').append(tab);
                }

            }
        });
    }

    $("#add").click(function () {


        var routeNo = $('#routeNo').val();
        var price = $('#price').val();
        var rStart = $('#rStart').val();
        var rEnd = $('#rEnd').val();
        var bStops = $('#bStops').val();

        if(routeNo==""){
            alert("Please enter the route no to continue")
        }else if(price==""){
            alert("Please enter the bus price rate to continue")
        }else if(rStart==""){
            alert("Please enter the Start point to continue")
        }else if(rEnd==""){
            alert("Please enter the End point to continue")
        }else if(bStops==""){
            alert("Please enter the Bus Stops to continue")
        }else {

            $.ajax({

                type: 'POST',
                url: '/AddRoute',
                data: {
                    'routeNo': routeNo,
                    'price': price,
                    'rStart': rStart,
                    'rEnd': rEnd,
                    'bStops': bStops

                },

                success: function () {
                    window.location.href = "ManageRoute.jsp"

                }

            })
        }
    })
    $("#update").click(function () {

        var routeNo = $('#routeNo').val();
        var price = $('#price').val();
        var rStart = $('#rStart').val();
        var rEnd = $('#rEnd').val();
        var bStops = $('#bStops').val();


        if(routeNo==""){
            alert("Please enter the route no to continue")
        }else if(price==""){
            alert("Please enter the bus price rate to continue")
        }else if(rStart==""){
            alert("Please enter the Start point to continue")
        }else if(rEnd==""){
            alert("Please enter the End point to continue")
        }else if(bStops==""){
            alert("Please enter the Bus Stops to continue")
        }else {

            $.ajax({

                type: 'POST',
                url: '/UpdateRoute',
                data: {
                    'routeId': routeIdForUpdate,
                    'routeNo': routeNo,
                    'price': price,
                    'rStart': rStart,
                    'rEnd': rEnd,
                    'bStops': bStops,
                    'query': 'updateQ'
                },

                success: function () {
                    window.location.href = "ManageRoute.jsp"
                    routeIdForUpdate = "";
                    $("#update").hide();
                    $('#routeNo').attr('disabled', false);
                }

            })
        }
    })
</script>