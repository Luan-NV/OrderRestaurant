<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadImg.aspx.cs" Inherits="OrderRestaurant.LoadImg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="libs/jquery-3.3.1.min.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        .center {
            width: 70%;
            height: auto;
            border: 0.5px solid #babaff;
            margin-left: 12px;
            float: left;
        }

        .FoodFrame {
            width: 98%;
            height: 165px;
            border: 0.5px solid #ff0000;
            margin-left: 5px;
            margin-bottom: 5px;
            margin-top: 5px;
            float: left;
        }

        .ImgHolder {
            width: 170px;
            height: 160px;
            /*border: 0.5px solid #ff0000;*/
            margin-left: 2px;
            margin-bottom: 2px;
            margin-top: 2px;
            float: left;
        }
        .ImgP {
            width: 165px;
            height: 125px;
            /*border: 0.5px solid #ff0000;*/
            margin-left: 2px;
            margin-bottom: 2px;
            margin-top: 2px;
            float: left;
        }
        .ImgContent {
            width: 165px;
            height: 15px;
            /*border: 0.5px solid #ff0000;*/
            margin-left: 60px;
            margin-bottom: 2px;
            margin-top: 2px;
            bottom: 0px;
            left: 0px;
            float: left;
        }
        .Soluong{
            margin-left: 20px;
            margin-top: 55px;
            float: left;
        }
    </style>
</head>
<body>
    <div class="center">
        <div class="FoodFrame">
            <div class="ImgHolder">
                <div class="ImgP"></div>
                <div class="ImgContent">Chân gà</div>
            </div>
            <div class="Soluong">Số lượng</div>
        </div>
        <div class="FoodFrame">
            <div class="ImgHolder">
                <div class="ImgP"></div>
                <div class="ImgContent">Chân gà</div>
            </div>
            <div class="Soluong">Số lượng</div>
        </div>
    </div>
    <script>
        function runFirst() {
            var img = document.createElement("img");
            img.src = "Images/chicken.jpg";
            $('.' + 'ImgP').append(img);
        }

        runFirst();
    </script>

</body>
</html>
