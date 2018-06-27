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
            float: left;
            /*position:fixed;*/
        }

        .center {
            width: 715px;
            height: auto;
            /*border: 0.5px solid #babaff;*/
            margin-left: 12px;
            margin-top: -5px;
            float: left;
        }

        .right {
            width: 17%;
            height: 100px;
            border: 0.5px solid #babaff;
            margin-right: -2px;
            float: left;
            padding-left: 5px;
        }

        .FoodFrame {
            width: 350px;
            height: 165px;
            border: 0.5px solid #babaff;
            margin-left: 5px;
            margin-bottom: 5px;
            margin-top: 5px;
            float: left;
        }

        .Holder {
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

        .ImgC {
            width: 165px;
            height: 15px;
            /*border: 0.5px solid #ff0000;*/
            margin-left: 2px;
            margin-bottom: 2px;
            margin-top: 2px;
            bottom: 0px;
            left: 0px;
            float: left;
        }

        .Donvi {
            margin-left: 10px;
            margin-top: 10px;
            /*float: left;*/
        }

        .Dongia {
            margin-left: 10px;
            margin-top: 20px;
            /*float: left;*/
        }

        .Soluong {
            margin-left: 0px;
            width: 70px;
            height: 25px;
            /*border: 0.5px solid #ff0000;*/
            /*margin-top: px;*/
            float: left;
        }

        .SoluongI {
            margin-left: 0px;
            width: 55px;
            height: 25px;
            /*border: 0.5px solid #ff0000;*/
            /*margin-top: px;*/
            float: left;
        }

        .Updown {
            margin-left: 0px;
            width: 32px;
            height: 25px;
            /*border: 0.5px solid #ff0000;*/
            /*margin-top: px;*/
            float: left;
        }

        .Up {
            margin-left: 0px;
            margin-top: -15px;
            width: 32px;
            height: 20px;
            /*border: 0.5px solid #0000ff;*/
            float: left;
        }

        .Down {
            margin-left: 0px;
            margin-top: 2px;
            width: 32px;
            height: 20px;
            /*border: 0.5px solid #0000ff;*/
            float: left;
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

        .hangchebien, .hangphache, .hangchuyenban, .dichvu {
        }

        .listMenu:hover, .subHangCheBien:hover, .subHangPhaChe:hover, .subHangChuyenBan:hover, .subDichVu:hover, .Up:hover, .Down:hover {
            opacity: 0.6;
        }

        .tcvn {
            display: none
        }

        input[type=text] {
            width: 50px;
            height: 30px;
            /*padding: 12px 20px;*/
            margin-top: -10px;
            margin-left: 1px;
            /*margin-top: 40px;*/
            /*display: inline-block;*/
            border: 1px solid #ccc;
            border-radius: 4px;
            float: left;
            text-align: right;
            font-size: 22px;
            /*box-sizing: border-box;*/
        }

        .SoluongHolder {
            width: 160px;
            height: 30px;
            /*border: 0.5px solid #ff0000;*/
            margin-left: 10px;
            margin-top: 20px;
        }

        .Themvaodanhsach {
            width: 160px;
            height: 30px;
            margin-left: 10px;
            margin-top: 10px;
        }

        .butt {
            background-color: #DFEAFA;
            font-size: 15px;
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
    <div class="center">
        <div id="Food"></div>
    </div>
    <div class="right">lang quan ho que toi, thang gieng vui hat hoi</div>
    <script>
        function getSubMenu() {
            $.ajax({
                async: false,
                type: "POST",
                url: "Content.aspx/getSubMenu",
                data: null,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var rs = response.d.split("#");
                    var count = rs.length;
                    for (var i = 0; i < count; i++) {
                        if (rs[i].substring(0, 2).toLowerCase() == "cb") {
                            var code = rs[i].substring(0, rs[i].indexOf("|"))
                            var sub = rs[i].substring(rs[i].indexOf("|") + 1);
                            var tcvn = sub.substring(0, sub.indexOf("|"));
                            var unicode = sub.substring(sub.indexOf("|") + 1);
                            $('#iHangCheBien').append('<div class="subHangCheBien" id="' + code + '">' + unicode + '<div class="tcvn">' + tcvn + '</div></div>');
                        }
                        if (rs[i].substring(0, 2).toLowerCase() == "hp") {
                            var sub = rs[i].substring(rs[i].indexOf("|") + 1);
                            var tcvn = sub.substring(0, sub.indexOf("|"));
                            var unicode = sub.substring(sub.indexOf("|") + 1);
                            $('#iHangPhaChe').append('<div class="subHangPhaChe">' + unicode + '<div class="tcvn">' + tcvn + '</div></div>');
                        }
                        if (rs[i].substring(0, 2).toLowerCase() == "ch") {
                            var sub = rs[i].substring(rs[i].indexOf("|") + 1);
                            var tcvn = sub.substring(0, sub.indexOf("|"));
                            var unicode = sub.substring(sub.indexOf("|") + 1);
                            $('#iHangChuyenBan').append('<div class="subHangChuyenBan">' + unicode + '<div class="tcvn">' + tcvn + '</div></div>');
                        }
                        if (rs[i].substring(0, 2).toLowerCase() == "dv") {
                            var sub = rs[i].substring(rs[i].indexOf("|") + 1);
                            var tcvn = sub.substring(0, sub.indexOf("|"));
                            var unicode = sub.substring(sub.indexOf("|") + 1);
                            $('#iDichVu').append('<div class="subDichVu">' + unicode + '<div class="tcvn">' + tcvn + '</div></div>');
                        }
                    };
                },
            });

            var firsttcvn = $('.tcvn').first().text();

            getFood(firsttcvn);
        }

        getSubMenu();

        $(".listMenu").click(function () {
            var className = $(this).attr('class');
            if (className == 'listMenu hangchebien') {
                $(".subHangCheBien").toggle("slow");
            }
            else if (className == 'listMenu hangphache') {
                $(".subHangPhaChe").toggle("slow");
            }
            else if (className == 'listMenu hangchuyenban') {
                $(".subHangChuyenBan").toggle("slow");
            } else {
                $(".subDichVu").toggle("slow");
            }
        });

        $(".subHangCheBien, .subHangPhaChe, .subHangChuyenBan, .subDichvu").click(function () {
            var id = this.id;
            //($(this)).prepend( "<p>Test</p>" );
            //alert(id);
            var tcvn = $(this).find('.tcvn').text();
            getFood(tcvn);
        });

        $(document).on("click", ".Up", function () {
            var id = $(this).parents('.FoodFrame').attr('id');
            var Input = $('#' + id).find('.SoluongI').find('input');
            var value = Input.val();
            if (value.length == 0) {
                Input.val("1");
            } else {
                Input.val(parseInt(value) + 1);
            }
        });

        $(document).on("click", ".Down", function () {
            var id = $(this).parents('.FoodFrame').attr('id');
            var Input = $('#' + id).find('.SoluongI').find('input');
            var value = Input.val();
            if ((value.length == 0) || (parseInt(value) == 0)) {
                Input.val("0");
            } else {
                Input.val(parseInt(value) - 1);
            }
        });

        function addFunction(t) {
            var id = $(t).parents('.FoodFrame').attr('id');
            var Input = $('#' + id).find('.SoluongI').find('input');
            var value = Input.val();
            //alert(id);
            if ((value.trim().length == 0) || (parseInt(value) == 0)) {
                alert("Số lượng phải lớn hơn 0");
            }
        }

        $(document).on("keyup", ".number", function () {
            var id = $(this).parents('.FoodFrame').attr('id');
            var number1 = $('#' + id).find('.SoluongI').find('input').val();
            if (number1.indexOf(' ') >= 0){
                var number2 = number1.trim();
                $('#' + id).find('.SoluongI').find('input').val(number2);
            }
            if (number1.indexOf('.') >= 0) {
                var number2 = number1.substring(0, number1.length - 1);
                $('#' + id).find('.SoluongI').find('input').val(number2);
            }
            if (!isNaN(number1)) {

            } else {
                alert('Số không hợp lệ');
                $('#' + id).find('.SoluongI').find('input').val('');
            }
        });

        function getFood(firsttcvn) {
            $.ajax({
                async: false,
                type: "POST",
                url: "Content.aspx/getFood",
                data: '{ input: "' + firsttcvn + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#Food').empty();
                    var rs = response.d.split("#");
                    var count = rs.length;
                    for (var i = 0; i < count; i++) {
                        var con = rs[i].split("|");
                        var img = document.createElement("img");
                        img.src = "Images/" + con[3];
                        var up = document.createElement("img");
                        up.src = "Images/Up.jpg";
                        var down = document.createElement("img");
                        down.src = "Images/Down.jpg";
                        $('#Food').append('<div class="FoodFrame" id="' + con[0] + '"><div class="Holder"><div class="ImgP"></div><div class="ImgC"></div></div><div class="Holder"><div class="Donvi">Đơn vị: </div><div class="Dongia">Đơn giá: </div><div class="SoluongHolder"><div class="Soluong">Số lượng</div><div class="SoluongI"><input type="text" maxlength="3" class="number"></div><div class="Updown"><div class="Up"></div><div class="Down"></div></div></div><div class="Themvaodanhsach"><button class="butt" type="button" onclick="addFunction(this)">Thêm vào danh sách</button></div></div></div>');
                        $('#' + con[0]).find('.ImgC').text(con[1]);
                        $('#' + con[0]).find('.Donvi').append(con[2]);
                        $('#' + con[0]).find('.Dongia').append(con[4] + " VNĐ");
                        //if (!($('#' + con[0]).find('.ImgP').find('img').length))
                        //{
                        $('#' + con[0]).find('.ImgP').append(img);
                        $('#' + con[0]).find('.Up').append(up);
                        $('#' + con[0]).find('.Down').append(down);
                        //};
                    };
                }
            });
        }
    </script>
</body>
</html>
