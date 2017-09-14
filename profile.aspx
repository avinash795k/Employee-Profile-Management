<%@ Page Title="" Language="C#" MasterPageFile="~/Masterhead.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .column-style1 {
            width: 90px;
        }
        .column-style2 {
            width: 200px;
        }
        .column-style3 {
            width: 140px;
        }
        .column-style4 {
            width: 400px;
        }
        .auto-style5 {
            width: 80px;
            height: 100px;
            
        }
        .auto-style6 {
            height: 50px;
        }
        .auto-style7 {
            width: 90px;
            height: 50px;
        }
        .auto-style8 {
            width: 200px;
            height: 50px;
        }
        .auto-style9 {
            width: 140px;
            height: 50px;
        }
        .auto-style10 {
            width: 375px;
            height: 50px;
        }
        .auto-style11 {
            width: 150px;
            height: 50px;
        }
        .auto-style12 {
            width: 75px;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontent" Runat="Server">
        <center><h1><u>Profile</u></h1></center>
        <table cellpadding="10" align="center" style="margin-top:0px; font-size:20px ">
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style7" >
                    Name:
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style8" >                    
                    <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style9">
                    Email :
                </td>
                <td colspan="3" style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style10" >
                    <asp:Label ID="Textemail" runat="server" Text=""></asp:Label>
                </td>
                <td rowspan="5" >
                    <asp:Image ID="userimg" runat="server" class="auto-style5" ImageUrl="~/userimage/default.png" Height="150px" Width="120px" />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Username:
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style6" >                    
                    <asp:Label ID="username" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Aadhar Card:
                </td>
                <td colspan="3" style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style6" >
                    <asp:Label ID="aadharno" runat="server" Text=""></asp:Label>
                </td>    
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Birthday:   
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style6" > 
                    <asp:Label ID="birthday" runat="server" Text="Label"></asp:Label>   
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Pan Card:
                </td>
                <td colspan="3" style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style6" >
                    <asp:Label ID="panno" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Gender:
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style6" >                    
                    <asp:Label ID="gender" runat="server" Text="Label"></asp:Label>                  
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Passport:    
                </td>            
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style11" > 
                    <asp:Label ID="passportno" runat="server" Text=""></asp:Label> 
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style12" >
                    Expiary:
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style11" > 
                    <asp:Label ID="passportexp" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Mobile:
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style6" >                     
                    <asp:Label ID="mobile" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style6" >
                    Driving Licence:
                </td>
                <td  style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style11" > 
                    <asp:Label ID="dlno" runat="server" Text=""></asp:Label>
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="auto-style12" >
                    Expiary:
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="auto-style11" > 
                    <asp:Label ID="dlexp" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Address:
                </td>
                <td colspan="6" style="font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >                    
                    <asp:Label ID="Textaddress" runat="server" TextMode="MultiLine" Height="50px" Width="300px" ></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>

