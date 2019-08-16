//prepare form data

//===================================================Dynamic Input for different months===================================

var facility = null;

var month = null;
var year = null;

var enrolled_cohort_kp = null;
var enrolled_cohort_np = null;
var enrolled_cohort_total = null;
var transfers_in_kp = null;
var transfers_in_np = null;
var transfers_in_total = null;
var transfers_out_kp = null;
var transfers_out_np = null;
var transfers_out_total = null;
var netcohort_kp = null;
var netcohort_np = null;
var netcohort_total = null;
var defaulters_kp = null;
var defaulters_np = null;
var defaulters_total = null;
var ltfu_kp = null;
var ltfu_np = null;
var ltfu_total = null;
var reported_dead_kp = null;
var reported_dead_np = null;
var reported_dead_total = null;
var stopped_kp = null;
var stopped_np = null;
var stopped_total = null;
var alive_active_treat_kp = null;
var alive_active_treat_np = null;
var alive_active_treat_total = null;
var viralload_kp = null;
var viralload_np = null;
var viralload_total = null;
var suppressed_kp = null;
var suppressed_np = null;
var suppressed_total = null;
var retained_kp = null;
var retained_np = null;
var retained_total = null;
var cohort = null;
var facility = null;
var year = null;
var month = null;
var cohort = null;

//added 201605 
var progressbarstoskip = [];
var allindicatorsarray = [];
var allcommentsarray = [];
var allprogressbar_hiddentext_array = [];


function createdynamicinputs() {


    $(document).ready(function () {
        $.getJSON("indicators2.json", function (result) {
            var table = "";
            var row1 = "";
            var row2 = "";
            var count = 1;
            var currentcohort = $("#cohortttype").val().toUpperCase();
            for (a = 0; a < result.length; a++) {

                if (result[a].category === currentcohort) {

                    var indicatorname = result[a].IndicatorName;
                    var indicatorid = result[a].IndicatorID;
                    var label = result[a].Age;
                    var level = result[a].Level;
                    var inputtype = result[a].datainputtype;
                    var minimum = result[a].Min;
                    var maximum = result[a].Max;
                    var onblur = "";
                    if (result[a].onblur !== null) {
                        onblur = result[a].onblur;
                    }
                    var onkeypress = result[a].onkeypress;
                    var tdclass = result[a].tdclass;
                    var isrequired = result[a].Required;
                    var isnewrow = result[a].newrow;
                    var readonlyvar = result[a].readonly;
                    var isreadonly = "";
                    allindicatorsarray.push(indicatorid);
                    var tabindex = "";
                    if (readonlyvar === "TRUE") {

                        isreadonly = "readonly";
                        tabindex = " tabindex='-1' ";
                    }
                    var colspan = result[a].colspan;

                    if (label === 'Total' && tdclass === 'col-xs-4') {
                    }
                    if (isnewrow === 1)
                    {

                        row1 = "<tr> <td class='col-xs-12' colspan='3'> <div class='control-group'> <label> <font color='red'> <b> * </b> </font> " + indicatorname + " </label> </div> </td> </tr>";
                        count++;
                        row2 += row1;
                    } else {

                        row1 = "";
                    }
                    if (isnewrow === 1 && count === 2)
                    {
                        row2 += " <tr> ";
                    } else if (isnewrow === 1 && count > 2 && count < result.length) {
                        row2 += " </tr> <tr> ";

                    }


                    row2 += "<td class='" + tdclass + "' colspan='" + colspan + "' > <div class='control-group' > <label> " + label + " </label> <div class='controls'> <input   required='true' onkeypress='return numbers(event);' " + isreadonly + "  " + tabindex + " onblur=\"" + onblur + "\" type='tel' maxlength='4' min ='" + minimum + "' max='" + maximum + "'  name='" + indicatorid + "' id='" + indicatorid + "' class='form-control inputs'> </div> </div> </td> ";
                    //IndicatorID	Age	IndicatorName	Level	datainputtype	Min	Max	onblur	onkeypress	Class	Required


                    //now do an appending
                }
            }
            row2 += " </tr> ";

            //alert(row2);
            $("#dynamicindicators-3m").html(row2);
            $("#dynamicindicators-6m").html(row2);
            $("#dynamicindicators-12m").html(row2);
            $("#dynamicindicators-24m").html(row2);
            $("#dynamicindicators-36m").html(row2);

            // alert(result[0].IndicatorName);
        });// ned of input field loading


        //progress bar report section



    });   //end of checking if document is ready


}


         
