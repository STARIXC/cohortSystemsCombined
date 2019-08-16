$("#dateOfRegistration").datepicker({
    dateFormat: 'dd M yy',
    numberOfMonths: 1,
    changeMonth: true,
    changeYear: true,
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate() + 1);
        $("#dateTreatmentStarted").datepicker("option", "minDate", dt);
    }
});
$("#dateTreatmentStarted").datepicker({
    dateFormat: 'dd M yy',
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate() - 1);
        $("dateOfRegistration").datepicker("option", "maxDate", dt);
    }
});
//  $("#artdate").datepicker();
// $("#hivTestDate").datepicker(  );


$("#hivTestDate").datepicker({
    dateFormat: 'dd M yy',
    changeMonth: true,
    changeYear: true,
    yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
    onClose: function (selectedDate) {
        $("#artdate").datepicker("option", "minDate", selectedDate);
    }
});
$("#artdate").datepicker({
    dateFormat: 'dd M yy',
    changeMonth: true,
    changeYear: true,
    yearRange: new Date().getFullYear().toString() + ':' + new Date().getFullYear().toString(),
    onClose: function (selectedDate) {
        $("#hivTestDate").datepicker("option", "maxDate", selectedDate);
    }
});
