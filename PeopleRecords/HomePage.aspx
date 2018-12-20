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
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" />

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


            $(document).ready(function () {
                //https://www.aspsnippets.com/Articles/Call-Server-Side-function-from-JavaScript-without-PostBack-in-ASPNet.aspx
                //var change = function (txt) {
                //PageMethods.GetStates(onsucces, onfailure);

                var txt = '5';
                $("#cmState").append('<option>' + txt + '</option>');
                //};
                //$('.datepicker').datepicker({
                //    format: 'mm/dd/yyyy',
                //    startDate: '-3d'
                //});
                //$('#btnSubmit').click(function () {

                //});

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
                                //    message: 'DOB cannot be empty'
                                //},
                                date: {
                                    format: 'MM/DD/YYYY',
                                    message: 'The value is not a valid date'
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

            function onFormError(e) {
                // Do something ...
                //alert();
            };

            function onFormSuccess(e) {
                
                // Do something ...
                var data = [];
                var FirstName = $('#txtFirstName').val();
                var LastName = $('#txtLastName').val();
                var DOB = $('#dpDOB').val();
                var Gender = $('#cmGender').val();
                var State= $('#cmState').val();
                data.push(FirstName);
                data.push(LastName);
                data.push(DOB);
                data.push(Gender);
                data.push(State);
                alert(data);

            };


            function onsucces(r) {
                console.log(JSON.parse(r));
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
                console.log(FirstName + LastName + Gender);
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

        <div class="row">
            <div class="form-group">
                <label for="txtPersonSearch">Person search:</label>
                <input type="text" class="form-control" style="width: 300px" runat="server" placeholder="eg: mark stone" id="txtPersonSearch">
            </div>
        </div>
        <br />
        <%-- </form>--%>


        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#PeopleDialog">
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
                                <input data-provide="datepicker" style="width: 300px" class="form-control" name="dpDOB" id="dpDOB">
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
