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
    <script type="text/javascript">
        {
            $(function () {
                var change = function (txt) {
                    $("#ID").append('<li>' + txt + '</li>');
                };
                change("this is the first change");
                change("this is the second change");
            });

        }
    </script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.slim.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <title></title>
</head>
<body>

    <div id="divContainer" runat="server" class="container">
        <h2>People Database</h2>
        <p>The search below is used to lookup existing people records</p>
        <br />
        <form>
            <div class="row">
                <div class="form-group">
                    <label for="txtPersonSearch">Person search:</label>
                    <input type="text" class="form-control" style="width: 300px" runat="server" placeholder="eg: mark stone" id="txtPersonSearch">
                </div>
            </div>
            <br />
        </form>


        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#PeopleDialog">
            Launch demo modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="PeopleDialog" tabindex="-1" role="dialog" aria-labelledby="PeopleDialogTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="PeopleDialogTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="txtFirstName">First Name:</label>
                            <input type="text" class="form-control" style="width: 300px" runat="server" placeholder="eg: mark" id="txtFirstName">
                        </div>
                        <div class="form-group">
                            <label for="txtLastName">Last Name:</label>
                            <input type="text" class="form-control" style="width: 300px" runat="server" placeholder="eg: stone" id="txtLastName">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                    <div class="form-group">
                        <label for="cmState">State (select one):</label>
                        <select class="form-control" id="cmState">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <%--container div --%>
    </div>
</body>
</html>
