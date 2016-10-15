﻿<%@ Page Title="Sportbook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="DefaultCategories.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .style5
        {
            width: 270px;
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
        
        .style12
        {
            font-family: Arial;
            font-size: small;
        }
        
        .style16
        {
            font-family: Arial, Helvetica, sans-serif;
            width: 550px;
        }
                
        .style9
        {
            font-family: "Bodoni MT Black";
        }
                
        .style7
        {
            width: 95px;
        }
        .style8
        {
            width: 171px;
        }
                        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
    <tr>
        <td>
                                        
                                            <asp:Panel ID="pnlReklama10" runat="server" CssClass="ListBoxItemStyle" 
                                                Width="1105px" >
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
                                                                    <embed wmode=transparent src="<% = pathReklama10 %>" quality="high" width="1095px" 
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
                                            <div ID="divFlagTop" class="ImageFlagTop">
                                                                    <asp:Image ID="imgFlagTop" runat="server" ImageUrl="~/Images/Flag-top.png" />
                                                                    <br />
                                                                    <asp:Image ID="imgFlagVnatre" runat="server" CssClass="ImageFlagTopVnatre" 
                                                                        ImageUrl="~/Images/basket_topka.png" />
                                                                </div>
                                            
                            </td>
    </tr>
    <tr>
        <td>
                                <table align="center" cellpadding="0" cellspacing="0" class="style2">
                                    <tr>
                                        <td class="style16" valign="top" rowspan="2">
                                <div id="coin-slider" class="SlideShow" 
                                    style="font-family: Arial; width: 550px; z-index: 1;">
                                    <asp:Panel ID="pnlCoinSlider" runat="server"> 
                                    <asp:HyperLink ID="HyperLink1" runat="server"> <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logo-sb.jpg"/>
        <asp:Label ID="Label1" runat="server" Text="Наслов за слика 1"></asp:Label></asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink2" runat="server"> <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/logo-sb.jpg"/>
        <asp:Label ID="Label2" runat="server" Text="Наслов за слика 2"></asp:Label></asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server"> <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/logo-sb.jpg"/>
        <asp:Label ID="Label3" runat="server" Text="Наслов за слика 3"></asp:Label></asp:HyperLink>
        <asp:HyperLink ID="HyperLink4" runat="server"> <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/logo-sb.jpg"/>
        <asp:Label ID="Label4" runat="server" Text="Наслов за слика 4"></asp:Label></asp:HyperLink>
        <asp:HyperLink ID="HyperLink5" runat="server"> <asp:Image ID="Image5" runat="server" />
        <asp:Label ID="Label5" runat="server" Text="Наслов за слика 5"></asp:Label></asp:HyperLink>
                                </asp:Panel>
                                </div>
                                        </td>
                                        <td valign="top" class="style5" rowspan="2">
                                            &nbsp;&nbsp;</td>
                                        <td valign="top" class="style5" rowspan="2">
                                            <div id="cont" class="ListBox">
    	                                        <img id="down" src="down.png" height="26" border="0" name="b2" 
                                                onmouseover="ScrollDown(4); this.src='down-pressed.png'" 
                                                onmouseout="ScrollStop(); this.src='down.png'" 
                                                align="right"/>                                                
                                                <div id="text">
                                                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                                                        Width="250px" onitemcommand="DataList1_ItemCommand">
                                                        <EditItemStyle CssClass="ListBox" />
                                                        <ItemTemplate>
                                                        <tr <%# TRJavaScript(Container) %>> 
                                                            <td>
                                                            <asp:Panel ID="pnlItem" runat="server" CssClass="ListBoxItem">
                                                                <asp:Label ID="lblVest_Id" runat="server" Text='<%# Eval("Vest_Id") %>' 
                                                                    Visible="False"></asp:Label>
                                                                <asp:LinkButton ID="lnkNaslov" runat="server" onclick="lnkNaslov_Click" 
                                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small" 
                                                                    Text='<%# Eval("Naslov") %>'></asp:LinkButton>
                                                            </asp:Panel>
                                                            </td>
                                                        </tr>
                                                        </ItemTemplate>
                                                    </asp:DataList>

    	</div>
                                                <img id="up" src="up.png" height="26" border="0" name="b1" 
                                                onmouseover="ScrollUp(4); this.src='up-pressed.png';" 
                                                onmouseout="ScrollStop(); this.src='up.png'" align="right" />
                                                </div>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                                                SelectCommand="SELECT TOP 10 * FROM Vest
WHERE f_Snimeno = 1 AND f_Odobrena = 1 AND Datum_Objava_Prikaz < GETDATE() ORDER BY Vest_Id DESC "></asp:SqlDataSource>
<img src="\Images\up.png" style="display:none;"><img src="\Images\down.png" style="display:none;">&nbsp; </td>
                                        <td valign="top" align="left" style="padding-left: 10px;">
                                            <asp:Panel ID="pnlReklamiStran1" runat="server" Width="266px">
                                                <div style="margin: 2px 5px 5px 5px; border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; height: 210px; background-color: #F5F5F5; width: 250px; border-right-color: #3B5999; border-top-color: #3B5999; vertical-align: top; padding-right: 2px; padding-bottom: 2px; padding-left: 2px;" 
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
                                            </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:SqlDataSource ID="sqlDSFudbalDDL" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SportbookDBConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Vest]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlDSKosarkaDDL" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SportbookDBConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Vest]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlDSRakometDDL" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SportbookDBConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Vest]"></asp:SqlDataSource>
                                            <asp:SqlDataSource ID="sqlDSOstanatoDDL" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:SportbookDBConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Vest]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
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
                                        <td class="style16" style="vertical-align: top">
                                           
                                <div id="DivGlaven" class="DivBloks" 
                                    
                                                
                                                
                                                style="padding: 10px; width: 545px; z-index: 1; background-image: url('Images/background.jpg'); height: 473px;">
                                    <div id="DivVestiFudbal" class="DivBloks" 
                                        
                                        style="border-color: #3B5999; border-bottom-style: solid; border-left-style: solid; border-bottom-width: 1px; border-left-width: 1px; background-color: #F5F5F5;">
                                        <asp:Image ID="imgAktuelniFudbal" runat="server" 
                                            ImageUrl="~/Images/Vesti-logo.png" />
                                        <asp:Image ID="imgVestImage" runat="server" 
                                            ImageUrl="~/Images/basket_topka.png" CssClass="VestiLogoImage" />
                                        <asp:Panel ID="pnlAktuelniFudbal" runat="server">
                                            <table cellpadding="2" cellspacing="0" class="style4">
                                                <tr class="style9">
                                                    <td class="style7" rowspan="4" style="padding-top: 3px" 
            valign="top">
                                                        <asp:Image ID="imgVestiFudbal" runat="server" 
                Height="100px" ImageUrl="~/Images/down.png" Width="120px" CssClass="ImageCorners" />
                                                    </td>
                                                    <td class="style8" rowspan="4" 
            style="padding-top: 3px; border-right-style: dotted; border-right-width: 1px; border-right-color: #3B5999;" 
            valign="top">
                                                        <asp:Image ID="Image6" runat="server" CssClass="style12" 
                ImageAlign="Left" ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal1" runat="server" 
                CssClass="TextNotUnderlined" style="color: #3B5999" onclick="lblFudbal1_Click"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id1" runat="server" 
                style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:LinkButton ID="lblFudbal1_Opis" runat="server" 
                                                            CssClass="TextNotUnderlinedBlack" 
                                                            style="color: #000000; font-weight: 700;" onclick="lblFudbal1_Opis_Click"></asp:LinkButton>
                                                    </td>
                                                    <td 
            style="padding-top: 3px; border-bottom-color: #3B5999;" 
            valign="top">
                                                        <asp:Image ID="Image7" runat="server" CssClass="style12" 
                ImageAlign="Left" ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal4" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal4_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id4" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px; border-bottom-color: #3B5999;" valign="top">
                                                        <asp:Image ID="Image26" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal5" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal5_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id5" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px; border-bottom-color: #3B5999;" valign="top">
                                                        <asp:Image ID="Image27" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal6" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal6_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id6" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td 
            style="padding-top: 3px; border-bottom-color: #3B5999;" 
            valign="top">
                                                        <asp:Image ID="Image8" runat="server" CssClass="style12" 
                ImageAlign="Left" ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal7" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal7_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id7" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td class="style7" rowspan="4" 
                                                        style="padding-top: 3px; border-top-style: dotted; border-top-width: 1px; border-top-color: #003366;" 
                                                        valign="top">
                                                        <asp:Image ID="imgVestiFudbal2" runat="server" CssClass="ImageCorners" 
                                                            Height="100px" ImageUrl="~/Images/down.png" Width="120px" />
                                                    </td>
                                                    <td class="style8" rowspan="4" 
                                                        style="padding-top: 3px; border-right-style: dotted; border-right-width: 1px; border-right-color: #3B5999; border-top-style: dotted; border-top-width: 1px; border-top-color: #003366;" 
                                                        valign="top">
                                                        <asp:Image ID="Image24" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal2" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal2_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id2" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:LinkButton ID="lblFudbal2_Opis" runat="server" 
                                                            CssClass="TextNotUnderlinedBlack" onclick="lblFudbal1_Opis_Click" 
                                                            style="color: #000000; font-weight: 700;"></asp:LinkButton>
                                                    </td>
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image9" runat="server" CssClass="style12" 
                ImageAlign="Left" ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal8" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal8_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id8" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image28" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal9" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal9_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id9" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image29" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal10" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal10_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id10" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image30" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal11" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal11_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id11" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td class="style7" rowspan="4" 
                                                        style="padding-top: 3px; border-top-style: dotted; border-top-width: 1px; border-top-color: #003366;" 
                                                        valign="top">
                                                        <asp:Image ID="imgVestiFudbal3" runat="server" CssClass="ImageCorners" 
                                                            Height="100px" ImageUrl="~/Images/down.png" Width="120px" />
                                                    </td>
                                                    <td class="style8" rowspan="4" 
                                                        style="padding-top: 3px; border-right-style: dotted; border-right-width: 1px; border-right-color: #3B5999; border-top-style: dotted; border-top-width: 1px; border-top-color: #003366;" 
                                                        valign="top">
                                                        <asp:Image ID="Image25" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal3" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal3_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id3" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:LinkButton ID="lblFudbal3_Opis" runat="server" 
                                                            CssClass="TextNotUnderlinedBlack" onclick="lblFudbal1_Opis_Click" 
                                                            style="color: #000000; font-weight: 700;"></asp:LinkButton>
                                                    </td>
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image31" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal12" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal12_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id12" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image32" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal13" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal13_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id13" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image33" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal14" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal14_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id14" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="style9">
                                                    <td style="padding-top: 3px" valign="top">
                                                        <asp:Image ID="Image34" runat="server" CssClass="style12" ImageAlign="Left" 
                                                            ImageUrl="~/Images/tocka.png" />
                                                        <asp:LinkButton ID="lblFudbal15" runat="server" CssClass="TextNotUnderlined" 
                                                            onclick="lblFudbal15_Click" style="color: #3B5999"></asp:LinkButton>
                                                        <asp:Label ID="lblFudbal_Id15" runat="server" 
                                                            style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        </div>
                                        <asp:Panel runat=server ID="pnlReklama6">
                                        
                                                            <div ID="divPanel3" class="Shadow" 
                                                                
                                            
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
                                    
                                    <asp:LinkButton ID="lbArhiva" runat="server" onclick="lbArhiva_Click" 
                                        style="font-weight: 700; font-style: italic; color: #003366; font-size: x-small">Архива на вести од оваа категорија</asp:LinkButton>
                                    
                                </div>
                                           
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td style="vertical-align: top">
                                <div id="DivStranicen" class="DivBloks2" 
                                    
                                    
                                    
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                style="padding: 5px; width: 265px; z-index: 1; background-image: url('Images/background.jpg'); font-family: Arial, Helvetica, sans-serif; height: 483px;">
                                <div id="DivStranicenVnatre0" class="Shadow" 
                                    
                                        
                                        
                                        style="border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; background-color: #F5F5F5; width: 263px; border-right-color: #3B5999; border-top-color: #3B5999;">
                                        <asp:Image ID="imgAnalizi" runat="server" 
                                            ImageUrl="~/Images/analizi.png" Width="230px" />
                                        <div style="padding: 5px; height: 105px;">
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
                                                            style="color: #000000; font-weight: 700;" onclick="lblFudbal1_Opis_Click"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                    </div>
                                    </div>
                                    <div id="DivStranicenVnatre" class="Shadow" 
                                    
                                        
                                        
                                        
                                        style="border-left: 1px solid #3B5999; border-bottom: 1px solid #3B5999; background-color: #F5F5F5; width: 263px; height: 142px; border-right-color: #3B5999; border-top-color: #3B5999; margin-top: 5px; margin-bottom: 5px;">
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
                                                            style="color: #000000; font-weight: 700;" onclick="lblFudbal1_Opis_Click" 
                                                                Visible="False"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                    </div>
                                    </div>
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
                                    
                                    
                                    
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                style="padding: 1px; width: 267px; z-index: 1; background-image: url('Images/background.jpg'); font-family: Arial, Helvetica, sans-serif; height: 492px;">
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

