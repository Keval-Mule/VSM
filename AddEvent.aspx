<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="VSM.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-xs-12 col-sm-12 col-md-12" id="addEventContainer">
    <div class="col-md-3 col-sm-1"></div>
    <div class="col-xs-12 col-sm-10 col-md-6">
        <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label>
        <table class="col-xs-12 col-md-12">
            <tr>
                <td>
                    <asp:Label ID="Label1" CssClass="col-xs-12 col-md-6" runat="server" Text="Event Name:"></asp:Label>
                    <asp:TextBox ID="txtevnm" CssClass="col-xs-12 col-md-6" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtevnm" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label2" CssClass="col-xs-12 col-md-6" runat="server" Text="Event Date:"></asp:Label>
                    <asp:TextBox ID="txtevdt" CssClass="col-xs-12 col-md-6" runat="server" TextMode="Date"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtevdt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td><asp:Label ID="Label3" CssClass="col-xs-12 col-md-6" runat="server" Text="Event Location:"></asp:Label>
                    <asp:TextBox ID="txtevloc" CssClass="col-xs-12 col-md-6" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtevloc" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label5" CssClass="col-xs-12 col-sm-3 col-md-6" runat="server" Text="Event Category:"></asp:Label>
                    <asp:CheckBoxList ID="CheckBoxListInterests" runat="server" RepeatColumns="4">
						        
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

            <tr>
                <td><asp:Label ID="Label4" CssClass="col-xs-12 col-md-6" runat="server" Text="Event Description:"></asp:Label>
                    <asp:TextBox ID="txtevdesc" CssClass="col-xs-12 col-md-6" runat="server" TextMode="MultiLine"></asp:TextBox>

                </td>
            </tr>

        </table>
        <br />
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-1 col-md-0 col-sm-2"></div>

            <div class="col-xs-10 col-md-12 col-sm-8">
                <asp:Button ID="Button1" CssClass="col-xs-12 col-sm-4 col-md-4 btn btn-success" runat="server" Text="Add and Broadcast" onclick="Button1_Click" />

                <%--<asp:Label ID="test" CssClass="col-xs-12 col-sm-4 col-md-4 btn btn-success" runat="server" Text="Label"></asp:Label>--%>
            </div>

            <div class="col-xs-1 col-md-0 col-sm-3"></div>
         </div>
    </div>
    <div class="col-md-3 col-sm-1"></div>
</div>
</asp:Content>
