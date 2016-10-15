<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="KorisnikNivo.aspx.cs" Inherits="Account_Login" %>

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
        }
        .style20
        {
            font-size: small;
        }
        .style22
        {
            width: 162px;
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
                        <strong>Кориснички нивоа:</strong><br /> </td>
                </tr>
                <tr>
                    <td align="center" class="style13" colspan="10" 
                        style="margin-left: 40px;">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" 
                            DataSourceID="DS_Korisnici" BackColor="White" BorderColor="#CCCCCC" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                            GridLines="Horizontal" Width="764px" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged" 
                            DataKeyNames="KorisnikNivo_Id" style="font-size: x-small">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="Naziv" 
                                    SortExpression="Naziv" HeaderText="Назив" >
                                </asp:BoundField>
                                <asp:CheckBoxField DataField="KreiranjeVest" HeaderText="Креирање вест" 
                                    SortExpression="KreiranjeVest" />
                                <asp:CheckBoxField DataField="AktiviranjeVest" HeaderText="Активирање вест" 
                                    SortExpression="AktiviranjeVest" />
                                <asp:CheckBoxField DataField="BrisenjeNaSliki" HeaderText="Бришење слики" 
                                    SortExpression="BrisenjeNaSliki" />
                                <asp:CheckBoxField DataField="PromenaNaReklami" HeaderText="Реклами" 
                                    SortExpression="PromenaNaReklami" />
                                <asp:CheckBoxField DataField="PromenaNaPozadina" HeaderText="Позадини" 
                                    SortExpression="PromenaNaPozadina" />
                                <asp:CheckBoxField DataField="PromenaNaMeni" HeaderText="Мени" 
                                    SortExpression="PromenaNaMeni" />
                                <asp:CheckBoxField DataField="DodeluvanjePrivilegii" HeaderText="Корисници" 
                                    SortExpression="DodeluvanjePrivilegii" />
                                <asp:CheckBoxField DataField="OdreduvanjeNivoa" HeaderText="Нивоа" 
                                    SortExpression="OdreduvanjeNivoa" />
                                   
                                <asp:CheckBoxField DataField="PregledStatistika" HeaderText="Статистика" 
                                    SortExpression="PregledStatistika" />
                                <asp:CheckBoxField DataField="PregledPoraki" HeaderText="Пораки" 
                                    SortExpression="PregledPoraki" />
                                   
                            </Columns>
                            <EmptyDataTemplate>
                                test
                            </EmptyDataTemplate>
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
                        <asp:SqlDataSource ID="DS_Korisnici" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                            SelectCommand="SELECT * FROM [KorisnikNivo]" 
                            DeleteCommand="DELETE FROM [KorisnikNivo] WHERE [KorisnikNivo_Id] = @original_KorisnikNivo_Id" 
                            InsertCommand="INSERT INTO [KorisnikNivo] ([Naziv], [KreiranjeVest], [AktiviranjeVest], [BrisenjeNaSliki], [PromenaNaReklami], [PromenaNaPozadina], [PromenaNaMeni], [DodeluvanjePrivilegii], [OdreduvanjeNivoa]) VALUES (@Naziv, @KreiranjeVest, @AktiviranjeVest, @BrisenjeNaSliki, @PromenaNaReklami, @PromenaNaPozadina, @PromenaNaMeni, @DodeluvanjePrivilegii, @OdreduvanjeNivoa)" 
                            OldValuesParameterFormatString="original_{0}" 
                            
                            UpdateCommand="UPDATE [KorisnikNivo] SET [Naziv] = @Naziv, [KreiranjeVest] = @KreiranjeVest, [AktiviranjeVest] = @AktiviranjeVest, [BrisenjeNaSliki] = @BrisenjeNaSliki, [PromenaNaReklami] = @PromenaNaReklami, [PromenaNaPozadina] = @PromenaNaPozadina, [PromenaNaMeni] = @PromenaNaMeni, [DodeluvanjePrivilegii] = @DodeluvanjePrivilegii, [OdreduvanjeNivoa] = @OdreduvanjeNivoa WHERE [KorisnikNivo_Id] = @original_KorisnikNivo_Id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_KorisnikNivo_Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Naziv" Type="String" />
                                <asp:Parameter Name="KreiranjeVest" Type="Boolean" />
                                <asp:Parameter Name="AktiviranjeVest" Type="Boolean" />
                                <asp:Parameter Name="BrisenjeNaSliki" Type="Boolean" />
                                <asp:Parameter Name="PromenaNaReklami" Type="Boolean" />
                                <asp:Parameter Name="PromenaNaPozadina" Type="Boolean" />
                                <asp:Parameter Name="PromenaNaMeni" Type="Boolean" />
                                <asp:Parameter Name="DodeluvanjePrivilegii" Type="Boolean" />
                                <asp:Parameter Name="OdreduvanjeNivoa" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Naziv" Type="String" />
                                <asp:Parameter Name="KreiranjeVest" Type="Boolean" />
                                <asp:Parameter Name="AktiviranjeVest" Type="Boolean" />
                                <asp:Parameter Name="BrisenjeNaSliki" Type="Boolean" />
                                <asp:Parameter Name="PromenaNaReklami" Type="Boolean" />
                                <asp:Parameter Name="PromenaNaPozadina" Type="Boolean" />
                                <asp:Parameter Name="PromenaNaMeni" Type="Boolean" />
                                <asp:Parameter Name="DodeluvanjePrivilegii" Type="Boolean" />
                                <asp:Parameter Name="OdreduvanjeNivoa" Type="Boolean" />
                                <asp:Parameter Name="original_KorisnikNivo_Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="Panel1" runat="server" style="text-align: left">
                            <span class="style11"><strong>Додавање на ново корисничко ниво:</strong></span><br />
                            <br />
                            <table class="style17">
                                <tr>
                                    <td class="style22">
                                        Назив:</td>
                                    <td class="style20">
                                        <asp:TextBox ID="tbNaziv" runat="server" Width="269px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style19">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <asp:Button ID="btnPromeni" runat="server" CausesValidation="False" 
                                CssClass="ButtonBlue" Height="31px" onclick="btnPromeni_Click" 
                                onclientclick="javascript:return confirm('Дали сте сигурни?');" 
                                Text="Додади ниво" Width="191px" />
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

