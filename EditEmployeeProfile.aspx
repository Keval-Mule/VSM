<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditEmployeeProfile.aspx.cs" Inherits="VSM.EditEmployeeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-xs-12 col-sm-12 col-md-12">
    <div class="col-md-3 col-sm-1"></div>
    <div class="col-xs-12 col-sm-10 col-md-6">
        <table class="col-xs-12 col-sm-12 col-md-12">
            <tr>
                <td>
                    <asp:Label ID="lblMobileNo" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server" Text="Mobile No :"></asp:Label>
                    <asp:TextBox ID="txtBoxMobileNo" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblEmailId" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server" Text="Email Id :"></asp:Label>
                    <asp:TextBox ID="txtuepeml" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label1" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server" Text="Password :"></asp:Label>
                    <asp:TextBox ID="txtuppswd" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server" MaxLength="5" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtuppswd" ErrorMessage="Please enter your password." 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lbldesig" runat="server" CssClass="col-xs-12 col-sm-12 col-md-6" Text="Designation :"></asp:Label>
                    <asp:TextBox ID="txtdesig" runat="server" CssClass="col-xs-12 col-md-6"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblngo" CssClass="col-xs-12 col-md-6 col-sm-12" runat="server" Text="NGO name :"></asp:Label>
                    <asp:TextBox ID="txtngo" CssClass="col-xs-12 col-sm-12 col-md-6" runat="server"></asp:TextBox>

                </td>
            </tr>

            <tr>
                <td>
                        <asp:Label ID="lblInterests" class="col-xs-12 col-sm-12 col-md-4" runat="server" Text="Interests :"></asp:Label>
                        <asp:CheckBoxList ID="CheckBoxListInterests" runat="server" RepeatColumns="3" CssClass="col-xs-12 col-sm-12 col-md-6">
                        <asp:ListItem Text='<img src="images/interests/health.jpg" width="100px" height="100px" />' Value="Health"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/education.png" width="100px" height="100px" />' Value="Education"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/women.png" width="100px" height="100px" />' Value="Women Empowerment"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/rural_dev.png" width="100px" height="100px" />' Value="Rural Development"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/no poverty.jpg" width="100px" height="100px" />' Value="Poverty"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/clean_water.png" width="100px" height="100px" />' Value="Clean Water"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/zero hunger.png" width="100px" height="100px" />' Value="Zero Hunger"></asp:ListItem>
                        <asp:ListItem Text='<img src="images/interests/child.png" width="100px" height="100px" />' Value="Child Rights"></asp:ListItem>
                        </asp:CheckBoxList>
                </td>
            </tr>

            </table>
        <br />
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-md-2 col-sm-4"></div>
            <div class="col-md-8 col-sm-6">
                <asp:Button ID="Button2" CssClass="col-xs-10 col-sm-12 col-md-3 btn btn-success" runat="server" Text="Go Back" 
                onclick="Button2_Click" /> &nbsp;&nbsp;
                <asp:Button ID="Button1" CssClass="col-xs-10 col-sm-12 col-md-3 btn btn-success" runat="server" Text="Update" onclick="Button1_Click" />
            </div>
            <div class="col-xs-2 col-sm-3 col-md-2"></div>
        </div>
    </div>
    <div class="col-md-3 col-sm-1"></div>
</div>
</asp:Content>
