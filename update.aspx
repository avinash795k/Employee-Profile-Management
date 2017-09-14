<%@ Page Title="" Language="C#" MasterPageFile="~/Masterhead.master" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .column-style1 {
            width: 90px;
        }
        .column-style2 {
            width: 170px;
        }
        .column-style3 {
            width: 140px;
        }
        .column-style4 {
            width: 500px;
        }
        .auto-style5 {
            width: 80px;
            height: 100px;
            
        }
        .auto-style6 {
            
            margin-top: 2px;
        }
        .auto-style7 {
            
            margin-top: 2px;
        }
        .black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: black;
			z-index:1001;
			-moz-opacity: 0.8;
			opacity:.80;
			filter: alpha(opacity=80);
		}
		.white_content {
            background-color: #0099cc;
			display: none;
			position: absolute;
			top: 18%;
			left: 10%;
			width: 80%;
			height: 66%;
			border: 5px solid orange;
			z-index:1002;
			overflow: auto;
		}
    </style>
    <script type="text/javascript">
        function popup_Click() {
            document.getElementById("light").style.display = "block";
            document.getElementById("fade").style.display = "block";
        }           
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontent" Runat="Server">
        <center><h1><u>Manage Profiles</u></h1></center>
        <div id="light" class="white_content">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="Images/close.png" style="border :0px"  width="20px" align="right" height="20px"/></a>
        <table cellpadding="10" align="center" style="margin-top:0px; ">
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="column-style1" >
                    Name:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="column-style2" >                    
                    <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" class="column-style3">
                    Email :
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" class="column-style4" >
                    <asp:TextBox ID="Textemail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Textemail" ErrorMessage="Incorrect Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                
                </td>
                <td rowspan="3" >
                    <asp:Image ID="userimg" runat="server" class="auto-style5" ImageUrl="~/userimage/default.png" />
                    <br />
                    <asp:FileUpload ID="imgfile" runat="server" Width="236px" CssClass="auto-style7" onchange="this.form.submit();" />
                    <br />
                    <asp:Button ID="imgremove" runat="server" CssClass="auto-style6" Text="Remove" Width="70px" OnClick="remove" Visible="False" CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Username:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >                    
                    <asp:Label ID="username" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Aadhar Card:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >
                    <asp:TextBox ID="aadharno" PlaceHolder="Card NO" runat="server"></asp:TextBox>
                </td>    
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Birthday:   
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" > 
                    <asp:Label ID="birthday" runat="server" Text="Label"></asp:Label>   
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Pan Card:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >
                    <asp:TextBox ID="panno" PlaceHolder="Card NO" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Gender:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >                    
                    <asp:Label ID="gender" runat="server" Text="Label"></asp:Label>                  
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Passport:  
                </td>              
                <td colspan="2" style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" > 
                    <asp:TextBox ID="passportno" PlaceHolder="Card NO" runat="server"  ></asp:TextBox> 
                    <asp:Label ID="exppassport" runat="server" style="margin-left: 30px;" Text="Expiary:"></asp:Label>
                    <asp:TextBox ID="passportexp" runat="server" TextMode="date"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Enter both card no and expiary date of Passport" ForeColor="Red" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Mobile:
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >                     
                    <asp:Label ID="mobile" runat="server" Text="Label"></asp:Label>
                </td>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Driving Licence:
                </td>
                <td colspan="2"  style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" > 
                    <asp:TextBox ID="dlno" PlaceHolder="Card NO" runat="server" ></asp:TextBox>
                    <asp:Label ID="expdl" runat="server" style="margin-left: 30px;" Text="Expiary:"></asp:Label>
                    <asp:TextBox ID="dlexp" runat="server" TextMode="date" ></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Enter both card no and expiary date Driving Licence" ForeColor="Red" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: bold;" >
                    Address:
                </td>
                <td colspan="4" style="color:rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-weight: normal;" >                    
                    <asp:TextBox ID="Textaddress" runat="server" TextMode="MultiLine" Height="50px" Width="300px" ></asp:TextBox>
                </td>
            </tr>
        </table>
        <div align="center" style="margin-top:7px">
            <asp:Button ID="button_update" runat="server" Text="Update" Width="90px" OnClick="btnupdate" Height="30px" />
        </div>
        </div>
        <div id="fade" class="black_overlay"></div>
        <asp:Repeater ID="otherusers" runat="server" OnItemCommand="updation">            
            <HeaderTemplate>
                <table width="80%" cellpadding="5" align="center" style="margin-top:30px; border:1px solid black; font-size:30px " rules="all" border="1">
                    <tr>
                        <th scope="col" style="width: 10% ">
                            Id
                        </th>
                        <th scope="col" style="width: 35%">
                            Name
                        </th>
                        <th scope="col" style="width: 35%">
                            Username
                        </th>
                        <th scope="col" style="width: 20%">
                            Update
                        </th>

                    </tr>
            </HeaderTemplate>
        
            <ItemTemplate>
                    <tr>
                        
                        <td style="text-align:center;">
                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td style="text-align:center">
                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("name") %>' />
                        </td>
                        <td style="text-align:center">
                            <asp:Label ID="lblusername" runat="server" Text='<%# Eval("username") %>' />
                        </td>
                        <td style="text-align:center">
                            <asp:Button ID="otherupdate" runat="server" Text="Update" CommandName="btnotherupdate" CausesValidation="False" UseSubmitBehavior="False" />
                        </td>
                        
                    </tr>
            </ItemTemplate> 
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater> 
        
         <div align="center" style="margin-top:30px">
            <asp:Button ID="myupdate" runat="server" Text="Update Your Profile" OnClick="btnmyupdate" Height="30px" />
        </div>
</asp:Content>

