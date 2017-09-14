<%@ Page Title="" Language="C#" MasterPageFile="~/Masterhead.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 44px;
        }
        .auto-style2 {
            margin-top: 0px;
        }
        .auto-style3 {
            margin-right: 30px;
        }
        .auto-style4 {
            overflow: hidden;
            margin-top: 0px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontent" Runat="Server">
    <ul style="list-style-type: none; " class="auto-style4">
        <li style="float: right"><asp:Button ID="Button3" runat="server" BackColor="#0099cc" Text="Signup" BorderWidth="0px" style="margin-right: 20px;" CausesValidation="False" Font-Bold="True" OnClick="Signup" Font-Size="Large" /></li>
		<li style="float: right"><asp:Button ID="Button2" runat="server" BackColor="#0099cc" Text="Login" BorderWidth="0px" OnClick="Login" CausesValidation="False" Font-Bold="True" CssClass="auto-style3" Font-Size="Large" /></li>
	</ul>
    <center><h2>-Enter your details-</h2></center>
    <table width="400" align="center" cellpadding="10" style="margin-top:10px">
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Name:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >
                    
                    <asp:TextBox ID="Textname" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Textname" Height="20px" Width="80px"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Username:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;">
                    
                    <asp:TextBox ID="Textusername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Textusername" Height="20px" Width="80px"></asp:RequiredFieldValidator>

                    <asp:Label ID="Label1" runat="server" Text="username in use" Visible="False" ForeColor="Red"></asp:Label>

                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Pasword:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >
                    <asp:TextBox ID="Textpassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Textpassword" Height="20px" Width="80px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Confirm Pasword:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;"> 
                    <asp:TextBox ID="Textrepassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Textrepassword" Height="20px" Width="80px"></asp:RequiredFieldValidator>
         
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Textpassword" ControlToValidate="Textrepassword" CssClass="auto-style2" ErrorMessage="Mismatch" ForeColor="Red" Height="20px" Width="80px"></asp:CompareValidator>
                    </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Birthday:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;"> 
                    
                    <%--<asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="cld"></asp:Calendar>--%>
                    
                    <%--<asp:TextBox ID="TextBox1" runat="server" Width="72px">dd-mm-yyyy</asp:TextBox>--%>
                    
                    
                    <%--<asp:ImageButton ID="ImageButton1" runat="server" Height="22px" ImageUrl="~/Images/calender.png" Width="22px" OnClick="calendar_button"  />--%>
                    
                    
                    <asp:TextBox ID="Textbirthday" runat="server" TextMode="Date"></asp:TextBox>
                    
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Textrepassword" Height="20px" Width="80px"></asp:RequiredFieldValidator>
         
                    
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;">
                    Gender:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;"> 
                    
                    <asp:DropDownList ID="Dropgender" runat="server" Width="70px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Dropgender" Height="20px" Width="80px"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style1">
                    Mobile:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style1"> 
                    
                    <asp:TextBox ID="Textmobile" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="Textmobile" Height="20px" Width="80px"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Textmobile" ErrorMessage="Give correct number" ForeColor="Red" ValidationExpression="[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                     <asp:Button ID="Button1" runat="server" style="margin-left: 122px" OnClick="Button1_Click" Text="Register" Width="79px" />
                </td>
            </tr>
        </table>
</asp:Content>

