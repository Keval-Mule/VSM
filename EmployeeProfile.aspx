<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="VSM.EmployeeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-12 col-xs-12">
        <div class="col-sm-3 col-xs-3"></div>
        <div class="col-sm-6 col-xs-6">
            <asp:Label ID="lblEmpName" class="col-sm-12 col-xs-12" runat="server" Text="Employee Name"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnEditProfile" class="btn btn-primary col-sm-12 col-xs-12" runat="server" Text="Edit Profile" 
                onclick="btnEditProfile_Click" TabIndex="10" />
            <br />
            <br />
            <asp:Button ID="btnUpdate" class="btn btn-primary col-sm-12 col-xs-12" runat="server" onclick="btnUpdate_Click" 
                Text="Update/Delete event" />
            <br />
            <br />
            <asp:Button ID="btnAddNewEvent" class="btn btn-primary col-sm-12 col-xs-12" runat="server" Text="Add New Event" 
                onclick="btnAddNewEvent_Click" />
            <br />
            <br />
            <asp:Button ID="Button1" class="btn btn-primary col-sm-12 col-xs-12" runat="server" Text="View Volunteer Record" 
                onclick="Button1_Click" />
            <br />
        </div>
        <div class="col-sm-3 col-xs-3"></div>
    </div>
</asp:Content>
