<%@ Page Title="" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            text-align: right;
            font-family: Calibri;
            color: #475F92;
        }
        .style4
        {
            font-family: Calibri;
            font-size: x-large;
            color: #475F92;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="DivBloks">
        <br />
        <span class="style4"><strong>&nbsp;&nbsp; Контакт</strong></span><strong><br 
            class="style4" />
        <br class="style4" />
        </strong>
        <table class="Mobile_Tabela_Glavna">
            <tr>
                <td class="style3" valign="top">
                    Име и презиме:</td>
                <td valign="middle">
                    <asp:TextBox ID="tbImePrezime" runat="server" ValidationGroup="2" Width="308px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbImePrezime" ErrorMessage="Задолжително!" 
                        style="font-family: Calibri; font-size: small; color: #CC0000" 
                        ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    Е-маил:</td>
                <td valign="middle">
                    <asp:TextBox ID="tbEmail" runat="server" ValidationGroup="2" Width="308px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbEmail" ErrorMessage="Задолжително!" 
                        style="font-family: Calibri; font-size: small; color: #CC0000" 
                        ValidationGroup="2"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="tbEmail" ErrorMessage="Погрешен формат!" 
                        style="font-family: Calibri; font-size: small; color: #CC0000" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="2"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    Порака:</td>
                <td valign="middle">
                    <asp:TextBox ID="tbPoraka" runat="server" Height="183px" TextMode="MultiLine" 
                        Width="460px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="tbPoraka" ErrorMessage="Задолжително!" 
                        style="font-family: Calibri; font-size: small; color: #CC0000" 
                        ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    &nbsp;</td>
                <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIsprati" runat="server" CssClass="ButtonBlue" Height="34px" 
                        onclick="btnIsprati_Click" Text="Испрати" ValidationGroup="2" Width="91px" />
                </td>
            </tr>
            <tr>
                <td class="style3" valign="top">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblInfo" runat="server" 
                        style="font-family: Calibri; color: #CC0000; font-weight: 700; font-size: medium"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>

