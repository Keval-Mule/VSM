<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="VSM.RegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="col-md-3 col-sm-1"></div>
        <div class="col-xs-12 col-sm-10 col-md-6">
            <h2 class="jumbotron">Register Yourself to get started..!</h2>
            <table class="col-xs-12 col-md-12">
                <tr>                    
                    <td style="">
                        <asp:Label ID="lblName" CssClass="col-xs-12 col-md-6" runat="server" Text="Name :"></asp:Label>
                        <asp:TextBox ID="txtBoxName" CssClass="col-xs-12 col-md-6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtBoxName" ErrorMessage="*" ForeColor="Red"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>                        
                    <td style="">
                        <asp:Label ID="lblMobileNo" CssClass="col-xs-12 col-md-6" runat="server" Text="Mobile No :"></asp:Label></th>
                        <asp:TextBox ID="txtBoxMobileNo" CssClass="col-xs-12 col-md-6" runat="server" TextMode="Phone"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtBoxMobileNo" ErrorMessage="*" ForeColor="Red"
                            ValidationExpression="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtBoxMobileNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td style="">
                        <asp:Label ID="lblEmailId" CssClass="col-xs-12 col-md-6" runat="server" Text="Email Id:"></asp:Label>
                        <asp:TextBox ID="txtBoxEmailId" CssClass="col-xs-12 col-md-6" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="">
                        <asp:Label ID="lblDOB" CssClass="col-xs-12 col-md-6" runat="server" Text="Year of Birth :"></asp:Label>
                        <asp:TextBox ID="txtBoxDOB" CssClass="col-xs-12 col-md-6" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtBoxDOB" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr> </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblUserType" runat="server" CssClass="col-xs-12 col-md-6" Text="Register Myself as :"></asp:Label>
                        <br /><br />
                        <asp:RadioButton ID="RadioButtonVolunteer" CssClass="col-xs-6 col-md-3" runat="server" AutoPostBack="True"
                            GroupName="userType" Text="Volunteer" />

                        <asp:RadioButton ID="RadioButtonEmployee" CssClass="col-xs-6 col-md-3" runat="server" AutoPostBack="True"
                            GroupName="userType" Text="Employee" /></td>
                </tr>

                <tr>
                    <td style="">
                        <asp:Label ID="lblPswd" CssClass="col-xs-12 col-md-6" runat="server" Text="Create your Password :"></asp:Label>
                        <asp:TextBox ID="txtBoxPswd" CssClass="col-xs-12 col-md-6" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtBoxPswd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>
            <br />
            <div class="row col-xs-12 col-sm-12 col-md-12">
                <div class="col-xs-2 col-sm-4 col-md-4"></div>
                <asp:Button ID="btnRegister" runat="server" CssClass="col-xs-10 col-sm-4 col-md-4 btn btn-success" Text="Submit" OnClick="btnRegister_Click" />
                <div class="col-xs-2 col-sm-4 col-md-4"></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-1"></div>
    </div>
</asp:Content>
