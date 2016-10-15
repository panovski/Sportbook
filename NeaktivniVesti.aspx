<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="NeaktivniVesti.aspx.cs" Inherits="Account_Login" %>

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
            width: 98px;
        }
        .style18
        {
            font-size: small;
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
                        Неактивни вести :<br /> </td>
                </tr>
                <tr>
                    <td align="center" class="style13" colspan="10" 
                        style="margin-left: 40px;">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" 
                            DataSourceID="DS_NeaktivniVesti" BackColor="White" BorderColor="#CCCCCC" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                            GridLines="Horizontal" Width="825px" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="Vest_Id" 
                                    SortExpression="Vest_Id" >
                                <HeaderStyle Width="1px" />
                                <ItemStyle ForeColor="White" Width="10px" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="15px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Naslov" HeaderText="Наслов" 
                                    SortExpression="Naslov" />
                                <asp:BoundField DataField="Datum_Objava" HeaderText="Датум објава" 
                                    SortExpression="Datum_Objava" >
                                   
                                <ItemStyle Width="20%" />
                                </asp:BoundField>
                                   
                                <asp:CommandField SelectText="Прегледај" ShowSelectButton="True">
                                <ItemStyle Width="50px" />
                                </asp:CommandField>
                                   
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#3B5998" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Left" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="DS_NeaktivniVesti" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" SelectCommand="SELECT CAST(0 AS BIT) AS CheckBox, Vest_Id, Naslov, Datum_Objava
FROM Vest WHERE f_Snimeno = 1 AND (f_Odobrena IS NULL or f_Odobrena = 0) ORDER BY Datum_Objava DESC"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="lblInfo" runat="server" style="color: #CC0000; font-weight: 700" 
                            Text="Во моментов нема неактивирани вести!" Visible="False"></asp:Label>
                        <br />
                        <asp:Panel ID="pnlVremeNaObjava" runat="server" Visible="False">
                            <table class="style10">
                                <tr>
                                    <td align="left" class="style18" valign="top">
                                        Време кога да се објави веста:</td>
                                    <td align="left" class="style17" valign="top">
                                        <asp:CheckBox ID="cbVednash" runat="server" AutoPostBack="True" Checked="True" 
                                            CssClass="style18" oncheckedchanged="cbVednash_CheckedChanged" Text="Веднаш" />
                                    </td>
                                    <td align="left" class="style13" valign="top">
                                        <asp:Panel ID="pnlPrikazDatum" runat="server" CssClass="style18" 
                                            HorizontalAlign="Left" style="text-align: left" Visible="False">
                                            датум:
                                            <asp:TextBox ID="tbDatum" runat="server" Enabled="False" ReadOnly="True" 
                                                Width="108px"></asp:TextBox>
                                            &nbsp;време:
                                            <asp:TextBox ID="tbVreme" runat="server" ToolTip="чч:мм" Width="47px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="validVreme" runat="server" 
                                                ControlToValidate="tbVreme" ErrorMessage="Невалиднo на време! Пр. ЧЧ:ММ" 
                                                style="font-size: small; color: #CC0000; font-style: italic" 
                                                ValidationExpression="^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$"></asp:RegularExpressionValidator>
                                            <br />
                                            <asp:Calendar ID="calDatum" runat="server" BackColor="White" 
                                                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="16px" 
                                                onselectionchanged="calDatum_SelectionChanged" Width="19px">
                                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                <NextPrevStyle VerticalAlign="Bottom" />
                                                <OtherMonthDayStyle ForeColor="#808080" />
                                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                <SelectorStyle BackColor="#CCCCCC" />
                                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <WeekendDayStyle BackColor="#FFFFCC" />
                                            </asp:Calendar>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style18" valign="top">
                                        &nbsp;</td>
                                    <td align="left" class="style17" valign="top">
                                        &nbsp;</td>
                                    <td align="right" class="style13" valign="top">
                                        <asp:Button ID="btnPromeni" runat="server" CssClass="ButtonBlue" Height="43px" 
                                            onclick="btnPromeni_Click" Text="Активирај селектирани" Width="191px" />
                                        &nbsp;
                                        <asp:Button ID="btnIzbrishi" runat="server" BackColor="#CC0000" 
                                            CssClass="ButtonBlue" Height="43px" onclick="btnIzbrishi_Click" 
                                            onclientclick="javascript:return confirm('Дали сте сигурни за бришење на веста?');" 
                                            Text="Избриши селектирани" Width="191px" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style12" 
                        style="padding-right: 5px; padding-left: 5px;">
                        &nbsp; </td>
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
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="10">
                        <asp:Label ID="lblOdbrana" runat="server" ForeColor="White"></asp:Label>

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

     <script type="text/javascript">
         function CloseDialog() {
             window.returnValue = document.getElementById("<%=lblOdbrana.ClientID %>").innerHTML;
             window.close()            
         }
    </script>

</asp:Content>

