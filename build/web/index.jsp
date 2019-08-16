<%--
    Document   : index
    Created on : Jul 5, 2019, 9:37:58 AM
    Author     : starixc
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head><style id="stndz-style"></style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>COHORT ANALYSIS SYSTEM</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link href="assets/bootstrap/css/bootstrap-glyphicons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/bootstrap/maps/glyphicons-fontawesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/footable.bootstrap.css">
    <link rel="stylesheet" href="css/select2.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-formhelpers.min.css">
    <link rel="stylesheet" href="assets/calender/lib/jquery-ui.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link href="assets/offcanvas.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="assets/DT-Tables/js/jquery-3.3.1.min.js" ></script>

</head>

<body class="bg-light">
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
        <a class="navbar-brand mr-auto mr-lg-0" href="#">ADHERENCE - MATERNAL/ART/STF/NEW&DEFAULTERS COHORT ANALYSIS SYSTEM </a>
        <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Dashboard <span class="sr-only">(current)</span></a>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item">

                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="#">My Profile</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" title="Add Widget" id="adduserbutton" data-toggle="modal" href="#userdetails"><i class="glyphicon glyphicon-user"></i><span id="usernamelabel"> Add Username</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" title="Help" data-toggle="modal" href="#help">
                        <i class="glyphicon glyphicon-question-sign"></i>
                        Help
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="display:none;" onclick="closeapp();"><i class="glyphicon glyphicon-lock"></i> Exit
                    </a>
                </li>

            </ul>

        </div>
    </nav>

    <div class="nav-scroller bg-default box-shadow">
        <nav class="nav nav-underline">
            <a class="nav-link active" href="#">Dashboard</a>
            <!--<a class="nav-link" href="index.jsp">Maternal/ART</a>-->
        </nav>
    </div>

    <main role="main" class="container">
        <div class="row p-3 mt-2">
            <label class="col-sm-2"></label>
            <a class='btn btn-success col-sm-3' style="text-align: center;" href='https://hsdsacluster2.fhi360.org'>Dashboards Home</a>
            <label class="col-sm-2"></label>
            <a class='btn btn-success col-sm-3' style="text-align: center;" href='aca_mca_reports.jsp'>Generate Reports</a>
            <label class="col-sm-2"></label>
        </div>

        <div class="p-3 my-3  bg-white rounded box-shadow">

            <div class="lh-100 text-center ">
                <h5 class="mb-0 text-primary lh-100 ">ADHERENCE - MATERNAL/ART/STF/NEW&DEFAULTERS COHORT ANALYSIS SYSTEM [Ver 1.0.1]</h5>

            </div>
        </div>
        <div class="row p-1 m-2 offset-1">

            <a href="#" id='refreshpage' class="btn btn-danger col-md-6">
                <i class="glyphicon glyphicon-refresh"></i>
                <br> Refresh
            </a>
            <a class="btn btn-danger col-md-6" title="Help" data-toggle="modal" href="#help">
                <i class="glyphicon glyphicon-question-sign"></i>
                <br> Help
            </a>
        </div>


        <div class="my-1 mb-5 p-2 bg-white rounded box-shadow">
            <section id="tabs" class="project-tab">
                <div class="container1">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="panel">
                                <nav>
                                    <ul class="nav nav-tabs" id="nav-pills">

                                    </ul>
                                </nav>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="nav-home">
                                        <div class="panel panel-default">
                                            <div class="panel-body" style="width: 100%">

                                                <h6 class="border-bottom border-gray pb-2 mb-0 mt-2">Enter New Record</h6>
                                                <div class="text-muted pl-5 pt-3 bg-light">
                                                    <center>
                                                        <div id="loading" class="alert-success"></div>
                                                    </center>

                                                    <form class="form form-vertical" onsubmit="return validatedata();" action="multisave" method="post" id="weeklydataform">
                                                        <div class="row offset-0 p-2">

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label><font color="red"><b>*</b></font> Cohort Type </label>
                                                                    <select  onchange='createdynamicinputs();getFacilitiesJson();loadcohorts();hiddenelements();cohortmonths();isdisplayindicators();' required="true"  name="cohortttype" id="cohortttype" class="form-control" >
                                                                        <% if (session.getAttribute("ct") != null) {
                                                                                if (session.getAttribute("ct").equals("art")) {
                                                                                    out.println("<option selected value='art'>ACA</option>");
                                                                                    out.println("<option value='pmtct'>MCA</option>");
                                                                                    out.println("<option value='stf'>STF</option>");
                                                                                    out.println("<option value='defaulter'>NEW AND DEFAULTER</option>");
                                                                                } else if (session.getAttribute("ct").equals("pmtct")) {
                                                                                    out.println("<option  value='art'>ACA</option>");
                                                                                    out.println("<option selected value='pmtct'>MCA</option>");
                                                                                    out.println("<option value='stf'>STF</option>");
                                                                                    out.println("<option value='defaulter'>NEW AND DEFAULTER</option>");
                                                                                } else if (session.getAttribute("ct").equals("stf")) {
                                                                                    out.println("<option  value='art'>ACA</option>");
                                                                                    out.println("<option  value='pmtct'>MCA</option>");
                                                                                    out.println("<option selected value='stf'>STF</option>");
                                                                                    out.println("<option value='defaulter'>NEW AND DEFAULTER</option>");
                                                                                } else if (session.getAttribute("ct").equals("defaulter")) {
                                                                                    out.println("<option  value='art'>ACA</option>");
                                                                                    out.println("<option  value='pmtct'>MCA</option>");
                                                                                    out.println("<option  value='stf'>STF</option>");
                                                                                    out.println("<option selected value='defaulter'>NEW AND DEFAULTER</option>");
                                                                                }

                                                                            } else {%>
                                                                        <option value="">Select Cohort Type</option>
                                                                        <option value="art">ACA</option>
                                                                        <option value="pmtct">MCA</option>
                                                                        <option value="stf">STF</option>
                                                                        <option value="defaulter">NEW AND DEFAULTER</option>


                                                                        <%}%>


                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">

                                                                <div class="form-group">
                                                                    <label><font color="red"><b>*</b></font> Reporting year </label> 
                                                                    <select required="true" onclick="getmonth();cohortmonths();loadcohorts();isdisplayindicators();"   name="year" id="year" class="form-control" >
                                                                        <option value=''>Select Year</option>
                                                                        <%

                                                                            Calendar cal = Calendar.getInstance();
                                                                            int curyear = cal.get(Calendar.YEAR);
                                                                            int curmn = cal.get(Calendar.MONTH) + 1;

                                                                            if (curmn >= 10) {
                                                                                curyear = curyear + 1;
                                                                            }

                                                                            for (int a = 2017; a <= curyear; a++) {

                                                                                if (session.getAttribute("yr") != null) {

                                                                                    if (new Integer(session.getAttribute("yr").toString()) == a) {
                                                                                        System.out.println(" Mwaaka ni " + session.getAttribute("yr") + " vs " + a);
                                                                                        out.println("<option selected value='" + a + "'>" + a + "</option>");
                                                                                    } else {
                                                                                        out.println("<option value='" + a + "'>" + a + "</option>");
                                                                                    }

                                                                                } else {

                                                                                    out.println("<option value='" + a + "'>" + a + "</option>");

                                                                                }
                                                                        %>


                                                                        <%
                                                                            }

                                                                        %>



                                                                    </select>
                                                                    <input type="hidden"  name ="rowid" id="rowid"  />
                                                                </div>

                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label><font color="red"><b>*</b></font> Reporting Month </label>
                                                                    <select required="true"    name="month" id="month" onchange="cohortmonths();loadcohorts();isdisplayindicators();" class="form-control" >
                                                                        <option>Select Month</option>
                                                                        <option value="01">January</option>
                                                                        <option value="02">February</option>
                                                                        <option value="03">March</option>
                                                                        <option value="04">April</option>
                                                                        <option value="05">May</option>
                                                                        <option value="06">June</option>
                                                                        <option value="07">July</option>
                                                                        <option value="08">August</option>
                                                                        <option value="09">September</option>
                                                                        <option value="10">October</option>
                                                                        <option value="11">November</option>
                                                                        <option value="12">December</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">

                                                                <div class="form-group">
                                                                    <label> <font color="red"><b>*</b></font>  Cohort Month:</label>
                                                                    <select required="true" onchange="loadcohorts();hiddenelements();isdisplayindicators();"  name="cohortmonth" id="cohortmonth" class="form-control" >
                                                                        <option value=''>Select reporting year and month</option>


                                                                    </select>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-6">

                                                                <div class="form-group">
                                                                    <label> <font color="red"><b>*</b></font>  Facility Name:</label>
                                                                    <select required="true"  onchange="loadcohorts(); isdisplayindicators();"   name="facilityname" id="facilityname" class="form-control" >
                                                                        <option>Select Facility Name</option>

                                                                    </select>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="text-muted p-3 border border-gray">
                                                            <table class='table table-striped table-bordered dynamicindicators' id="dynamicindicators" style="display:none;" > 

                                                                <!------INDICATORS----->
                                                                <tr ><td class='col-xs-12' colspan='3'>
                                                                        <div class='control-group'>

                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table class="table table-striped table-bordered">
                                                                <tr><td colspan="3" class="col-xs-12">
                                                                        <div class="control-group col-xs-12">
                                                                            <div class="alert-info">Note: Please enter all the required data.</div>
                                                                            <br/>
                                                                            <div class="controls">
                                                                                <input type="submit" onmouseover="validatefacility();"  id='savebutton' value="SAVE"  style="margin-left: 0%;" class="btn-lg btn-success active">

                                                                            </div>
                                                                            <div class="controls">
                                                                                <button type="submit" id='updatebutton' onclick="updateweeklydata();" style="margin-left: 0%;display:none;" class="btn-lg btn-info active">
                                                                                    UPDATE
                                                                                </button>
                                                                            </div>


                                                                        </div>
                                                                    </td></tr>

                                                            </table>
                                                        </div>

                                                    </form>



                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>



                </div>
        </div>

    </section>





