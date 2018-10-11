<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Upload_database.aspx.cs" Inherits="VSM.Upload_database" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
    <br />
    <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />

        <table align="center" class="style1">
            <tr>
                <td align="center">
                    <asp:LinkButton ID="insertdata" runat="server" onclick="insertdata_Click">Insert Data</asp:LinkButton>
                </td>
                <td align="center">
                    <asp:LinkButton ID="viewdata" runat="server" onclick="viewdata_Click">View Data</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="9" align="center">
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
                
            </tr>
             <tr>
                <td colspan="9" align="center">
                    <asp:Label ID="lblmsg" runat="server" Width="500px"></asp:Label>
                 </td>
                
            </tr>
        </table>

</asp:Content>
