<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="OrderRestaurant.Content" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="libs/jquery-3.3.1.min.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        .left{
            width: 13%;
            height: auto;
            border: 0.5px solid #ffffff;
        }
        .boxwrap {
            width: 6%;
            height: 100%;
            border: 1px solid #afc2de;
            margin-right: 15px;
            margin-bottom: 15px;
        }

        .bd1 {
            float: left;
            border: 1px solid #fff;
        }

        .roomnumber1 {
            width: 98%;
            height: 30px;
            background: #cad9fd;
            text-align: center;
            font-size: 100%;
            border: 0.5px solid #afc2de;
            margin-bottom: 8px;
        }

        .roomnumber2 {
            width: 98%;
            height: 30px;
            background: #cad9fd;
            text-align: center;
            font-size: 100%;
            border: 0.5px solid #afc2de;
            margin-bottom: 8px;
        }

        .abc {
            width: 98%;
            height: 30px;
            background: #f7f7f7;
            text-align: center;
            font-size: 100%;
            border: 0.5px solid #afc2de;
            margin-bottom: 3px;
            margin-left: 15px;
            display: none;
        }

        .def {
            width: 98%;
            height: 30px;
            background: #f7f7f7;
            text-align: center;
            font-size: 100%;
            border: 0.5px solid #afc2de;
            margin-bottom: 3px;
            margin-left: 15px;
            display: none;
        }

        .boxwrap:hover {
            opacity: 0.5;
        }
        .content{
            width: 20%;
            height: auto;
            border: solid;
            border-color: red;
        }
        .cb{
            margin-bottom: 3px;
        }

        .roomnumber1:hover {
            opacity: 0.65;
        }
        .roomnumber2:hover {
            opacity: 0.65;
        }
    </style>
</head>
<body>
    <div class="left">
    <div class="roomnumber1 cb">Hàng Chế Biến</div>
    <div class="abc"></div>
    <div class="abc"></div>
    <div class="abc"></div>
    <div class="roomnumber2 cb">Hàng Pha Chế</div>
    <div class="def"></div>
    <div class="def"></div>
    <div class="roomnumber1 cb">Hàng Chuyển Bán</div>
    <div class="roomnumber1 cb">Dịch vụ</div>
    </div>
    <script>
        $(".roomnumber1").click(function () {
            $( ".abc" ).toggle( "slow" );
        });
        $(".roomnumber2").click(function () {
            $( ".def" ).toggle( "slow" );
        });
    </script>
    <%--<script>
        function FirstRun() {
            $.ajax({
                async: false,
                type: "POST",
                url: "Content.aspx/Test",
                data: null,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //document.write(JSON.stringify(response));
                    //alert(JSON.stringify(response));
                    $('#content').append(JSON.stringify(response.d));
                    $('#content').append("<p>abc<p>");
                },
            });
        }
        FirstRun();
    </script>--%>
</body>
</html>
