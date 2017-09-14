<%@ Page Title="" Language="C#" MasterPageFile="~/Masterhead.master" AutoEventWireup="true" CodeFile="loginhome.aspx.cs" Inherits="loginhome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontent" Runat="Server">
        <div align="center" style="margin-top:40px">
            <asp:Label ID="welcomenote" runat="server" Text="WELCOME" Font-Size="XX-Large" Font-Names="Algerian"></asp:Label>
        </div>
        <div>
            <asp:Label ID="labeldate" runat="server" Text="date" Font-Size="X-Large"></asp:Label>
            <asp:Label ID="labelday" runat="server" Text="day" Font-Size="X-Large" style="float:right" ></asp:Label>
        </div>
        <div align="center" style="margin-top:60px">
            <asp:ImageButton ID="imgprofile" runat="server" style="border-radius: 50%" ImageUrl="~/userimage/default.png" BorderColor="Blue" BorderStyle="Double" Height="300px" Width="300px" OnClick="btnimgprofile" />   
            <h3><a style="color:inherit; text-decoration: none;" href="profile.aspx">Click for Profile</a></h3>
        </div>
</asp:Content>

