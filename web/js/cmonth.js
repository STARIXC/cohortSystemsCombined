   function cohortmonthtabs() {

                var year = $("#year").val();
                var month = $("#month").val();
                var cohorttype = $("#cohortttype").val();
                $.ajax({
                    url: 'getTabs?yr=' + year + "&mn=" + month + "&ct=" + cohorttype,
                    type: 'post',
                    dataType: 'html',
                    success: function (data) {

                        $("#nav-pills").html(data);

                    }
                });
            }
            cohortmonths();