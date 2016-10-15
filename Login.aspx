<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            text-align: center;
        }
        .style16
        {
            font-size: small;
            text-align: center;
            width: 107px;
        }
        .style17
        {
            font-size: small;
        }
        .style22
        {
            font-size: small;
            text-align: center;
            width: 103px;
        }
        .style25
        {
            width: 9px;
            font-size: small;
            text-align: center;
        }
        .style27
        {
            font-size: small;
            width: 25px;
        }
        .style29
        {
            font-size: small;
            text-align: center;
            width: 102px;
        }
        .style37
        {
            width: 107px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="DivGlaven" class="DivBloks" 
                                    
        style="padding: 10px; width: 885px; z-index: 1;" align="center">
        <br />
        <asp:Panel ID="pnlNajava" runat="server" Visible="False" DefaultButton="btnLogin">
        <br />
            <br />
            <br />
            <br />
&nbsp;
            <div ID="DivGlaven0" class="DivBloksLogin" 
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
                
                style="margin: 10px 16px 10px 10px; padding: 10px; font-family: Arial, Helvetica, sans-serif; color: #808080;">
                <tr>
                    <td class="style11" colspan="7">
                        <strong>Администраторски панел<br /> </strong>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13" colspan="7">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style8" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlKreirajVest" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnKreirajVest" runat="server" BorderStyle="None" 
                                CssClass="style17" Height="95px" ImageUrl="~/Images/kreiraj_vest.png" 
                                PostBackUrl="~/KreirajVest.aspx" Width="98px" />
                            <br class="style17" />
                            <span class="style17">Креирај вест</span></asp:Panel>
                    </td>
                    <td class="style37" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlAktivirajVest" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            
                            <asp:Panel ID="pnlNeaktivniBroj" runat="server" CssClass="pnlNeaktivniVesti" 
                 HorizontalAlign="Center">
                 <asp:Label ID="lblNeaktivniBroj" runat="server" 
    Text="99" Font-Bold="True" ForeColor="White" 
                     style="font-family: Arial; font-size: small"></asp:Label>
             </asp:Panel>

             <asp:Panel ID="pnlPorakiBroj" runat="server" CssClass="pnlPorakiBroj" 
                HorizontalAlign="Center">
                <asp:Label ID="lblPorakiBroj" runat="server" Font-Bold="True" ForeColor="White" 
                    style="font-family: Arial; font-size: small" Text="99"></asp:Label>
            </asp:Panel>

                            <asp:ImageButton ID="ibtnNeaktivni" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/InactiveDocument.png" 
                                PostBackUrl="~/NeaktivniVesti.aspx" Width="98px" />
                            <br />
                            <span class="style17">Неактивни вести</span></asp:Panel>
                    </td>
                    <td class="style22" 
                        style="padding-right: 5px; padding-left: 5px;">
                             
                             

                        <asp:Panel ID="pnlVestiVoIdnina" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Width="110px">
                            <asp:Panel ID="pnlVestiVoIdninaBroj" runat="server" 
                CssClass="pnlVestiVoIdinaBroj" HorizontalAlign="Center">
                <asp:Label ID="lblVestiVoIdinaBroj" runat="server" Font-Bold="True" 
                    ForeColor="White" style="font-family: Arial; font-size: small" Text="99"></asp:Label>
            </asp:Panel>
                            <asp:ImageButton ID="ibtnVestiVoIdnina" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/VestiVoIdnina.png" 
                                PostBackUrl="~/VestiVoIdnina.aspx" Width="98px" />
                            <br />
                            Вести што ќе се објават во иднина
                            
                            </asp:Panel>

                    </td>
                    <td class="style25" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlSliki" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Width="110px">
                            <asp:ImageButton ID="ibtnSliki" runat="server" CssClass="style17" Height="95px" 
                                ImageUrl="~/Images/Folder_Images.png" PostBackUrl="~/Site_Sliki.aspx" 
                                Width="98px" />
                            <br />
                            Преглед на сите внесени слики</asp:Panel>
                    </td>
                    <td class="style27" 
                        style="padding-right: 5px; padding-left: 5px; text-align: center;">
                        <asp:Panel ID="pnlReklami" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnSliki0" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/Reklami.png" PostBackUrl="~/Reklami.aspx" 
                                Width="98px" />
                            <br />
                            Реклами</asp:Panel>
                    </td>
                    <td class="style29" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlPozadini" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnPozadini" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/Wallpapers.png" 
                                PostBackUrl="~/PozadinaEdit.aspx" Width="98px" />
                            <br />
                            Позадини</asp:Panel>
                    </td>
                    <td class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlPromeniMeni" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnPromeniMeni" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/promeni_meni.png" 
                                PostBackUrl="~/PromeniMeni.aspx" Width="98px" />
                            <br />
                            <span class="style17">Промени мени</span></asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style12" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlKorisnici" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnKorisnici" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/ListOfUsers.png" PostBackUrl="~/Korisnik.aspx" 
                                Width="98px" />
                            <br />
                            <span class="style17">Корисници</span></asp:Panel>
                    </td>
                    <td align="center" class="style16" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <br />
                        <asp:Panel ID="pnlKorisnickiNivoa" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnKorisnikNivo" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/UserPrivilegii.png" 
                                PostBackUrl="~/KorisnikNivo.aspx" Width="98px" />
                            <br />
                            Кориснички нивоа</asp:Panel>
                        <br />
                    </td>
                    <td align="center" class="style22" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlPromeniLozinka" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Width="110px">
                            <asp:ImageButton ID="ibtnPromeniPassword" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/ChangePassword.png" 
                                PostBackUrl="~/PromeniLozinka.aspx" Width="98px" />
                            <br />
                            Промени лозинка</asp:Panel>
                    </td>
                    <td align="center" class="style25" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlStatistics" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Width="110px" 
                            Visible="False">
                            <asp:ImageButton ID="ibtnStatistics" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/ic_Statistics.png" 
                                PostBackUrl="~/Statistika.aspx" Width="98px" />
                            <br />
                            Статистика</asp:Panel>
                    </td>
                    <td align="center" class="style27" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <asp:Panel ID="pnlPoraki" runat="server" BorderColor="Silver" 
                            BorderStyle="Dotted" BorderWidth="1px" Height="135px" Visible="False" 
                            Width="110px">
                            <asp:ImageButton ID="ibtnPoraki" runat="server" CssClass="style17" 
                                Height="95px" ImageUrl="~/Images/ic_Mail.png" PostBackUrl="~/Poraki.aspx" 
                                Width="98px" />
                            <br />
                            Пораки</asp:Panel>
                    </td>
                    <td align="center" class="style29" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                    <td align="center" class="style14" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="7">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
    </div>
</asp:Content>

