<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VolunteerProfile.aspx.cs" Inherits="VSM.VolunteerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid jumbotron">
        <asp:Label ID="lblVolunteerName" class="" runat="server" Text="Volunteer Name"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnEditProfile" class="btn btn-success" runat="server" Text="Edit Profile" 
            onclick="btnEditProfile_Click" />
        <br />
        <br />
        <asp:Button ID="btnUpdatePrvsEvent" class="btn btn-success" runat="server" Text="Rate Event" 
            onclick="btnUpdatePrvsEvent_Click" />
        <br />
        <br />
    </div>
</asp:Content>
