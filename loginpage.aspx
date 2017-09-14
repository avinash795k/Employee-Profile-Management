<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginpage.aspx.cs" Inherits="loginpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        #Textpassword{
            width: 300px;
            height: 28px;
        }
        #Textusername{ 
            width: 300px;
            height: 28px;
        }
        .auto-style1 {
            margin-right: 30px;
        }
    </style>
</head>
<body style="background-color: #0099cc">
    <form id="form1" runat="server">
        <ul style="list-style-type: none; overflow: hidden;">
            <li style="float: right"><asp:Button ID="Button3" runat="server" BackColor="#0099cc" Text="Signup" BorderWidth="0px" style="margin-right: 20px;" CausesValidation="False" OnClick="Signup" Font-Bold="True" Font-Size="Large" /></li>
		    <li style="float: right"><asp:Button ID="Button2" runat="server" BackColor="#0099cc" Text="Login" BorderWidth="0px" OnClick="Login" CausesValidation="False" Font-Bold="True" CssClass="auto-style1" Font-Size="Large" /></li>
	    </ul>
         <table width="300" align="center" style="margin-top:120px">
            <tr>
                <td style="color:rgb(255, 255, 255); font-size: 30px; font-family: 'Calibri Light'; font-weight: normal;" >
                    Log In
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/lock.jpg" Height="22px" Width="18px" />
                    <h1 style="margin-bottom:35px"></h1>
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    User ID:
                </td>
            </tr>
            <tr>
                <td >
                    <asp:TextBox ID="Textusername" runat="server" style="border-radius: 5px; font-size: small;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Textusername" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <h1 style="margin-bottom:12px"></h1>
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Password:
                </td>
            </tr >
            <tr style="margin-top: 1px;margin-bottom:0px;">
                <td >
                    <asp:TextBox ID="Textpassword" runat="server" TextMode="Password" style="border-radius: 5px; font-size: small;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Textpassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <h1 style="margin-bottom:25px"></h1>

                </td>
            </tr>
            <tr>
                <td>
                     <asp:ImageButton ID="ImageButton1" runat="server" Height="27px" Width="95px" ImageUrl="~/Images/login.jpg" style="border-radius: 3px;" OnClick="userlogin" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>