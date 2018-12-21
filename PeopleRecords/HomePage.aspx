<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PeopleRecords.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .searchbox {
            /*padding: 0px 500px 0px 500px;*/
            align-content: center;
            width: 300px;
        }
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" />
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!---- AnyOther custom stylesheets ---->

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

    <title></title>

    <script type="text/javascript">
        {

            //bootstrapvalidate('#txtLastName', 'min:1:Required Field !');
            //bootstrapvalidate('#txtFirstName', 'min:1:Required Field !')
            //bootstrapvalidate('#dpDOB', 'ISO8601:Input does not match YYYY-MM-DD')


            // Boostrap validations for the form
            $(document).ready(function () {
                //https://www.aspsnippets.com/Articles/Call-Server-Side-function-from-JavaScript-without-PostBack-in-ASPNet.aspx
                //var change = function (txt) {
                //PageMethods.GetStates(onsucces, onfailure);

                var availableTags = [
                    "ActionScript",
                    "AppleScript",
                    "Asp",
                    "BASIC",
                    "C",
                    "C++",
                    "Clojure",
                    "COBOL",
                    "ColdFusion",
                    "Erlang",
                    "Fortran",
                    "Groovy",
                    "Haskell",
                    "Java",
                    "JavaScript",
                    "Lisp",
                    "Perl",
                    "PHP",
                    "Python",
                    "Ruby",
                    "Scala",
                    "Scheme"
                ];
                $("#txtPersonSearch").autocomplete({
                    source: availableTags
                });

                var txt = '5';
                $("#cmState").append('<option>' + txt + '</option>');
                //};
                //$('.datepicker').datepicker({
                //    format: 'mm/dd/yyyy',
                //    startDate: '-3d'
                //});
                var date = new Date();
                var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
                $('[name="dpDOB"]')
                    .datepicker({
                        format: 'mm/dd/yyyy',
                        startDate: '01/01/1950',
                        endDate: today,
                    })
                    .on('changeDate', function (e) {
                        // Revalidate the date field
                        //fv.revalidateField('date');
                    });

                //$('#btnSubmit').click(function () {

                //});
                $('#btnAddPerson').click(function () {

                    $('#txtFirstName').val('');
                    $('#txtLastName').val('');
                    $('#dpDOB').val('');
                });


                $('.registerForm').bootstrapValidator({
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    //live: 'enabled',
                    message: 'This value is not valid',
                    submitButtons: '#btnSubmit',
                    fields: {
                        txtFirstName: {
                            validators: {
                                notEmpty: {
                                    message: 'First Name is required and cannot be empty'
                                },
                            },
                            regexp: {
                                regexp: /^[a-zA-Z]+$/,
                                message: 'Name can only consist of alphabetical'
                            },
                        },
                        txtLastName: {
                            validators: {
                                notEmpty: {
                                    message: 'Last Name is required and cannot be empty'
                                },
                            },
                            regexp: {
                                regexp: /^[a-zA-Z]+$/,
                                message: 'Name can only consist of alphabetical'
                            },
                        },
                        dpDOB: {
                            validators: {
                                //notEmpty: {
                                //    message: 'The date is required'
                                //},
                                date: {
                                    format: 'MM/DD/YYYY',
                                    min: '01/01/2010',
                                    max: '12/30/2020',
                                    message: 'The date is not valid'
                                },
                            },
                        },
                        cmState: {
                            validators: {
                                notEmpty: {
                                    message: 'State is required and cannot be empty'
                                },
                            },
                        }

                    },

                });
            });

            //on validation of form failure this event is triggered 
            function onFormError(e) {
                // Do something ...
                //alert();
            }

            //on validation of form success this function  is triggered 
            function onFormSuccess(e) {

                // Do something ...
                var data = {};
                var FirstName = $('#txtFirstName').val();
                var LastName = $('#txtLastName').val();
                var DOB = $('#dpDOB').val();
                var Gender = $('#cmGender').val();
                var State = $('#cmState').val();
                data['FirstName'] = FirstName;
                data['LastName'] = LastName;
                data['State'] = State;
                data['Gender'] = Gender;
                data['DOB'] = DOB;
                //alert(data);
                alert(JSON.stringify(data).replace(/[\[\]]+/g, ''));
                //$.ajax({
                //    type: 'POST',
                //    URL: 'HomePage.aspx/SavePerson',
                //    data: 'PersonDetail:"' +  JSON.stringify(data).replace(/[\[\]]+/g, ''),
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    success: function (data, textStatus, jQxhr) {
                //        alert('Success');
                //    },
                //    error: function (jqXhr, textStatus, errorThrown) {
                //        alert(data);
                //        console.log(errorThrown.message);
                //        alert(errorThrown.message);
                //    }
                //});
                PageMethods.SavePerson(JSON.stringify(data).replace(/[\[\]]+/g, ''), onsucces1, onfailure1);

            }
            function onsucces1(r) {
                alert(r.message);
            }
            function onfailure1(r) {
                alert(r.message);
            }

            function onsucces(r) {
                //console.log(JSON.parse(r));
                var v = JSON.parse(r);
                for (i = 0; i < v.length; i++) {
                    $("#cmState").append('<option>' + v[i]['state_code'] + '</option>');
                }
            }
            function onfailure(r) {
                //console.log(r);
            }

            function Validate() {
                var errors = 0;
                var FirstName = $('#txtFirstName').val();
                var LastName = $('#txtLastName').val();
                var Gender = $('#dpDOB').val();
                //console.log(FirstName + LastName + Gender);
                $('.btnSubmit').addClass('has-error has-feedback');
            }

        }
    </script>
</head>
<body>


    <div id="divContainer" runat="server" class="container">
        <h2>People Database</h2>
        <p>The search below is used to lookup existing people records</p>
        <br />
        <%--<form runat="server">--%>

        <div class="row ui-widget">
            <div class="form-group">
                <label for="txtPersonSearch">Person search:</label>
                <input type="text" class="form-control" style="width: 300px" runat="server" placeholder="eg: mark stone" id="txtPersonSearch">
            </div>
        </div>
        <br />
        <%-- </form>--%>


        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" id="btnAddPerson" data-target="#PeopleDialog">
            Add Person
        </button>

        <!-- Modal -->
        <form runat="server" class="val registerForm" data-bv-onerror="onFormError" data-bv-onsuccess="onFormSuccess">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" EnablePageMethods="true">
            </asp:ScriptManager>
            <div class="modal fade" id="PeopleDialog" tabindex="-1" role="dialog" aria-labelledby="PeopleDialogTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="PeopleDialogTitle">Person Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="txtFirstName">First Name:</label>
                                <input type="text" class="form-control" style="width: 300px" spellcheck="false" runat="server" autocomplete="off" placeholder="eg: mark" id="txtFirstName" name="txtFirstName">
                            </div>
                            <div class="form-group">
                                <label for="txtLastName">Last Name:</label>
                                <input type="text" class="form-control" style="width: 300px" runat="server" autocomplete="off" placeholder="eg: stone" id="txtLastName">
                            </div>
                            <div class="form-group">
                                <label for="cmState">State (select one):</label>
                                <select class="form-control" style="width: 300px" name="cmState" id="cmState">
                                    <%--<option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>--%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="cmGender">State (select one):</label>
                                <select class="form-control" style="width: 300px" name="cmGender" id="cmGender">
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dpDOB">Date of Birth :</label>
                                <input data-provide="datepicker" autocomplete="off" style="width: 300px" class="form-control" name="dpDOB" id="dpDOB">
                            </div>
                            <%-- <div class="input-group date" data-provide="datepicker">
                                <label for="cmDOB">Date of Birth:</label>--%>
                            <%-- <input type="text" class="form-control" id="cmDOB" style="width: 300px">--%>
                            <%--<div class="input-group-addon left">
                                <span class="glyphicon glyphicon-th"></span>
                            </div>--%>
                            <%--</div>--%>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-secondary" data-dismiss="modal" Text="Close"></asp:Button>
                            <input id="btnSubmit" type="submit" class="btn btn-primary" value="Save changes"> </input>
                            <%--onclick="Validate(); return false;"--%>
                        </div>


                    </div>
                </div>
            </div>
            <%--container div --%>
        </form>
    </div>
</body>
</html>
