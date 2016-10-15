<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="PromeniMeni.aspx.cs" Inherits="Account_Login" %>

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
        .style13
        {
            text-align: left;
        }
        .style14
        {}
        .style17
        {
            margin-top: 0;
            margin-bottom: 3px;
        }
        .style19
        {
            width: 238px;
        }
        .style20
        {
            text-decoration: underline;
        }
        .style21
        {
            text-align: right;
            width: 238px;
        }
        .style22
        {
            width: 240px;
        }
        .style23
        {
            text-align: right;
            width: 238px;
            height: 22px;
            font-size: small;
        }
        .style24
        {
            width: 240px;
            height: 22px;
        }
        .style25
        {
            width: 12px;
            height: 22px;
        }
        .style26
        {
            height: 22px;
        }
        .style27
        {
            text-align: right;
            width: 238px;
            font-size: small;
        }
        .style28
        {
            width: 238px;
            font-size: small;
        }
        .style29
        {
            font-size: x-small;
        }
        .style30
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            color: #666666;
        }
        .style31
        {
            font-size: x-small;
            color: #CC0000;
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
        <asp:Panel ID="pnlPromeniMeni" runat="server" style="text-align: left" 
            Visible="False">
            <table class="style10" 
                style="margin: 10px; padding: 10px; font-family: Arial, Helvetica, sans-serif; color: #808080;">
                <tr>
                    <td class="style11">
                        <asp:LinkButton ID="lbAdmin" runat="server" PostBackUrl="~/Login.aspx" 
                            style="color: #666666">Администраторски панел</asp:LinkButton>
                        <strong>&nbsp; </strong>&gt;<strong>&nbsp; Промени мени<br /> </strong>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                                <table class="style10">
                                    <tr>
                                        <td class="style19">
                                            <p class="style17">
                                                Главно мени:</p>
                                        </td>
                                        <td class="style22">
                                            <p class="style17">
                                                Подмени:</p>
                                        </td>
                                        <td class="style14">
                                            <p class="style17">
                                                Сите останати подменија:</p>
                                        </td>
                                        <td>
                                            <p class="style17">
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style19">
                                            <asp:ListBox ID="lbGlavnoMeni" runat="server" AutoPostBack="True" 
                                                CssClass="ListBox" DataSourceID="DSGlavnoMeni" DataTextField="Tekst" 
                                                DataValueField="Meni_Id" Height="206px" 
                                                onselectedindexchanged="lbGlavnoMeni_SelectedIndexChanged" 
                                                style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #666666" 
                                                Width="202px"></asp:ListBox>
                                            <br />
                                            <asp:ImageButton ID="GlavnoUp" runat="server" Enabled="False" 
                                                ImageUrl="~/up.png" onclick="GlavnoUp_Click" Width="20px" />
                                            &nbsp;<asp:ImageButton ID="GlavnoDown" runat="server" Enabled="False" 
                                                ImageUrl="~/down.png" onclick="GlavnoDown_Click" 
                                                style="text-align: right; height: 20px" Width="20px" />
                                            <asp:SqlDataSource ID="DSGlavnoMeni" runat="server"></asp:SqlDataSource>
                                        </td>
                                        <td class="style22">
                                            <asp:ListBox ID="lbPodmeni" runat="server" AutoPostBack="True" 
                                                CssClass="ListBox" DataSourceID="DSPodmeni" DataTextField="Tekst" 
                                                DataValueField="Meni_Id" Height="206px" 
                                                onselectedindexchanged="lbPodmeni_SelectedIndexChanged" 
                                                style="color: #666666; font-size: small; font-family: Arial, Helvetica, sans-serif" 
                                                Width="202px"></asp:ListBox>
                                            <br />
                                            <asp:ImageButton ID="VtoroUp" runat="server" Enabled="False" 
                                                ImageUrl="~/up.png" onclick="VtoroUp_Click" Width="20px" />
                                            &nbsp;<asp:ImageButton ID="VtoroDown" runat="server" Enabled="False" 
                                                ImageUrl="~/down.png" onclick="VtoroDown_Click" style="text-align: right" 
                                                Width="20px" />
                                            <asp:SqlDataSource ID="DSPodmeni" runat="server"></asp:SqlDataSource>
                                        </td>
                                        <td class="style14">
                                            <asp:ListBox ID="lbSitePodmenija" runat="server" AutoPostBack="True" 
                                                CssClass="ListBox" DataSourceID="DSSitePodmenija" DataTextField="Tekst" 
                                                DataValueField="Meni_Id" Height="206px" 
                                                onselectedindexchanged="lbSitePodmenija_SelectedIndexChanged" 
                                                style="color: #666666; font-size: small; font-family: Arial, Helvetica, sans-serif" 
                                                Width="202px"></asp:ListBox>
                                            <br />
                                            <asp:ImageButton ID="TretoUp" runat="server" Enabled="False" 
                                                ImageUrl="~/up.png" onclick="TretoUp_Click" Width="20px" />
                                            &nbsp;<asp:ImageButton ID="TretoDown" runat="server" Enabled="False" 
                                                ImageUrl="~/down.png" onclick="TretoDown_Click" style="text-align: right" 
                                                Width="20px" />
                                            <asp:SqlDataSource ID="DSSitePodmenija" runat="server"></asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style19" 
                                            style="border-bottom-style: dotted; border-width: 1px; border-color: #808080">
                                            <asp:SqlDataSource ID="DSCeloMeni" runat="server"></asp:SqlDataSource>
                                        </td>
                                        <td class="style22" 
                                            style="border-bottom-style: dotted; border-width: 1px; border-color: #808080">
                                            &nbsp;</td>
                                        <td class="style14" 
                                            style="border-bottom-style: dotted; border-width: 1px; border-color: #808080">
                                            <br />
                                        </td>
                                        <td style="border-bottom-style: dotted; border-width: 1px; border-color: #808080">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style20" colspan="2">
                                            <strong>
                                            <br />
                                            Промени / додади / избриши ставка од мени:</strong></td>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style28" style="text-align: right" valign="top">
                                            Текст на менито:</td>
                                        <td class="style22" valign="top">
                                            <asp:TextBox ID="tbPromeniTekst" runat="server" CssClass="style30" 
                                                Width="210px"></asp:TextBox>
                                        </td>
                                        <td class="style14" valign="top">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="tbPromeniTekst" ErrorMessage="Задолжително поле!" 
                                                Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" ForeColor="Red" 
                                                ValidationGroup="1" Width="200px"></asp:RequiredFieldValidator>
                                        </td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style27" valign="top">
                                            Опис на менито:</td>
                                        <td class="style22" valign="top">
                                            <asp:TextBox ID="tbPromeniOpis" runat="server" CssClass="style30" Height="55px" 
                                                TextMode="MultiLine" Width="210px"></asp:TextBox>
                                        </td>
                                        <td class="style14" valign="top">
                                            <asp:TextBox ID="tbSelected_Id" runat="server" CssClass="style30" 
                                                Visible="False" Width="46px"></asp:TextBox>
                                        </td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style27" valign="top">
                                            Слика за менито:</td>
                                        <td class="style22" valign="top">
                                            <asp:FileUpload ID="fuPromeniSlika" runat="server" CssClass="style30" 
                                                Width="207px" />
                                            <asp:Panel ID="pnlPostoeckaSlika" runat="server" Visible="False">
                                                <span class="style29">Постоечка слика:<br />
                                                <asp:Image ID="SlikaMeni" runat="server" Height="49px" Width="49px" />
                                                &nbsp;
                                                </span>
                                                <asp:ImageButton ID="imgIzbrisiSlika" runat="server" 
                                                    ImageUrl="~/Images/wrong.png" onclick="imgIzbrisiSlika_Click" 
                                                    onclientclick="javascript:return confirm('Дали сте сигурни за бришење на сликата?');" />
                                                <span class="style31">&nbsp;Избриши</span></asp:Panel>
                                        </td>
                                        <td class="style14" valign="top">
                                            &nbsp;</td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style23" valign="top">
                                            Подмени:</td>
                                        <td class="style24" valign="top">
                                            <asp:DropDownList ID="ddlPromeniPodmeni" runat="server" 
                                                DataSourceID="DSCeloMeni" DataTextField="Tekst" DataValueField="Meni_Id" 
                                                style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #666666" 
                                                Width="210px">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="style25" valign="top">
                                            &nbsp;</td>
                                        <td class="style26" valign="top">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style23" valign="top">
                                            <asp:CheckBox ID="cbStranica" runat="server" Checked="True" 
                                                Text="Дали да отвара страница?" TextAlign="Left" />
                                        </td>
                                        <td class="style24" valign="top">
                                            &nbsp;</td>
                                        <td class="style25" valign="top">
                                            &nbsp;</td>
                                        <td class="style26" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style21" valign="top">
                                            &nbsp;</td>
                                        <td class="style22" valign="top">
                                            &nbsp;</td>
                                        <td class="style14" colspan="2" valign="top">
                                            &nbsp;<asp:Button ID="btnPromeni" runat="server" CssClass="ButtonBlue" 
                                                onclick="btnPromeni_Click" 
                                                onclientclick="javascript:return confirm('Дали сте сигурни за промена на менито?');" 
                                                Text="Промени" ValidationGroup="1" />
                                            &nbsp;<asp:Button ID="btnDodadi" runat="server" CssClass="ButtonBlue" 
                                                onclick="btnDodadi_Click" 
                                                onclientclick="javascript:return confirm('Дали сте сигурни за додавање на ставка?');" 
                                                Text="Додади" Width="81px" ValidationGroup="1" />
                                            &nbsp;<asp:Button ID="btnIzbrisi" runat="server" CssClass="ButtonBlue" 
                                                onclick="btnIzbrisi_Click" 
                                                onclientclick="javascript:return confirm('Дали сте сигурни за бришење на ставката од менито?');" 
                                                Text="Избриши" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style21" 
                                            style="border-bottom-style: dotted; border-width: 1px; border-color: #808080" 
                                            valign="top">
                                            &nbsp;</td>
                                        <td class="style22" 
                                            style="border-bottom-style: dotted; border-width: 1px; border-color: #808080" 
                                            valign="top">
                                            &nbsp;</td>
                                        <td class="style14" 
                                            style="border-bottom-style: dotted; border-width: 1px; border-color: #808080" 
                                            valign="top">
                                            &nbsp;</td>
                                        <td style="border-bottom-style: dotted; border-width: 1px; border-color: #808080" 
                                            valign="top">
                                            &nbsp;</td>
                                    </tr>
                                </table>

                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

