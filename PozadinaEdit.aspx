<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="PozadinaEdit.aspx.cs" Inherits="Account_Login" %>

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
            font-size: small;
            text-align: center;
        }
        .style13
        {            text-align: left;
        }
        .style44
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style45
        {
            text-decoration: underline;
            font-size: x-large;
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
                    <td class="style45">
                        <strong>Промени позадина:<br /> </strong></td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        <div style="text-align: left">
                            <strong><span class="style11">
                            <br />
                            Прикачи позадина:</span><br />
                            <br />
                            Формат на позадината: (потребни димензии :
                            <asp:Label ID="lblWidth" runat="server"></asp:Label>
                            &nbsp;х
                            <asp:Label ID="lblHeight" runat="server"></asp:Label>
                            ) </strong><br />
                            <div style="text-align: center">
                            </div>
                            &nbsp;<asp:FileUpload ID="Upload" runat="server" CssClass="style44" />
                            <asp:Button ID="btnImportJPG" runat="server" CausesValidation="False" 
                                CssClass="style44" onclick="btnImportJPG_Click" 
                                onclientclick="javascript:return confirm('Дали сте сигурни за прикачување на слика?');" 
                                Text="Upload" Width="90px" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        Линк што ќе го отвара позадината:
                        <asp:TextBox ID="tbPozadinaUrl" runat="server" Width="305px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style12" 
                        style="padding-right: 5px; padding-left: 5px;">
                        <hr />
                        &nbsp;

                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList6" runat="server" BackColor="#CCCCCC" 
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                            CellSpacing="2" DataSourceID="DS_SiteSliki" Font-Bold="False" 
                            Font-Italic="False" Font-Overline="False" Font-Strikeout="False" 
                            Font-Underline="False" ForeColor="Black" GridLines="Both" 
                            HorizontalAlign="Center" RepeatColumns="5">
                            <AlternatingItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" 
                                VerticalAlign="Middle" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# "Handlers/SlikiPozadina.ashx?Id=" + Eval("Pozadina_Id") %>' 
                                    Width="150px" Height="120px" />
                                <br />
                                <asp:ImageButton ID="imgBtn_Odberi" runat="server" Height="16px" 
                                    ImageUrl="~/Images/Check.png" onclick="imgBtn_Odberi_Click" Width="22px" />
                                <asp:Label ID="lbl_Slika_Id" runat="server" ForeColor="White" 
                                    Text='<%# Eval("Pozadina_Id") %>'></asp:Label>
                                &nbsp;&nbsp;
                                <asp:Label ID="lbl_Aktivna" runat="server" ForeColor="White" 
                                    style="color: #808080; font-size: small;" 
                                    Text='<%# (Eval("Aktivna").ToString() == "1")? "Активна" : "" %>'></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:ImageButton ID="imgBtn_Izbrisi" runat="server" Height="16px" 
                                    ImageUrl="~/Images/delete.png" onclick="imgBtn_Izbrisi_Click" 
                                    onclientclick="javascript:return confirm('Дали сте сигурни за бришење на сликата?');" 
                                    Width="16px" />
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="DS_SiteSliki" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                            SelectCommand="SELECT * FROM [Pozadina]"></asp:SqlDataSource>
                    </td>
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

