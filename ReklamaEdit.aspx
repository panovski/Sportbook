<%@ Page Title="SportBook" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="ReklamaEdit.aspx.cs" Inherits="Account_Login" %>

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
        {
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
                        <strong>Промени реклама:</strong></td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        <div style="text-align: left; font-weight: 700">
                            <span class="style11">Тековна реклама:<br /> </span><br />
                            <asp:Panel ID="pnlTekovnaReklama" runat="server">
                                Дали да се појавува рекламата?
                                <asp:CheckBox ID="cbVidliva" runat="server" Text="Да" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnPromeniVidlivo" runat="server" CausesValidation="False" 
                                    CssClass="style44" onclick="btnPromeniVidlivo_Click" 
                                    onclientclick="javascript:return confirm('Дали сте сигурни?');" Text="Промени" 
                                    Width="90px" />
                                <br />
                                <br />
                                Линк што ќе го отвара рекламата:&nbsp;
                                <asp:TextBox ID="tbUrlReklama" runat="server" Width="339px"></asp:TextBox>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <object ID="ObjReklama" align="left" 
                                    classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" 
                                    codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
                                    height="<% = goleminaHeight %>">
                                    <param name="allowScriptAccess" value="sameDomain" />
                                    <param name="movie" value="<% = pathTekovnaReklama %>" />
                                    <param name="quality" value="high" />
                                    <param name="bgcolor" value="#ffffff" />
                                    <embed wmode=transparent src="<% = pathTekovnaReklama %>" quality="high" width="<% = goleminaWidth %>" 
        height="<% = goleminaHeight %>" name="tcuv_couple_mcm_bkup" align="middle" 
        allowScriptAccess="sameDomain" type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" />
                                </object>
                            </asp:Panel>
                        </div>
                    </td>
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
                            Промена на рекламата:</span><br />
                            <br />
                            Формат на рекламата: (потребни димензии :
                            <asp:Label ID="lblWidth" runat="server"></asp:Label>
                            &nbsp;х
                            <asp:Label ID="lblHeight" runat="server"></asp:Label>
                            ) </strong><br />
                            <div style="text-align: center">
                                <asp:RadioButtonList ID="rblFormat" runat="server" AutoPostBack="True" 
                                    Height="20px" onselectedindexchanged="rblFormat_SelectedIndexChanged" 
                                    RepeatDirection="Horizontal" Width="358px">
                                    <asp:ListItem Value="1">Слика (JPG, PNG, GIF)</asp:ListItem>
                                    <asp:ListItem Value="2">Анимација (Flash)</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            &nbsp;</div>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style13">
                        <asp:Panel ID="pnlUpload" runat="server" Visible="False">
                            <asp:FileUpload ID="Upload" runat="server" CssClass="style44" />
                            <asp:Button ID="btnImportSWF" runat="server" CausesValidation="False" 
                                CssClass="style44" onclick="btnImportSWF_Click" 
                                onclientclick="javascript:return confirm('Дали сте сигурни за прикачување на анимацијата?');" 
                                Text="Upload Flash" Width="90px" />
                            <asp:Button ID="btnImportJPG" runat="server" CausesValidation="False" 
                                CssClass="style44" onclick="btnImportJPG_Click" 
                                onclientclick="javascript:return confirm('Дали сте сигурни за прикачување на слика?');" 
                                Text="Upload JPG" Width="90px" />
                            <br />
                            <asp:Panel ID="pnlCrop" runat="server" BorderColor="#333333" 
                                BorderStyle="Dotted" BorderWidth="1px" style="text-align: left" Visible="False">
                                &nbsp;&nbsp;&nbsp;
                                <asp:Image ID="imgImageToCrop" runat="server" BorderColor="Gray" 
                                    BorderStyle="Groove" BorderWidth="3px" ImageAlign="Middle" />
                                <br />
                                <br />
                                &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCrop" runat="server" CausesValidation="False" 
                                    CssClass="ButtonBlue" onclick="btnCrop_Click" 
                                    onclientclick="javascript:return confirm('Дали сте сигурни за сечење на сликата?');" 
                                    Text="Исечи" />
                                &nbsp;<asp:Button ID="btnZacuvaj" runat="server" CausesValidation="False" 
                                    CssClass="ButtonBlue" onclick="btnZacuvaj_Click" Text="Зачувај со димензии" />
                                &nbsp;
                                <asp:Panel ID="pnlShowZacuvaj" runat="server" Visible="False">
                                    &nbsp;&nbsp;
                                    <asp:Image ID="imgError5" runat="server" ImageUrl="~/Images/wrong.png" />
                                    &nbsp;<asp:Label ID="lblZaSlideShow" runat="server" 
                                        style="font-size: small; color: #FF0000; font-weight: 700" 
                                        Text="Мора да ја зачувате сликата со димензии!"></asp:Label>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
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

                        <br />
                        <div>
                            <asp:HiddenField ID="hfImageXcoordinate1" runat="server" />
                            <asp:HiddenField ID="hfImageYcoordinate1" runat="server" />
                            <asp:HiddenField ID="hfImageWidth" runat="server" />
                            <asp:HiddenField ID="hfImageHeight" runat="server" />
                        </div>

                        <asp:Label ID="lblOdbrana" runat="server" ForeColor="White"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td>
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

    <script language="Javascript" type="text/javascript">
        var jcrop_Obj;
            jQuery(document).ready(function () {
            jcrop_Obj = jQuery('#<%=imgImageToCrop.ClientID%>').Jcrop({
                onChange: CaptureImageArea,
                onSelect: CaptureImageArea,
                setSelect: [0, 0, "<% = goleminaWidth %>", "<% = goleminaHeight %>"],
                boxWidth: 700,
                bgColor: 'white',
                allowMove: true, allowResize: true, allowSelect: false
            });
        });

        function CaptureImageArea(croppedRectangle) {
            jQuery('#croppedX').val(croppedRectangle.x);
            jQuery('#croppedY').val(croppedRectangle.y);
            jQuery('#croppedX2').val(croppedRectangle.x2);
            jQuery('#croppedY2').val(croppedRectangle.y2);
            jQuery('#<%=hfImageXcoordinate1.ClientID%>').val(croppedRectangle.x);
            jQuery('#<%=hfImageYcoordinate1.ClientID%>').val(croppedRectangle.y);
            jQuery('#<%=hfImageWidth.ClientID%>').val(croppedRectangle.w);
            jQuery('#<%=hfImageHeight.ClientID%>').val(croppedRectangle.h);
        };
</script>

</asp:Content>

