<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="VSM.WelcomePage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Image ID="Image1" runat="server" Height="229px" 
    ImageUrl="~/images/from_where_i_sit_illustration_031013.jpg" Width="306px" />
<br />
<br />
<asp:Button ID="btnNewUser" CssClass="btn btn-success" runat="server" Text="New User?" 
        onclick="btnNewUser_Click" />
<br />
<br />
<asp:Button ID="btnLogin" CssClass="btn btn-success" runat="server" Text="Login" onclick="btnLogin_Click" />
</asp:Content>
