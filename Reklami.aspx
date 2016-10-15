<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Reklami.aspx.cs" Inherits="Account_Login" %>

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
            text-align: center;
        }
        .style16
        {
            font-size: small;
            text-align: center;
            width: 34px;
        }
        .style44
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style45
        {
            font-size: small;
        }
        .style46
        {
            width: 100%;
            border: 1px solid #808080;
        }
        .style47
        {
            width: 377px;
            font-weight: bold;
            font-size: small;
            background-color: #CCCCCC;
        }
        .style49
        {
            height: 25px;
        }
        .style50
        {
            width: 377px;
            text-align: left;
            height: 25px;
        }
        .style51
        {
            width: 153px;
        }
        .style52
        {
            height: 25px;
            width: 153px;
        }
        .style53
        {
            width: 69px;
        }
        .style54
        {
            height: 25px;
            width: 69px;
        }
        .style55
        {
            width: 377px;
            text-align: left;
        }
        .style56
        {
            font-weight: bold;
            font-size: small;
            background-color: #CCCCCC;
        }
        .style57
        {
            width: 153px;
            font-weight: bold;
            font-size: small;
            background-color: #CCCCCC;
        }
        .style58
        {
            width: 69px;
            font-weight: bold;
            font-size: small;
            background-color: #CCCCCC;
        }
        .style59
        {
            color: #000000;
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
                        Панели со реклами:</td>
                </tr>
                <tr>
                    <td align="center" class="style13" colspan="10" 
                        style="border: 1px solid #C0C0C0">
                        <table class="style46" style="border: 1px solid #C0C0C0">
                            <tr class="style59">
                                <td class="style58">
                                    Број на панела:</td>
                                <td class="style47">
                                    Опис каде се наоѓа рекламата</td>
                                <td class="style57">
                                    Дали да ја прикажува (Видлива)</td>
                                <td class="style56">
                                    Линк до промена на рекламата</td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    1</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Двете реклами под SlideShow</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela1" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <span class="style45">
                                    <asp:LinkButton ID="lbReklama1" runat="server" onclick="lbReklama1_Click">Лева реклама</asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:LinkButton ID="lbReklama2" runat="server" onclick="lbReklama2_Click">Десна реклама</asp:LinkButton>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    2</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Првата реклама најдесно странично</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela2" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama3" runat="server" onclick="lbReklama3_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    3</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Втората реклама најдесно странично</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela3" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama4" runat="server" onclick="lbReklama4_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style54" style="border: 1px solid #C0C0C0">
                                    4</td>
                                <td class="style50" style="border: 1px solid #C0C0C0">
                                    Третата реклама најдесно странично</td>
                                <td class="style52" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela4" runat="server" Text="Да" />
                                </td>
                                <td class="style49" style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama5" runat="server" onclick="lbReklama5_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    5</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Најдолу лево (под вестите)</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela5" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama6" runat="server" onclick="lbReklama6_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    6</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Прва реклама во средина - малечка</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela6" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama7" runat="server" onclick="lbReklama7_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    7</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Втора реклама во средина - малечка</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela7" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama8" runat="server" onclick="lbReklama8_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    8</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Трета реклама во средина - малечка</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela8" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama9" runat="server" onclick="lbReklama9_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    9</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    Најгоре најглавната најдолга реклама</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela9" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama10" runat="server" onclick="lbReklama10_Click">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    10</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela10" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama11" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    11</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela11" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama12" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    12</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela12" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama13" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    13</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela13" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama14" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    14</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela14" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama15" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    15</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela15" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama16" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    16</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela16" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama17" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    17</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela17" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama18" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    18</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela18" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama19" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    19</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela19" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama20" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style53" style="border: 1px solid #C0C0C0">
                                    20</td>
                                <td class="style55" style="border: 1px solid #C0C0C0">
                                    &nbsp;</td>
                                <td class="style51" style="border: 1px solid #C0C0C0">
                                    <asp:CheckBox ID="cbPanela20" runat="server" Text="Да" />
                                </td>
                                <td style="border: 1px solid #C0C0C0">
                                    <asp:LinkButton ID="lbReklama21" runat="server">Реклама</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
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
                        <asp:Button ID="btnPromeniVidlivo" runat="server" CausesValidation="False" 
                            CssClass="style44" onclick="btnPromeniVidlivo_Click" 
                            onclientclick="javascript:return confirm('Дали сте сигурни?');" Text="Промени" 
                            Width="90px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="10">
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

     <script type="text/javascript">
         function CloseDialog() {
             window.returnValue = document.getElementById("<%=lblOdbrana.ClientID %>").innerHTML;
             window.close()            
         }
    </script>

</asp:Content>

