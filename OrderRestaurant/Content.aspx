<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="OrderRestaurant.Content" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="libs/jquery-3.3.1.min.js"></script>
    <style>
        /*#content{
            width: 700px;
        }*/
    </style>
</head>
<body>
    <div id="content"></div>
    <script>
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
    </script>
    <%--<label class="radio-inline">
        <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
        1
    </label>
    <label class="radio-inline">
        <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
        2
    </label>
    <label class="radio-inline">
        <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
        3
    </label>--%>
</body>
</html>
