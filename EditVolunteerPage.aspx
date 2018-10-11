<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditVolunteerPage.aspx.cs" Inherits="VSM.EditVolunteerPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-xs-1 col-sm-4 col-md-4"></div>
<table class="col-xs-10 col-sm-6 col-md-6">
    <tr>
        <td>
            <div class="col-xs-12 col-sm-12 col-md-3">
                <asp:Label ID="lblMobileNo" runat="server" CssClass="col-sm-8" Text="Mobile No :"></asp:Label>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6">
                <asp:TextBox ID="txtBoxMobileNo" CssClass="col-sm-8" runat="server" Enabled="False"></asp:TextBox>
            </div>
        </td>
    </tr>

    <tr>
        <td>
            <div class="col-xs-12 col-sm-12 col-md-3"><asp:Label ID="lblEmailId" CssClass="col-sm-8" runat="server" Text="Email Id :"></asp:Label></div>
            <div class="col-xs-12 col-sm-12 col-md-6"><asp:TextBox ID="txtupeml" CssClass="col-sm-8" runat="server" TextMode="Email"></asp:TextBox></div>

        </td>
    </tr>

    <tr>
        <td>
            <div class="col-xs-12 col-sm-12 col-md-3"><asp:Label ID="Label1" runat="server" CssClass="col-sm-8" Text="Password :"></asp:Label></div>
            <div class="col-xs-12 col-sm-12 col-md-6"><asp:TextBox ID="txtuppswd" CssClass="col-sm-8" runat="server" MaxLength="5" TextMode="Password"></asp:TextBox></div>
            <div class="col-xs-12 col-sm-12 col-md-4"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtuppswd" ErrorMessage="Please Enter your Password." 
                ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </td>
    </tr>

    <tr>
        <td>
		    <div class="col-xs-12 col-sm-12 col-md-3">
                   <asp:Label ID="lblInterests" CssClass="col-sm-8" runat="server" Text="Interests :"></asp:Label>
		    </div>
    	    <div class="col-xs-12 col-sm-12 col-md-6" style="">

                    <asp:CheckBoxList ID="CheckBoxListInterests" runat="server" RepeatColumns="3">
						        
                        <asp:ListItem Text='<img src="images/interests/health.jpg" width="100px" height="100px" />' Value="Health"></asp:ListItem>

						        
                        <asp:ListItem Text='<img src="images/interests/education.png" width="100px" height="100px" />' Value="Education"></asp:ListItem>

						        
                        <asp:ListItem Text='<img src="images/interests/women.png" width="100px" height="100px" />' Value="Women Empowerment"></asp:ListItem>

						        
                        <asp:ListItem Text='<img src="images/interests/rural_dev.png" width="100px" height="100px" />' Value="Rural Development"></asp:ListItem>
						
						        
                        <asp:ListItem Text='<img src="images/interests/no poverty.jpg" width="100px" height="100px" />' Value="Poverty"></asp:ListItem>

						        
                        <asp:ListItem Text='<img src="images/interests/clean_water.png" width="100px" height="100px" />' Value="Clean Water"></asp:ListItem>

						       
                        <asp:ListItem Text='<img src="images/interests/zero hunger.png" width="100px" height="100px" />' Value="Zero Hunger"></asp:ListItem>

						        
                        <asp:ListItem Text='<img src="images/interests/child.png" width="100px" height="100px" />' Value="Child Rights"></asp:ListItem>
                            
                    </asp:CheckBoxList>
						
            </div>
        </td>
    </tr>
</table>
<div class="col-md-2"></div>
    <br />
    <br />
    <br />
    <div class="col-md-12 col-sm-12">
    <asp:Button ID="Button2" class="btn btn-success" runat="server" Text="Go Back" 
        onclick="Button2_Click" /> &nbsp;&nbsp;
    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Update" onclick="Button1_Click" />
    </div>
</asp:Content>
