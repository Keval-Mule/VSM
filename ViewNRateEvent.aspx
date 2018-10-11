<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewNRateEvent.aspx.cs" Inherits="VSM.ViewNRateEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <asp:Label ID="lblEmpName" runat="server" Text="Label"></asp:Label>
            <cc1:toolkitscriptmanager ID="ToolkitScriptManager1" runat="server" />
        </div>
        <div class="panel-body">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" 
                onclick="Button1_Click" Text="Go Back" />
            <br />
            <asp:GridView ID="gvFruits" CssClass="panel-body" runat="server" 
                AutoGenerateColumns="false" DataKeyNames="id"
                HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="EventName" HeaderText="Event Name" />
                    <asp:TemplateField HeaderText="Ratings">
                        <ItemTemplate>
                            <cc1:Rating ID="Rating1" AutoPostBack="true" OnChanged="OnRatingChanged" runat="server"
                                StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                FilledStarCssClass="FilledStar" CurrentRating='<%# Eval("Rating") %>'>
                            </cc1:Rating>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
