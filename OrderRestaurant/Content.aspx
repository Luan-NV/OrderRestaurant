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

        .left {
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

        .listMenu {
            width: 98%;
            height: 30px;
            background: #cad9fd;
            text-align: center;
            font-size: 100%;
            border: 0.5px solid #afc2de;
            margin-bottom: 3px;
        }

        .subHangCheBien, .subHangPhaChe, .subHangChuyenBan, .subDichVu {
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

        .content {
            width: 20%;
            height: auto;
            border: solid;
            border-color: red;
        }

        .hangchebien, .hangphache, .hangchuyenban, .dichvu  {
            
        }

        .listMenu:hover, .subHangCheBien:hover, .subHangPhaChe:hover, .subHangChuyenBan:hover, .subDichVu:hover {
            opacity: 0.6;
        }
    </style>
</head>
<body>
    <div class="left">
        <div class="listMenu hangchebien">Hàng Chế Biến</div>
            <div id="iHangCheBien"></div>
        <div class="listMenu hangphache">Hàng Pha Chế</div>
            <div id="iHangPhaChe"></div>
        <div class="listMenu hangchuyenban">Hàng Chuyển Bán</div>
            <div id="iHangChuyenBan"></div>
        <div class="listMenu dichvu">Dịch vụ</div>
            <div id="iDichVu"></div>
    </div>
    <script>
        $(".listMenu").click(function () {
            var className = $(this).attr('class');
            if (className == 'listMenu hangchebien') {
                $('#iHangCheBien').append('<div class="subHangCheBien">' + 'Thit bo' + '</div>');
                $(".subHangCheBien").toggle("slow");
            }
            else if (className == 'listMenu hangphache') {
                $('#iHangPhaChe').append('<div class="subHangPhaChe">' + 'Thit bo' + '</div>');
                $(".subHangPhaChe").toggle("slow");
            }
            else if (className == 'listMenu hangchuyenban') {
                $(".subHangChuyenBan").toggle("slow");
            } else {
                $(".subDichVu").toggle("slow");
            }
            //$(".abc").toggle("slow");
        });
        //$(".hangphache").click(function () {
        //    $(".def").toggle("slow");
        //});
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
