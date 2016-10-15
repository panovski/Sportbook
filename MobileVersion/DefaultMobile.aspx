<%@ Page Title="" Language="C#" MasterPageFile="~/MobileVersion/MobileMaster.master" AutoEventWireup="true" CodeFile="DefaultMobile.aspx.cs" Inherits="MobileVersion_DefaultMobile" %>

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
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        font-weight: bold;
        color: #FFFFFF;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style1">
        <tr>
            <td bgcolor="#3B5998" class="style3" height="25px">
                <asp:LinkButton ID="lbFudbal" runat="server" onclick="lbFudbal_Click" 
                    style="font-size: medium; font-weight: 700; color: #FFFFFF">Фудбал</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList6" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyField="Vest_Id" DataSourceID="DS_Vesti_Fudbal" ForeColor="Black" 
                    GridLines="Horizontal" Width="100%">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Datum_Objava_PrikazLabel" runat="server" 
                            style="color: #808080; font-size: x-small;" 
                            Text='<%# Eval("Datum_Objava_Prikaz", "{0:d}") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="NaslovLabel" runat="server" style="font-weight: 700; color: #000066;" 
                            Text='<%# Eval("Naslov") %>' onclick="NaslovLabel_Click" />
                        &nbsp;<asp:Label ID="Vest_IdLabel" runat="server" 
                            style="color: #FFFFFF; background-color: #FFFFFF" 
                            Text='<%# Eval("Vest_Id") %>' />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DS_Vesti_Fudbal" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                    SelectCommand="SELECT TOP 4 * FROM Vest WHERE Tip = 1 AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz &lt; GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="#3B5998" class="style4" height="25px">
                <asp:LinkButton ID="lbKosarka" runat="server" onclick="lbKosarka_Click" 
                    style="font-size: medium; font-weight: 700; color: #FFFFFF">Кошарка</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList7" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyField="Vest_Id" DataSourceID="DS_Vesti_Kosarka" ForeColor="Black" 
                    GridLines="Horizontal" Width="100%">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Datum_Objava_PrikazLabel" runat="server" 
                            style="color: #808080; font-size: x-small;" 
                            Text='<%# Eval("Datum_Objava_Prikaz", "{0:d}") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="NaslovLabel" runat="server" style="font-weight: 700; color: #000066;" 
                            Text='<%# Eval("Naslov") %>' onclick="NaslovLabel_Click" />
                        &nbsp;<asp:Label ID="Vest_IdLabel" runat="server" 
                            style="color: #FFFFFF; background-color: #FFFFFF" 
                            Text='<%# Eval("Vest_Id") %>' />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DS_Vesti_Kosarka" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                    
                    SelectCommand="SELECT TOP 4 * FROM Vest WHERE Tip = 1 AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz &lt; GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="#3B5998" class="style4" height="25px">
                <asp:LinkButton ID="lbRakomet" runat="server" onclick="lbRakomet_Click" 
                    style="font-size: medium; font-weight: 700; color: #FFFFFF">Ракомет</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList8" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyField="Vest_Id" DataSourceID="DS_Vesti_Rakomet" ForeColor="Black" 
                    GridLines="Horizontal" Width="100%">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Datum_Objava_PrikazLabel" runat="server" 
                            style="color: #808080; font-size: x-small;" 
                            Text='<%# Eval("Datum_Objava_Prikaz", "{0:d}") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="NaslovLabel" runat="server" style="font-weight: 700; color: #000066;" 
                            Text='<%# Eval("Naslov") %>' onclick="NaslovLabel_Click" />
                        &nbsp;<asp:Label ID="Vest_IdLabel" runat="server" 
                            style="color: #FFFFFF; background-color: #FFFFFF" 
                            Text='<%# Eval("Vest_Id") %>' />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DS_Vesti_Rakomet" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                    
                    SelectCommand="SELECT TOP 4 * FROM Vest WHERE Tip = 1 AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz &lt; GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="#3B5998" class="style4" height="25px">
                <asp:LinkButton ID="lbOstanatiSportovi" runat="server" 
                    onclick="lbOstanatiSportovi_Click" 
                    style="font-size: medium; font-weight: 700; color: #FFFFFF">Останати спортови</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList9" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyField="Vest_Id" DataSourceID="DS_Vesti_Ostanato" ForeColor="Black" 
                    GridLines="Horizontal" Width="100%">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Datum_Objava_PrikazLabel" runat="server" 
                            style="color: #808080; font-size: x-small;" 
                            Text='<%# Eval("Datum_Objava_Prikaz", "{0:d}") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="NaslovLabel" runat="server" style="font-weight: 700; color: #000066;" 
                            Text='<%# Eval("Naslov") %>' onclick="NaslovLabel_Click" />
                        &nbsp;<asp:Label ID="Vest_IdLabel" runat="server" 
                            style="color: #FFFFFF; background-color: #FFFFFF" 
                            Text='<%# Eval("Vest_Id") %>' />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DS_Vesti_Ostanato" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                    
                    SelectCommand="SELECT TOP 4 * FROM Vest WHERE Tip = 1 AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz &lt; GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="#3B5998" class="style4" height="25px">
                <asp:LinkButton ID="lbAnalizi" runat="server" onclick="lbAnalizi_Click" 
                    style="font-size: medium; font-weight: 700; color: #FFFFFF">Анализи</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList10" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyField="Vest_Id" DataSourceID="DS_Vesti_Analizi" ForeColor="Black" 
                    GridLines="Horizontal" Width="100%">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Datum_Objava_PrikazLabel" runat="server" 
                            style="color: #808080; font-size: x-small;" 
                            Text='<%# Eval("Datum_Objava_Prikaz", "{0:d}") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="NaslovLabel" runat="server" style="font-weight: 700; color: #000066;" 
                            Text='<%# Eval("Naslov") %>' onclick="NaslovLabel_Click" />
                        &nbsp;<asp:Label ID="Vest_IdLabel" runat="server" 
                            style="color: #FFFFFF; background-color: #FFFFFF" 
                            Text='<%# Eval("Vest_Id") %>' />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DS_Vesti_Analizi" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                    
                    SelectCommand="SELECT TOP 4 * FROM Vest WHERE Tip = 1 AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz &lt; GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="#3B5998" class="style4" height="25px">
                <asp:LinkButton ID="lbZeshkiTopki" runat="server" onclick="lbZeshkiTopki_Click" 
                    style="font-size: medium; font-weight: 700; color: #FFFFFF">Жешки топки</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DataList ID="DataList11" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyField="Vest_Id" DataSourceID="DS_Vesti_ZeskiTopki" ForeColor="Black" 
                    GridLines="Horizontal" Width="100%">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="Datum_Objava_PrikazLabel" runat="server" 
                            style="color: #808080; font-size: x-small;" 
                            Text='<%# Eval("Datum_Objava_Prikaz", "{0:d}") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="NaslovLabel" runat="server" style="font-weight: 700; color: #000066;" 
                            Text='<%# Eval("Naslov") %>' onclick="NaslovLabel_Click" />
                        &nbsp;<asp:Label ID="Vest_IdLabel" runat="server" 
                            style="color: #FFFFFF; background-color: #FFFFFF" 
                            Text='<%# Eval("Vest_Id") %>' />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="DS_Vesti_ZeskiTopki" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                    
                    SelectCommand="SELECT TOP 4 * FROM Vest WHERE Tip = 1 AND f_Naslovna = 1  AND f_Odobrena = 1 AND Datum_Objava_Prikaz &lt; GETDATE() ORDER BY Datum_Objava DESC, Procitana DESC ">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
        </tr>
    </table>
    
</asp:Content>

