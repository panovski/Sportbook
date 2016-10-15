<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Statistika.aspx.cs" Inherits="Account_Login" %>

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
            width: 100%;
            border-right-color: #C0C0C0;
            border-bottom-color: #C0C0C0;
        }
        .style19
        {
            width: 162px;
            font-size: small;
        }
        .style20
        {
            font-size: small;
            height: 20px;
        }
        .style21
        {
            width: 162px;
            font-size: small;
            height: 20px;
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
                            <span class="style11"><strong>Статистика:</strong></span><br class="style11" />
                            <br />
                            <br />
                            Топ 10 најчитани вести (во текот на денот):<br />
                            <asp:SqlDataSource ID="DS_Dnevni" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" SelectCommand="select top 10 Naslov, Procitana, Vest_ID as ID from Vest
where Datum_Objava_Prikaz &gt; DATEADD(DAY, -1 ,GETDATE())
order by Procitana desc"></asp:SqlDataSource>
                            <asp:GridView ID="gvDnevni" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" DataSourceID="DS_Dnevni" ForeColor="#333333" GridLines="None" 
                                onselectedindexchanged="gvDnevni_SelectedIndexChanged" Width="777px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Naslov" HeaderText="Наслов" 
                                        SortExpression="Naslov" />
                                    <asp:BoundField DataField="Procitana" HeaderText="Прочитана" 
                                        SortExpression="Procitana" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                    <asp:CommandField SelectText="Прочитај" ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <br />
                            <br />
                            Топ 10 најчитани вести (во текот на последните 7 дена):<br />
                            <asp:SqlDataSource ID="DS_Nedelni" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" SelectCommand="select top 10 Naslov, Procitana, Vest_Id as ID from Vest
where Datum_Objava_Prikaz &gt; DATEADD(WEEK, -1 ,GETDATE())
order by Procitana desc"></asp:SqlDataSource>
                            <asp:GridView ID="gvNedelni" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" datasourceid="DS_Nedelni" ForeColor="#333333" GridLines="None" 
                                onselectedindexchanged="gvNedelni_SelectedIndexChanged" Width="777px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Naslov" HeaderText="Наслов" 
                                        SortExpression="Naslov" />
                                    <asp:BoundField DataField="Procitana" HeaderText="Прочитана" 
                                        SortExpression="Procitana" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" />
                                    <asp:CommandField SelectText="Прочитај" ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <br />
                            <br />
                            Топ 10 најчитани вести (во текот на последните 30 дена):<br />
                            <asp:SqlDataSource ID="DS_Mesecni" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" SelectCommand="select top 10 Naslov, Procitana, Vest_Id as ID from Vest
where Datum_Objava_Prikaz &gt; DATEADD(MONTH, -1 ,GETDATE())
order by Procitana desc"></asp:SqlDataSource>
                            <asp:GridView ID="gvMesecni" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" datasourceid="DS_Mesecni" ForeColor="#333333" GridLines="None" 
                                onselectedindexchanged="gvMesecni_SelectedIndexChanged" Width="777px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Naslov" HeaderText="Наслов" 
                                        SortExpression="Naslov" />
                                    <asp:BoundField DataField="Procitana" HeaderText="Прочитана" 
                                        SortExpression="Procitana" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" />
                                    <asp:CommandField SelectText="Прочитај" ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <br />
                            <br />
                            Топ 10 најчитани вести (во текот на последните 365 дена):<br />
                            <asp:SqlDataSource ID="DS_Godishni" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" SelectCommand="select top 10 Naslov, Procitana, Vest_Id as ID from Vest
where Datum_Objava_Prikaz &gt; DATEADD(YEAR, -1 ,GETDATE())
order by Procitana desc"></asp:SqlDataSource>
                            <asp:GridView ID="gvGodishni" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" datasourceid="DS_Godishni" ForeColor="#333333" GridLines="None" 
                                onselectedindexchanged="gvGodishni_SelectedIndexChanged" Width="777px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Naslov" HeaderText="Наслов" 
                                        SortExpression="Naslov" />
                                    <asp:BoundField DataField="Procitana" HeaderText="Прочитана" 
                                        SortExpression="Procitana" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="ID" />
                                    <asp:CommandField SelectText="Прочитај" ShowSelectButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
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

