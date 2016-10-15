<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="Vest.aspx.cs" Inherits="Vest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 505px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td colspan="2" valign="top">
                                        
                                            <asp:Panel ID="pnlReklama10" runat="server" CssClass="ListBoxItemStyle" 
                                                Width="1115px" >
                                                <table style="padding: 0px; margin: 0px; width: 99%;">
                                                    <tr>
                                                        <td class="style3">
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
                                            
                                            
                            <br />
                                        
                                            <asp:Panel ID="pnlReklama1" runat="server" CssClass="ListBoxItemStyle" 
                                                Width="1115px" >
                                                <table style="padding: 0px; margin: 0px; width: 690px;">
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
                                                                
                                                                style="padding: 2px; width: 100%; height: 80px; background-color: #EEEEEE;">
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
        <tr valign="top">
            <td align="center" rowspan="2">
    <asp:Panel ID="Panel1" runat="server" style="text-align: left" Width="832px">
        <div ID="DivGlaven" class="DivBloks" 
            style="padding: 30px; font-family: 'Bodoni MT Condensed'; ">
            <asp:Label ID="lblNaslov" runat="server" 
                
                style="font-family: Arial, Helvetica, sans-serif; font-size: x-large; font-weight: 700; color: #475F92; font-style: italic;"></asp:Label>
            <asp:Panel ID="pnlInformacii" runat="server" 
                style="font-family: Calibri; font-style: italic; color: #C0C0C0">
                Објавена на :
                <asp:Label ID="lblObjavena" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="pnlAdminPromeni" runat="server" BackColor="#F8F8F8" 
                BorderStyle="Dotted" BorderWidth="1px" style="font-family: Calibri" 
                Visible="False">
                <asp:Button ID="btnPromeni" runat="server" CssClass="ButtonBlue" 
                    onclick="btnPromeni_Click" Text="Промени" Visible="False" />
                <asp:Button ID="btnDeaktiviraj" runat="server" CssClass="ButtonBlue" 
                    onclick="btnDeaktiviraj_Click" 
                    onclientclick="javascript:return confirm('Дали сте сигурни за деактивирање?');" 
                    Text="Деактивирај" Visible="False" />
                <br />Прочитана :&nbsp;
                <asp:Label ID="lblProcitana" runat="server"></asp:Label>
                &nbsp;пати&nbsp;&nbsp; 
                <br />Напишана од:
                <asp:Label ID="lblObjavenaOd" runat="server"></asp:Label>
                &nbsp; |&nbsp; Одобрил:
                <asp:Label ID="lblOdobrenoOd" runat="server"></asp:Label>
                &nbsp; |&nbsp; Одобрена:
                <asp:Label ID="lblOdobrenaNa" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Label ID="lblSodzina" runat="server" 
                style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
            <asp:Label ID="lblTip" runat="server" 
                style="font-family: Arial, Helvetica, sans-serif" Visible="False"></asp:Label>
            <br />
        </div>
    </asp:Panel>
                                        <asp:Panel runat=server ID="pnlReklama6" Width="487px">
                                        
                                                            <div ID="divPanel3" class="Shadow" 
                                                                
                                            
                                        style="padding: 2px; width: 112%; height: 80px; background-color: #EEEEEE; margin-top: 5px; margin-left: -5px;"
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
                                </td>
            <td>
                <asp:Panel ID="DivReklamiStran01" runat="server" class="DivBloks2"
                                    style="padding: 1px; width: 267px; z-index: 1; background-image: url('Images/background.jpg'); font-family: Arial, Helvetica, sans-serif; ">
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
                                </asp:Panel>
                                        </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

