<%@ Page Title="" Language="C#" MasterPageFile="~/MobileVersion/MobileMaster.master" AutoEventWireup="true" CodeFile="VestMobile.aspx.cs" Inherits="MobileVersion_DefaultMobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    .style2
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
    }
    .style3
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        color: #FFFFFF;
    }
        .style4
        {
            font-size: x-small;
            color: #808080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="lblNaslov" runat="server" 
                    
                    style="font-size: medium; font-weight: 700; color: #FFFFFF; background-color: #3B5998;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <span class="style4"><em>Објавена на : </em></span>
                <asp:Label ID="lblObjavenaNa" runat="server" 
                    style="font-size: x-small; color: #808080; font-style: italic"></asp:Label>
                <br />
                <asp:Label ID="lblSodrzina" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblTip" runat="server" 
                    style="font-size: x-small; color: #FFFFFF;"></asp:Label>
            </td>
        </tr>
    </table>
    
</asp:Content>