</main>

<footer class="text-center m-5"> &copy; AphiaPlus USAID </footer>
<!-- /.modal -->

<div class="modal" id="userdetails">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">User Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="#" id="userform" method="post">
                <div class="modal-body">

                    <div class="control-group">
                        <label><font color="red"><b>*</b></font>  User Name</label>
                        <div class="controls">
                            <input type="text" size="14"   required name="username" id="username" class="form-control" >
                        </div>
                    </div> 

                    <div class="control-group" >
                        <label>County Supporting:</label>
                        <div class="controls">
                            <select  name="usercounty" id="usercounty" style="width:100%;" class="form-control">
                                <option>Select County</option>
                                <option value="Baringo">Baringo</option>
                                <option value="Kajiado">Kajiado</option>
                                <option value="Laikipia">Laikipia</option>
                                <option value="Nakuru">Nakuru</option>
                                <option value="Narok">Narok</option>


                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button onclick=" updateuser();" type="submit" class="btn btn-success active">Save</button>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>


<div class="modal" id="help">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Help</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <p>This  application is created for aiding users in collecting data for the MCA/ART/STF/New and Defaulter Cohort Analysis. One is expected to enter data per facility.</p>
                <h3>Indicators</h3>
                <p>The specific indicators that one should enter data for are;</p>
                <ul>
                    <li>A. Enrolled into cohort	</li>														
                    <li>B. Transfers In(T.I)		</li>													
                    <li>C. Transfers Out(T.O)		</li>													
                    <li>D. Net Cohort(A+B-C)		</li>													
                    <li>E. Defaulters			</li>												
                    <li>F. Lost to follow up (LTFU)		</li>													
                    <li>G. Reported Dead			</li>												
                    <li>H. Stopped				</li>											
                    <li>I. Alive and Active on Treatment</li>															
                    <li>J. Viral Load Collected		</li>													
                    <li>K. Virally suppressed (VL<1000)</li>
                    <li>L. % Retained(I/D*100)</li>
                    <li>M. % Viral suppression (K/J*100)</li>
                    <li>N. # Switched to 2nd line</li>
                    <li>O. # Re-suppressed 6 month after switch</li>
                    
                    



                </ul>
                <h3> Facilities</h3>
                <p> The selected cohort type(MCA/ART/STF/New &AMP;Defaulter) determines the list of facilities availed for choosing </p>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn btn-secondary">Close</a>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>

<!-- Bootstrap core JavaScript
 ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/bootstrap/js/bootstrap.min.js" ></script>
<script src="js/bootstrap-tabcollapse.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/additional/additional.js"></script>
<script src="js/footable.js"></script>
<script src="assets/popper.min.js"></script>
<script src="assets/offcanvas.js"></script>
<script src="assets/bootstrap/js/bootstrap-formhelpers.js"></script>
<script src="assets/calender/lib/jquery-ui.min.js"></script>
<script src="pouchdb-7.0.0.min.js"></script>
<script src="pouchdb.find.min.js"></script>
<script src="js/loader.js"></script>
<script src="js/datepicker.js"></script>

</body>
</html>
