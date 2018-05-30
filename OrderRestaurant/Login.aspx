<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OrderRestaurant.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style type="text/css">
        .bo
        {
	        margin: 40px auto;
	        padding: 20px;
	        height: 140px;
	        border: 1px solid #ccc;
	        width: 250px;
	        background-color: #f1f1f1;
	        text-align: center;
	        font: 14px segoe ui;
        }
        .button
        {
            margin-top: 8px;
            margin-left: 10px;
	        width: 85px;
	        height: 33px;
	        font: 17px segoe ui;
        }
        p{
            margin-left: -15px;
            font-size: 14px;
        }
    </style>
   <%-- <script>
        function delete_cookie() {
            document.cookie = 'LoginCookie' + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            alert(document.cookie);
        }
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bo">
        <table>
            <tr>
                <td><p>UserName:</p></td>
                <td><asp:TextBox ID="UserName" runat="server" Font-Size="18px" style="width:170px;height:25px;"></asp:TextBox></td>
            </tr>
            <tr>
                <td><p>Password:</p></td>
                <td><asp:TextBox TextMode="Password" ID="PassWord"  runat="server" style="width:170px;height:25px;"></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CssClass="button"/>
    </div>
    </form>
</body>
</html>

