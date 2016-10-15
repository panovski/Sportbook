<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NaslovnaVesti.ascx.cs" Inherits="NaslovnaVesti" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>

<table cellpadding="5" cellspacing="0" class="style1">
    <tr>
        <td>
            <asp:Label ID="lblNaslov" runat="server" Text="Naslov"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
<asp:SqlDataSource ID="DS" runat="server"></asp:SqlDataSource>

