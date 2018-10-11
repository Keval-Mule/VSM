<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="VSM.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-3"></div>
        <div class="col-xs-10  col-sm-10 col-md-6">
            <asp:Label ID="lblMobileNo" style="text-align:left;" class="control-label col-sm-12 col-md-5 col-xs-12" runat="server" Text="Mobile No :"></asp:Label>
        &nbsp;&nbsp;
            <asp:TextBox ID="txtBoxMobileNo" class="col-xs-12 col-sm-12 col-md-5"  runat="server"></asp:TextBox>
        </div>
        <div class="col-xs-1  col-md-3"></div>
    </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtBoxMobileNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />    
    <br />
    <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-3"></div>
        <div class="col-xs-10 col-sm-10 col-md-6">
            <asp:Label ID="lblPswd"  style="text-align:left;" class="control-label col-sm-12 col-md-5 col-xs-12" runat="server" Text="Password :"></asp:Label>
        &nbsp;&nbsp;
            <asp:TextBox ID="txtBoxPswd"  class="col-xs-12 col-sm-12 col-md-5" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="col-xs-1  col-md-3"></div>
    </div>
    <br />
<br />
    <div class="row col-xs-12 col-sm-12 col-md-12">
        <div class="col-xs-4 col-sm-5 col-md-5"></div>
        <asp:Button ID="btnLogin" runat="server"  class="col-xs-6 col-sm-2 col-md-2 btn btn-primary"  onclick="btnLogin_Click" 
    Text="Login" />
        <div class="col-xs-3 col-sm-5  col-md-5"></div>
    </div>
<br />
<br />
</asp:Content>
