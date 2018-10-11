<%@ Page Title="" EnableEventValidation = "false"Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VolunteerRecord.aspx.cs" Inherits="VSM.VolunteerRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        myConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Name], [MobileNo], [EmailId], [DOB], [UserType], [Designation], [Interests], [organization_name] FROM [UserTable]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataSourceID="SqlDataSource1" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" 
                SortExpression="MobileNo" />
            <asp:BoundField DataField="EmailId" HeaderText="EmailId" 
                SortExpression="EmailId" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="UserType" HeaderText="UserType" 
                SortExpression="UserType" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" 
                SortExpression="Designation" />
            <asp:BoundField DataField="Interests" HeaderText="Interests" 
                SortExpression="Interests" />
            <asp:BoundField DataField="organization_name" HeaderText="organization_name" 
                SortExpression="organization_name" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>

   <br /><br />
    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Go Back" onclick="Button1_Click" />
    <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" 
        Text="Download" onclick="Button2_Click" />
</asp:Content>
