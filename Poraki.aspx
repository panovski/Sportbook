<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Copy of Statistika.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="Scripts/Pop.js" type="text/javascript"></script>
    <style type="text/css">
        .style3
        {
            width: 100%;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: 700;
            color: #FFFFFF;
        }
        .style4
        {
            text-align: left;
        }
        .style5
        {
            width: 179px;
            height: 40px;
        }
        .style6
        {
            width: 109px;
            text-align: right;
            font-weight: normal;
        }
        .style7
        {
            color: #666666;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style8
        {
            text-align: center;
        }
        .style9
        {
            width: 16px;
            height: 16px;
        }
        .style10
        {
            width: 100%;
        }
        .style11
        {
            text-decoration: underline;
        }
        .style12
        {
            width: 21px;
            font-size: small;
            text-align: center;
        }
        .style13
        {
        }
        .style14
        {
            font-size: small;
            text-align: right;
        }
        .style16
        {
            font-size: small;
            text-align: center;
            width: 34px;
        }
        .style17
        {
            color: #666666;
            font-family: Arial, Helvetica, sans-serif;
            width: 81px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="DivGlaven" class="DivBloks" 
                                    
        style="padding: 10px; width: 860px; z-index: 1;" align="center">
        <br />
        <asp:Panel ID="pnlNajava" runat="server" Visible="False">
        <br />
            <br />
            <br />
            <br />
&nbsp;<div ID="DivGlaven0" class="DivBloksLogin" 
                style="padding: 10px; width: 530px; z-index: 1;">
                <table class="style3">
                    <tr>
                        <td class="style4">
                            <img class="style5" src="Images/logo-sb.jpg" />
                        </td>
                        <td class="style8">
                            Administrator Login</td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td class="style4">
                            <asp:Panel ID="pnlError" runat="server" Visible="False">
                                &nbsp;&nbsp;
                                <img class="style9" src="../Images/wrong.png" />
                                &nbsp;
                                <asp:Label ID="lblInfoNajava" runat="server" 
                                    style="font-size: small; color: #FF3300"></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style6">
                            User Name</td>
                        <td style="text-align: left">
                            <asp:TextBox ID="tbUserName" runat="server" CssClass="style7" Width="320px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style6">
                            Password</td>
                        <td style="text-align: left">
                            <asp:TextBox ID="tbLozinka" runat="server" CssClass="style7" 
                                style="text-align: left" TextMode="Password" Width="320px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td align="right" style="padding-right: 20px">
                            <br />
                            <asp:Button ID="btnLogin" runat="server" BackColor="#3B5998" 
                                BorderColor="#CCCCCC" ForeColor="White" onclick="btnLogin_Click" 
                                style="text-align: center; font-weight: 700" Text="Sign In" Width="88px" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <br />
            <br />
            <br />
            <br />
&nbsp;<br />
        </asp:Panel>
        <asp:Panel ID="pnlAdmin" runat="server" style="text-align: left" 
            Visible="False">
            <table class="style10" 
                style="margin: 10px; padding: 10px; font-family: Arial, Helvetica, sans-serif; color: #808080;">
                <tr>
                    <td class="style11" colspan="10">
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13" colspan="10" 
                        style="margin-left: 40px;">
                        <asp:Panel ID="Panel1" runat="server" style="text-align: left">
                            <span class="style11"><strong>Пораки:</strong></span><br class="style11" />
                            <br />
                            <table cellpadding="0" cellspacing="0" class="style6">
                                <tr>
                                    <td style="text-align: left" valign="top">
                                        Листа на пораки:</td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" valign="top">
                                        &nbsp;</td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" valign="top">
                                        <asp:ListBox ID="lstPoraki" runat="server" AutoPostBack="True" 
                                            BackColor="#E9E9E9" CssClass="ListBox" ForeColor="#333399" Height="168px" 
                                            onselectedindexchanged="lstPoraki_SelectedIndexChanged" 
                                            style="font-family: Calibri;" Width="373px"></asp:ListBox>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnIzbrisi" runat="server" CssClass="ButtonBlue" 
                                            ForeColor="White" onclick="btnIzbrisi_Click" 
                                            onclientclick="javascript:return confirm('Дали сте сигурни за бришење на пораката?');" 
                                            Text="Избриши" />
                                        &nbsp;<asp:Button ID="btnMarkiraj" runat="server" CssClass="ButtonBlue" 
                                            ForeColor="White" onclick="btnMarkiraj_Click" 
                                            Text="Маркирај како непрочитана" />
                                    </td>
                                    <td valign="top">
                                        <asp:Panel ID="pnlPoraka" runat="server" 
                                            style="font-family: Arial; font-size: small" Visible="False">
                                            <table style="width: 439px">
                                                <tr>
                                                    <td class="style17">
                                                        Име:</td>
                                                    <td class="style4">
                                                        <asp:Label ID="lblIme" runat="server" style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Е-mail:</td>
                                                    <td class="style4">
                                                        <asp:Label ID="lblMail" runat="server" style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        Дата:</td>
                                                    <td class="style4">
                                                        <asp:Label ID="lblData" runat="server" style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style17">
                                                        &nbsp;</td>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style17" valign="top">
                                                        Порака:</td>
                                                    <td class="DivBloks" 
                                                        style="border-color: #808080; padding: 5px; background-color: #F2F2F2; text-align: left;">
                                                        <asp:Label ID="lblTekst" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        &nbsp;</td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        &nbsp;</td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        &nbsp;</td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                            <br />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13" colspan="10">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style12" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;

                        <asp:Label ID="lblOdbrana" runat="server" ForeColor="White"></asp:Label>

                    </td>
                    <td align="center" class="style16" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="10">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </div>

     <script type="text/javascript">
         function CloseDialog() {
             window.returnValue = document.getElementById("<%=lblOdbrana.ClientID %>").innerHTML;
             window.close()            
         }
    </script>

</asp:Content>

