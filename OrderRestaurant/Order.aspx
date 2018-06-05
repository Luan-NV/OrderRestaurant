<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="OrderRestaurant.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order</title>
    <script src="libs/jquery-3.3.1.min.js"></script>
    <script src="libs/bootstrap.js"></script>
    <link href="libs/bootstrap.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .boxwrap {
            width: 6%;
            height: 100%;
            border: 1px solid #afc2de;
            margin-right: 15px;
            margin-bottom: 15px;
        }

        .bd {
            float: left;
            border: 1px solid #fff;
        }

        .roomnumber {
            width: 8%;
            height: 30px;
            background: #fef3cf;
            text-align: center;
            font-size: 90%;
            cursor: default;
            border: 0.5px solid #afc2de;
            margin: 10px;
        }

        .boxwrap:hover {
            opacity: 0.5;
        }

        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            width: 80%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s;
            overflow-y: initial;
        }

        /* Add Animation */
        @-webkit-keyframes animatetop {
            from {
                top: -300px;
                opacity: 0
            }

            to {
                top: 0;
                opacity: 1
            }
        }

        @keyframes animatetop {
            from {
                top: -300px;
                opacity: 0
            }

            to {
                top: 0;
                opacity: 1
            }
        }

        /* The Close Button */
        .close {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .modal-header {
            height: 50%;
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }

        .modal-body {
            padding: 2px 16px;
            height: 400px;
            overflow-y: auto;
        }

        .modal-footer {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }

        /*#listTable{
            width: 70%;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p></p>
        <p id="demo">
            &nbsp&nbsp Khu vực&nbsp<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="false" onchange="changeArea(this);">
            </asp:DropDownList>
        </p>
        <p id ="listTable"></p>
        <script>
            function runFirst() {
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Order.aspx/GetTablesRunFirst",
                    data: null,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var rs = response.d.split(",");
                        var count = rs.length;
                        for (var i = 0; i < count; i++) {
                            //document.write('<div class="boxwrap bd"> <div class="roomnumber bd"> <p>' + rs[i] + '</p> </div> </div>');
                            $('#listTable').append(' <div class="roomnumber bd"> <p>' + rs[i] + '</p> </div> ');
                            //<div class="boxwrap bd"></div>
                        };
                    },
                });
            }
            runFirst();

            function changeArea(DropDownList1) {
                var area = $('#DropDownList1').val();
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "Order.aspx/GetTablesAfterRunFirst",
                    data:'{ID: "' + area + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#listTable').empty();
                        var rs = response.d.split(",");
                        var count = rs.length;
                        for (var i = 0; i < count; i++) {
                            //document.write
                            //document.write('<div class="boxwrap bd"> <div class="roomnumber bd"> <p>' + rs[i] + '</p> </div> </div>');
                            $('#listTable').append('<div class="roomnumber bd"> <p>' + rs[i] + '</p> </div>');
                        };
                    },
                });
            }


        //$('.boxwrap').mouseover(function () {
        //    $('.boxwrap').css({'cursor': 'pointer'});
        //});

        //$('.boxwrap').click(function () {
        //    alert("hello");
        //});
        </script>
      <%--  <script>
            $("[id$='DropDownList1']").change(function () {
                var area = $('#DropDownList1').val();
                alert('area');
            }
        </script>--%>
        <%--</div>--%>
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">&times;</span>
                    <h5>Menu</h5>
                </div>
                <div class="modal-body">
                    <p>Some text in the Modal Body</p>
                    <p>Some other text...</p>
                </div>
                <%-- <div class="modal-footer">
                <h3>Modal Footer</h3>
            </div>--%>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                    <button type="button" class="btn btn-default">Save</button>
                </div>
            </div>

        </div>
        <script>
            //var span = document.getElementsByClassName("close")[0];
            //$('.boxwrap').click(function () {
            //    $('#myModal').show();
            //});

            //span.onclick = function () {
            //    $('#myModal').hide();
            //}


            //window.onclick = function (event) {
            //    if (event.target == $('.boxwrap')) {
            //        $('#myModal').hide();
            //    }
            //}
            // Get the modal
            var modal = document.getElementById('myModal');

            //// Get the button that opens the modal
            //var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            $('#listTable, .boxwrap').click(function () {
                $('.modal-body').load('Content.aspx');
                $('#myModal').show();
            });


            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
    </form>
</body>
</html>
