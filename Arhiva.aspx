<%@ Page Title="" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Arhiva.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/CustomStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .style3
    {
        font-family: Arial, Helvetica, sans-serif;
    }
    .style4
    {
        width: 100%;
    }
        
        .style2
        {
            width: 100%;
        }
        .style12
        {
            font-family: Arial;
            font-size: small;
        }
        
    .style13
    {
        width: 265px;
    }
        
    .style14
    {
        width: 100%;
        float: left;
    }
    .style15
    {
        width: 110px;
    }
        
        #tcuv_couple_mcm_bkup
        {
            width: 938px;
        }
        
        .style9
        {
            font-family: "Bodoni MT Black";
        }
                
        .style7
        {
        }
                                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
    <tr>
        <td>
                                        
                                            <asp:Panel ID="pnlReklama10" runat="server" CssClass="ListBoxItemStyle" 
                                                Width="1115px" >
                                                <table style="padding: 0px; margin: 0px" width="100%">
                                                    <tr>
                                                        <td width="505px">
                                                            <div ID="divPanel4" class="Shadow" 
                                                                style="padding: 2px; width: 99.7%; height: 80px; background-color: #EEEEEE;"
                                                                >
                                                                <object ID="ObjReklama10" align="middle"
                                                                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                                    codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                                    height="80"
                                                                    onclick="window.open('<% = OpenReklama10 %>');">
                                                                    <param name="allowScriptAccess" value="sameDomain" />
                                                                    <param name="movie" value="<% = pathReklama10 %>" />
                                                                    <param name="quality" value="high" />
                                                                    <param name="bgcolor" value="#ffffff" />
                                                                    <embed wmode=transparent src="<% = pathReklama10 %>" quality="high" width="1100px" 
        height="80" name="tcuv_couple_mcm_bkup" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                                </object>
                                                                <asp:ImageButton ID="btnReklama10" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                                    onclick="btnReklama10_Click" Visible="False" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            
                                            
                            </td>
    </tr>
    <tr>
        <td>
                                <table align="center" cellpadding="0" cellspacing="0" class="style2">
                                    <tr style="margin-top: -10px">
                                        <td class="style3" style="vertical-align: top" colspan="4">
                                        
                                            <asp:Panel ID="pnlReklama1" runat="server" CssClass="ListBoxItemStyle" 
                                                Width="1115px" >
                                                <table style="padding: 0px; margin: 0px" width="100%">
                                                    <tr>
                                                        <td width="505px">
                                                            <div ID="divPanel1" class="Shadow" 
                                                                style="padding: 2px; width: 99%; height: 80px; background-color: #EEEEEE;"
                                                                >
                                                                <object ID="ObjReklama1" align="left" 
                                                                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                                    codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                                    height="80"
                                                                    onclick="window.open('<% = OpenReklama1 %>');">
                                                                    <param name="allowScriptAccess" value="sameDomain" />
                                                                    <param name="movie" value="<% = pathReklama1 %>" />
                                                                    <param name="quality" value="high" />
                                                                    <param name="bgcolor" value="#ffffff" />
                                                                    <embed wmode=transparent src="<% = pathReklama1 %>" quality="high" width="545" 
        height="80" name="tcuv_couple_mcm_bkup" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                                </object>
                                                                <asp:ImageButton ID="btnReklama1" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                                    onclick="btnReklama1_Click" Visible="False" />
                                                            </div>
                                                        </td>
                                                        <td width="505">
                                                            <div ID="divPanel2" class="Shadow" 
                                                                style="padding: 2px; width: 99%; height: 80px; background-color: #EEEEEE;">
                                                                <object ID="ObjReklama2" align="left" 
                                                                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                                    codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                                    height="80" onclick="window.open('<% = OpenReklama2 %>');">
                                                                    <param name="allowScriptAccess" value="sameDomain" />
                                                                    <param name="movie" value="<% = pathReklama2 %>" />
                                                                    <param name="quality" value="high" />
                                                                    <param name="bgcolor" value="#ffffff" />
                                                                    <embed wmode=transparent src="<% = pathReklama2 %>" quality="high" width="545" 
        height="80" name="ObjReklama2" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                                </object>
                                                                <asp:ImageButton ID="btnReklama2" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                                    onclick="btnReklama2_Click" Visible="False" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3" style="vertical-align: top">
                                           
                                <div id="DivGlaven" class="DivBloks" 
                                    
                                                
                                                
                                                
                                                style="padding: 10px; width: 540px; z-index: 1; background-image: url('Images/background.jpg'); height: 665px;">
                                        <asp:Panel runat=server ID="pnlArhiva">
                                        
                                                            <div ID="divPanel3" class="Shadow" 
                                                                
                                            
                                        style="padding: 2px; width: 101%; background-color: #EEEEEE; margin-top: 5px; margin-left: -5px;"
                                                                >
                                                                <asp:Image ID="imgAktuelniFudbal" runat="server" 
                                                                    ImageUrl="~/Images/Arhiva.png" />
                                                                <asp:Image ID="imgVestImage" runat="server" CssClass="VestiLogoImage" 
                                                                    ImageUrl="~/Images/basket_topka.png" />
                                                                <asp:Panel ID="pnlAktuelniFudbal" runat="server">
                                                                    <table cellpadding="2" cellspacing="0" class="style4">
                                                                        <tr class="style9">
                                                                            <td class="style7" style="padding-top: 3px; text-align: center;" valign="top">
                                                                                <br />
                                                                                <asp:Panel ID="pnlPrebaruvanje" runat="server" DefaultButton="btnPrebaraj">
                                                                                    <asp:TextBox ID="tbPrebaraj" runat="server" 
                                                                                        style="color: #3B5999; font-family: Calibri; font-style: italic" 
                                                                                        ValidationGroup="4" Width="342px"></asp:TextBox>
                                                                                    &nbsp;<asp:Button ID="btnPrebaraj" runat="server" CssClass="ButtonBlue" 
                                                                                        onclick="btnPrebaraj_Click" style="font-family: Calibri; width: 81px" 
                                                                                        Text="Пребарај" ValidationGroup="4" />
                                                                                </asp:Panel>
                                                                                &nbsp;<br />
                                                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                                                    CellPadding="4" DataKeyNames="Vest_Id" DataSourceID="DS_Arhiva" 
                                                                                    ForeColor="Black" GridLines="Horizontal" 
                                                                                    style="font-family: Arial; font-size: small" Width="518px" 
                                                                                    AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                                                                                    BorderWidth="1px" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                                                                    PageSize="15">
                                                                                    <Columns>
                                                                                        <asp:CommandField SelectText="Прочитај" ShowSelectButton="True" />
                                                                                        <asp:BoundField DataField="Vest_Id" InsertVisible="False" ReadOnly="True" 
                                                                                            SortExpression="Vest_Id">
                                                                                        <ItemStyle ForeColor="#EEEEEE" Width="1px" />
                                                                                        </asp:BoundField>
                                                                                        <asp:BoundField DataField="Naslov" HeaderText="Наслов" 
                                                                                            SortExpression="Naslov" />
                                                                                        <asp:BoundField DataField="Datum_Objava" HeaderText="Датум на објава" 
                                                                                            SortExpression="Datum_Objava" DataFormatString="{0:d}" HtmlEncode=false>
                                                                                        <ItemStyle Width="25%" />
                                                                                        </asp:BoundField>
                                                                                    </Columns>
                                                                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                                                    <HeaderStyle BackColor="#3B5999" Font-Bold="True" ForeColor="White" />
                                                                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                                                    <RowStyle BackColor="#EEEEEE" />
                                                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                                                                </asp:GridView>
                                                                                <asp:SqlDataSource ID="DS_Arhiva" runat="server" 
                                                                                    ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                                                                                    SelectCommand="SELECT * FROM Vest WHERE 1=2"></asp:SqlDataSource>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                            </div>
                                    
                                </asp:Panel>
                                        <asp:Panel runat=server ID="pnlReklama6">
                                        
                                                            <div ID="divPanel5" class="Shadow" 
                                                                
                                            
                                        style="padding: 2px; width: 101%; height: 80px; background-color: #EEEEEE; margin-top: 10px; margin-left: -5px;"
                                                                >
                                                                <object ID="ObjReklama6" align="left" 
                                                                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                                    codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                                    height="80"
                                                                    onclick="window.open('<% = OpenReklama6 %>');">
                                                                    <param name="allowScriptAccess" value="sameDomain" />
                                                                    <param name="movie" value="<% = pathReklama6 %>" />
                                                                    <param name="quality" value="high" />
                                                                    <param name="bgcolor" value="#ffffff" />
                                                                    <embed wmode=transparent src="<% = pathReklama6 %>" quality="high" width="545" 
        height="80" name="ObjReklama6" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                                </object>
                                                                <asp:ImageButton ID="btnReklama6" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                                    onclick="btnReklama6_Click" Visible="False" />
                                                            </div>
                                    
                                </asp:Panel>
                                    
                                </div>
                                           
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td style="vertical-align: top" class="style13">
                                <div id="DivStranicen" class="DivBloks2" 
                                    
                                    
                                    
                                                
                                                
                                                
                                                
                                                
                                                style="padding: 5px; width: 265px; z-index: 1; background-image: url('Images/background.jpg'); font-family: Arial, Helvetica, sans-serif; height: 675px;">
                                <div id="DivStranicenVnatre0" class="Shadow" 
                                    
                                        
                                        
                                        style="border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; background-color: #F5F5F5; width: 263px; border-right-color: #3B5999; border-top-color: #3B5999;">
                                        <asp:Image ID="imgAnalizi" runat="server" 
                                            ImageUrl="~/Images/analizi.png" Width="230px" />
                                        <div style="padding: 5px; height: 124px;">
                                            <asp:Panel ID="pnlAnalizi" runat="server">
                                                <table align="left" cellpadding="0" 
    cellspacing="0" class="style14">
                                                    <tr>
                                                        <td class="style15" valign="top">
                                                            <asp:Image ID="imgVestiAnalizi" runat="server" 
                Height="100px" ImageUrl="~/Images/down.png" Width="120px" CssClass="ImageCorners" />
                                                        </td>
                                                        <td valign="top" style="padding-left: 5px">
                                                            <asp:Image ID="Image22" runat="server" CssClass="style12" 
                ImageAlign="Left" ImageUrl="~/Images/tocka.png" />
                                                            <asp:LinkButton ID="lblAnalizi1" runat="server" 
                CssClass="TextNotUnderlined" style="color: #3B5999" onclick="lblAnalizi1_Click"></asp:LinkButton>
                                                            <asp:Label ID="lblAnalizi_Id1" runat="server" 
                style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                Visible="False"></asp:Label>
                                                            <br />
                                                            <asp:LinkButton ID="lblAnalizi1_Opis" runat="server" 
                                                            CssClass="TextNotUnderlinedBlack" 
                                                            style="color: #000000; font-weight: 700;" ></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                    </div>
                                    </div>
                                    <br />
                                    <div id="DivStranicenVnatre" class="Shadow" 
                                    
                                        
                                        style="border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; background-color: #F5F5F5; width: 263px; height: 157px; border-right-color: #3B5999; border-top-color: #3B5999;">
                                        <asp:Image ID="imgZeskiTopki" runat="server" 
                                            ImageUrl="~/Images/Zeski-Topki.png" Width="230px" />
                                        <div style="padding: 5px">
                                            <asp:Panel ID="pnlZeskiTopki" runat="server">
                                                <table align="left" cellpadding="0" 
    cellspacing="0" class="style14">
                                                    <tr>
                                                        <td class="style15" valign="top">
                                                            <asp:Image ID="imgVestiZeskiTopki" runat="server" 
                Height="100px" ImageUrl="~/Images/down.png" Width="120px" CssClass="ImageCorners" />
                                                        </td>
                                                        <td valign="top" style="padding-left: 5px">
                                                            <asp:Image ID="Image23" runat="server" CssClass="style12" 
                ImageAlign="Left" ImageUrl="~/Images/tocka.png" />
                                                            <asp:LinkButton ID="lblZeskiTopki1" runat="server" 
                CssClass="TextNotUnderlined" style="color: #3B5999" onclick="lblZeskiTopki1_Click"></asp:LinkButton>
                                                            <asp:Label ID="lblZeskiTopki_Id1" runat="server" 
                style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                Visible="False"></asp:Label>
                                                            <br />
                                                            <asp:LinkButton ID="lblZeskiTopki1_Opis" runat="server" 
                                                            CssClass="TextNotUnderlinedBlack" 
                                                            style="color: #000000; font-weight: 700;" 
                                                                Visible="False"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                    </div>
                                    </div>
                                            <br />
                                            <asp:Panel ID="pnlReklama7" runat="server" Width="266px" 
                                        Height="92px">
                                                <div style="padding: 2px; margin: 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 81px; background-color: #F5F5F5; width: 253px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top;" 
                                                    ID="DivStranicenRek4" class="Shadow" width="255">
                                                    <object ID="ObjReklama7" align="left" 
                                                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                        height="80" width="250"
                                                        onclick="window.open('<% = OpenReklama7 %>');">
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <param name="movie" value="<% = pathReklama7 %>" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#ffffff" />
                                                        <embed wmode=transparent src="<% = pathReklama7 %>" quality="high" width="250" 
        height="80" name="ObjReklama3" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                    </object>
                                                    
                                                    <asp:ImageButton ID="btnReklama7" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                        onclick="btnReklama7_Click" Visible="False" style="width: 16px" />
                                                    </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlReklama8" runat="server" Width="266px" 
                                        Height="92px">
                                                <div style="padding: 2px; margin: 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 81px; background-color: #F5F5F5; width: 253px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top;" 
                                                    ID="DivStranicenRek5" class="Shadow" width="255">
                                                    <object ID="ObjReklama8" align="left" 
                                                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                        height="80" width="250"
                                                        onclick="window.open('<% = OpenReklama8 %>');">
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <param name="movie" value="<% = pathReklama8 %>" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#ffffff" />
                                                        <embed wmode=transparent src="<% = pathReklama8 %>" quality="high" width="250" 
        height="80" name="ObjReklama3" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                    </object>
                                                    
                                                    <asp:ImageButton ID="btnReklama8" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                        onclick="btnReklama8_Click" Visible="False" style="width: 16px" />
                                                    </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlReklama9" runat="server" Width="266px" 
                                        Height="92px">
                                                <div style="padding: 2px; margin: 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 81px; background-color: #F5F5F5; width: 253px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top;" 
                                                    ID="DivStranicenRek6" class="Shadow" width="255">
                                                    <object ID="ObjReklama9" align="left" 
                                                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                        height="80" width="250"
                                                        onclick="window.open('<% = OpenReklama9 %>');">
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <param name="movie" value="<% = pathReklama9 %>" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#ffffff" />
                                                        <embed wmode=transparent src="<% = pathReklama9 %>" quality="high" width="250" 
        height="80" name="ObjReklama3" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                    </object>
                                                    
                                                    <asp:ImageButton ID="btnReklama9" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                        onclick="btnReklama9_Click" Visible="False" style="width: 16px" />
                                                    </div>
                                            </asp:Panel>
                                </div>
                                        </td>
                                        <td style="vertical-align: top; padding-left: 10px;">
                                <div id="DivReklamiStran01" class="DivBloks2" 
                                    
                                    
                                    
                                                
                                                
                                                
                                                
                                                
                                                
                                                style="padding: 1px; width: 267px; z-index: 1; background-image: url('Images/background.jpg'); font-family: Arial, Helvetica, sans-serif; height: 682px;">
                                            <asp:Panel ID="pnlReklamiStran1" runat="server" Width="266px">
                                                <div style="padding: 2px; margin: 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 210px; background-color: #F5F5F5; width: 250px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top;" 
                                                    ID="DivStranicenRek1" class="Shadow" width="255" >
                                                    <object ID="ObjReklama3" align="left" 
                                                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                        height="210" width="250" onclick="window.open('<% = OpenReklama3 %>');">
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <param name="movie" value="<% = pathReklama3 %>" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#ffffff" />
                                                        <embed wmode=transparent src="<% = pathReklama3 %>" quality="high" width="250" 
        height="210" name="ObjReklama3" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                    </object>
                                                    <asp:ImageButton ID="btnReklama3" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                        onclick="btnReklama3_Click" Visible="False" style="width: 16px" />
                                                    
                                                    </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlReklamiStran2" runat="server" Width="266px">
                                                <div style="padding: 2px; margin: 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 210px; background-color: #F5F5F5; width: 250px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top;" 
                                                    ID="DivStranicenRek2" class="Shadow" width="255">
                                                    <object ID="ObjReklama4" align="left" 
                                                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                        height="210" width="250"
                                                        onclick="window.open('<% = OpenReklama4 %>');">
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <param name="movie" value="<% = pathReklama4 %>" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#ffffff" />
                                                        <embed wmode=transparent src="<% = pathReklama4 %>" quality="high" width="250" 
        height="210" name="ObjReklama3" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                    </object>
                                                    
                                                    <asp:ImageButton ID="btnReklama4" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                        onclick="btnReklama4_Click" Visible="False" style="width: 16px" />
                                                    </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlReklamiStran3" runat="server" Width="266px">
                                                <div style="padding: 2px; margin: 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 210px; background-color: #F5F5F5; width: 250px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top;" 
                                                    ID="DivStranicenRek3" class="Shadow" width="255">
                                                    <object ID="ObjReklama5" align="left" 
                                                        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                                        codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                                        height="210" width="250"
                                                        onclick="window.open('<% = OpenReklama5 %>');">
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <param name="movie" value="<% = pathReklama5 %>" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#ffffff" />
                                                        <embed wmode=transparent src="<% = pathReklama5 %>" quality="high" width="250" 
        height="210" name="ObjReklama3" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                                    </object>
                                                    
                                                    <asp:ImageButton ID="btnReklama5" runat="server" ImageUrl="~/Images/Edit.gif" 
                                                        onclick="btnReklama5_Click" Visible="False" style="width: 16px" />
                                                    </div>
                                            </asp:Panel>
                                </div>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
    </tr>
    </table>
</asp:Content>

