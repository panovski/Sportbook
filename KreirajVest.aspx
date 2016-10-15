<%@ Page Title="" Language="C#" MasterPageFile="~/SBMaster.master" AutoEventWireup="true" CodeFile="KreirajVest.aspx.cs" Inherits="Account_Login"  ValidateRequest = "false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            width: 99%;
        }
        .style13
        {
            text-align: left;
        }
        .style14
        {
            text-align: left;
        }
        .style22
        {
        }
        .style24
        {
            height: 22px;
        }
        .style25
        {
            width: 12px;
            height: 22px;
        }
        .style26
        {
            height: 22px;
        }
        .style30
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            color: #333333;
        }
        .style41
    {
        text-align: right;
        width: 110px;
        font-size: small;
        color: #666666;
        height: 26px;
    }
    .style42
    {
        height: 26px;
    }
        .style43
        {
            text-align: left;
            width: 969px;
        }
        .style44
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style45
        {
            font-size: small;
        }
        .style50
        {
            text-align: right;
            width: 110px;
            font-size: small;
            color: #666666;
        }
        .style51
        {
            text-align: right;
            width: 110px;
            height: 22px;
            font-size: small;
        }
        .style52
        {
            text-align: right;
            width: 110px;
            font-size: small;
        }
        .style53
        {
            text-align: right;
            width: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div id="DivGlaven" class="DivBloks" 
                                    
        style="padding: 10px; width: 1100px; z-index: 1;" align="center">
        &nbsp;<br />
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
                        
                    </tr>
                </table>
                <br />
            </div>
            <strong>
            <asp:SqlDataSource ID="DSCeloMeni" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSSiteStavkiMeni" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbSportbookConnectionString %>" 
                SelectCommand="SELECT [Meni_Id], [Tekst] FROM [Meni] ORDER BY Meni_Id ASC">
            </asp:SqlDataSource>
            </strong>
            <br />
            <br />
            <br />
&nbsp;<br />
        </asp:Panel>
        <asp:Panel ID="pnlPromeniMeni" runat="server" style="text-align: left" 
            Visible="False" Width="1103px">
            <table class="style10" 
                style="margin: 10px; padding: 10px; font-family: Arial, Helvetica, sans-serif; color: #808080;">
                <tr>
                    <td align="center" class="style13">
                        &nbsp;</td>
                    <td align="center" class="style13">
                        &nbsp;</td>
                    <td align="center" class="style43">
                        <asp:LinkButton ID="lbAdmin0" runat="server" CssClass="style45" 
                            PostBackUrl="~/Login.aspx" style="color: #666666">Администраторски панел</asp:LinkButton>
                        <strong><span class="style45">&nbsp; </span></strong>&gt;<strong><span class="style45">&nbsp; 
                        Креирај вест</span><div>
                            <asp:HiddenField ID="hfImageXcoordinate1" runat="server" />
                            <asp:HiddenField ID="hfImageYcoordinate1" runat="server" />
                            <asp:HiddenField ID="hfImageWidth" runat="server" />
                            <asp:HiddenField ID="hfImageHeight" runat="server" />
                        </div>
                        </strong></td>
                    <td align="center" class="style13">
                        <strong><span class="style45">
                        <asp:Button ID="btnVnesi0" runat="server" CssClass="ButtonBlue" 
                            onclick="btnVnesi_Click" 
                            onclientclick="javascript:return confirm('Дали сте сигурни за додавање на вест?');" 
                            Text="Внеси" ValidationGroup="1" Width="91px" />
                        </span></strong>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                                <table class="style10">
                                    <tr>
                                        <td class="style50" 
                                            valign="top">
                                            Наслов:</td>
                                        <td class="style22" colspan="3">
                                            <asp:TextBox ID="tbNaslov" runat="server" CssClass="style30" Width="870px"></asp:TextBox>
                                            <asp:Button ID="btnNaslovConvert" runat="server" OnClick="btnNaslovConvert_Click" Text="МК" />
                                            <asp:Panel ID="pnlZadolzitelnaNaslov" runat="server" Visible="False">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/wrong.png" />
                                                &nbsp;<asp:Label ID="lblZadolzNaslov" runat="server" 
                                                    style="font-size: small; color: #FF0000; font-weight: 700" 
                                                    Text="Задолжителна вредност - Наслов!"></asp:Label>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style50" 
                                            valign="top">
                                            Категорија:</td>
                                        <td class="style22" colspan="3">
                                            <asp:DropDownList ID="ddlKategorija" runat="server" DataSourceID="DSCeloMeni" 
                                                DataTextField="Tekst" DataValueField="Meni_Id" 
                                                style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #666666" 
                                                Width="245px" Height="25px">
                                            </asp:DropDownList>
                                            <asp:Panel ID="pnlZadolzitelnaKategorija" runat="server" Visible="False">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/wrong.png" />
                                                &nbsp;<asp:Label ID="lblZadolzKategorija" runat="server" 
                                                    style="font-size: small; color: #FF0000; font-weight: 700" 
                                                    Text="Задолжителна вредност - Категорија!"></asp:Label>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style41" 
                                            valign="top">
                                            Подкатегории:</td>
                                        <td class="style42" align="left" colspan="3">
                                            <asp:Panel ID="pnlPodkategorii" runat="server" BorderColor="Silver" 
                                                BorderStyle="Solid" BorderWidth="1px" Height="81px" ScrollBars="Vertical" 
                                                Width="890px" Font-Size="XX-Small">
                                                <asp:CheckBoxList ID="cblPodkategorii" runat="server" 
                                                    DataSourceID="DSSiteStavkiMeni" DataTextField="Tekst" DataValueField="Meni_Id" 
                                                    Font-Names="Arial" Font-Size="XX-Small" RepeatColumns="8" 
                                                    RepeatDirection="Horizontal">
                                                </asp:CheckBoxList>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style51" valign="top">
                                            Кратка содржина:</td>
                                        <td class="style24" valign="top">
                                            <asp:TextBox ID="tbKratkaSodrzina" runat="server" Width="707px" 
                                                BorderColor="#33CC33" CssClass="style30" Height="22px"></asp:TextBox>
                                            <asp:Button ID="btnKratkaConvert" runat="server" OnClick="btnKratkaConvert_Click" Text="МК" />
                                        </td>
                                        <td class="style25" valign="top">
                                            &nbsp;</td>
                                        <td class="style26" valign="top">
                                            <asp:Panel ID="pnlDolgTekst" runat="server" Visible="False">
                                                <asp:Image ID="imgError3" runat="server" ImageUrl="~/Images/wrong.png" />
                                                &nbsp;<asp:Label ID="lblDolgTekst" runat="server" 
                                                    style="font-size: small; color: #FF0000; font-weight: 700" 
                                                    Text="Долг текст! Макс. 450 карактери"></asp:Label>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style50" valign="top">
                                            Содржина:</td>
                                        <td class="style22">
                                            <asp:TextBox ID="tbSodrzina" runat="server" TextMode="MultiLine" Width="451px"></asp:TextBox>
                                            <br />
                                            <asp:Button ID="btnConvert" runat="server" OnClick="Button1_Click" Text="Конвертирај во Кирилица" />
                                           
                                            &nbsp;<span class="style45">Напомена: Направи ја конверзијата на чист текст (без слики и други додатоци)!
                                            <br />
                                            Карактери: Ѓ - } , ѓ - ] , Ж - | , ж - \ , Ќ - &quot; ,&nbsp; ќ - &#39; , Ч - : , ч - ; , Ш - { , ш - [ </span>
                                           
                                        </td>
                                        <td class="style14">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style52" valign="top">
                                            Постоечка слика:</td>
                                        <td class="style22" valign="top">
                                            <asp:Button ID="btnVnesiPostoeckaSlika" runat="server" CausesValidation="False" 
                                                onclick="btnVnesiPostoeckaSlika_Click" Text="Внеси постоечка слика" 
                                                UseSubmitBehavior="False" />
                                            &nbsp;<asp:Button ID="btnVmetniVoTekst_Postoecka" runat="server" 
                                                CausesValidation="False" CssClass="ButtonBlue" 
                                                onclick="btnVmetniVoTekst_Postoecka_Click" Text="Вметни во текст" 
                                                Visible="False" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="tbPostoeckaSlika_Id" runat="server" BorderColor="White" 
                                                BorderStyle="None" BorderWidth="0px" ForeColor="White" 
                                                style="text-align: right" Width="16px"></asp:TextBox>
                                        </td>
                                        <td class="style14" valign="top">
                                            &nbsp;</td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style52" valign="top">
                                            Прикачи слика:</td>
                                        <td class="style22" valign="top">
                                            <asp:FileUpload ID="fuImage" runat="server" CssClass="style44" />
                                            <asp:Button ID="btnImportImage" runat="server" CausesValidation="False" 
                                                CssClass="style44" onclick="btnImportImage_Click" 
                                                onclientclick="javascript:return confirm('Дали сте сигурни за прикачување на слика?');" 
                                                Text="Upload" Width="67px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                        <td class="style14" valign="top">
                                            &nbsp;</td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style52" valign="top">
                                            &nbsp;</td>
                                        <td class="style22" valign="top">
                                            <asp:Panel ID="pnlCrop" runat="server" style="text-align: left" 
                                                Visible="False" BorderColor="#333333" BorderStyle="Dotted" 
                                                BorderWidth="1px">
                                                <asp:Image ID="imgImageToCrop" runat="server" BorderColor="Gray" 
                                                    BorderStyle="Groove" BorderWidth="3px" ImageAlign="Middle" />
                                                <br />
                                                <br />
                                                <asp:Button ID="btnCrop" runat="server" CssClass="ButtonBlue" 
                                                    onclick="btnCrop_Click" Text="Исечи" CausesValidation="False" 
                                                    onclientclick="javascript:return confirm('Дали сте сигурни за сечење на сликата?');" />
                                                &nbsp;<asp:Button ID="btnVmetniVoTekst" runat="server" CssClass="ButtonBlue" 
                                                    onclick="btnVmetniVoTekst_Click" Text="Вметни во текст" 
                                                    CausesValidation="False" />
                                                <br />
                                            </asp:Panel>
                                        </td>
                                        <td class="style14" valign="top">
                                            &nbsp;</td>
                                        <td valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style51" valign="top">
                                            &nbsp;</td>
                                        <td class="style24" valign="top">
                                            <asp:CheckBox ID="cbZaNaslovna" runat="server" AutoPostBack="True" 
                                                oncheckedchanged="cbZaNaslovna_CheckedChanged" 
                                                Text="Дали да се појави на насловна?" Width="300px" />
                                            <asp:Panel ID="pnlZaNaslovna" runat="server" Visible="False" Width="523px" 
                                                BorderStyle="Dotted" BorderWidth="1px">
                                                &nbsp;&nbsp;&nbsp; <span class="style45">Прикачи слика (мала) што ќе стои во 
                                                вестите на насловна:</span><br /> &nbsp;&nbsp;
                                                <asp:FileUpload ID="fuImageMala" runat="server" CssClass="style44" />
                                                <asp:Button ID="btnImportImageMala" runat="server" CausesValidation="False" 
                                                    CssClass="style44" onclick="btnImportImageMala_Click" 
                                                    onclientclick="javascript:return confirm('Дали сте сигурни за прикачување на слика?');" 
                                                    Text="Upload" Width="67px" />
                                                &nbsp;
                                                <asp:Panel ID="pnlZaNaslovnaSlika" runat="server" Visible="False">
                                                    &nbsp;&nbsp;
                                                    <asp:Image ID="imgError1" runat="server" ImageUrl="~/Images/wrong.png" />
                                                    &nbsp;<asp:Label ID="lblZaNaslovnaSlika" runat="server" 
                                                        style="font-size: small; color: #FF0000; font-weight: 700" 
                                                        Text="Мора да внесете слика!"></asp:Label>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlCropMala" runat="server" BorderColor="#333333" 
                                                    BorderStyle="Dotted" BorderWidth="1px" style="text-align: left" Visible="False">
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:Image ID="imgImageToCropMala" runat="server" BorderColor="Gray" 
                                                        BorderStyle="Groove" BorderWidth="3px" ImageAlign="Middle" />
                                                    <br />
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCropMala" runat="server" CausesValidation="False" 
                                                        CssClass="ButtonBlue" onclick="btnCropMala_Click" 
                                                        onclientclick="javascript:return confirm('Дали сте сигурни за сечење на сликата?');" 
                                                        Text="Исечи" />
                                                    &nbsp;<asp:Button ID="btnZacuvajMala" runat="server" CausesValidation="False" 
                                                        CssClass="ButtonBlue" onclick="btnZacuvajMala_Click" 
                                                        Text="Зачувај со димензии" />
                                                    &nbsp;
                                                    <asp:Panel ID="pnlZaNaslovnaZacuvaj" runat="server" Visible="False">
                                                        &nbsp;&nbsp;
                                                        <asp:Image ID="imgError2" runat="server" ImageUrl="~/Images/wrong.png" />
                                                        &nbsp;<asp:Label ID="lblZaNaslovna" runat="server" 
                                                            style="font-size: small; color: #FF0000; font-weight: 700" 
                                                            Text="Мора да ја зачувате сликата со димензии!"></asp:Label>
                                                    </asp:Panel>
                                                </asp:Panel>
                                            </asp:Panel>
                                            <br />
                                        </td>
                                        <td class="style25" valign="top">
                                            &nbsp;</td>
                                        <td class="style26" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style51" valign="top">
                                            &nbsp;</td>
                                        <td class="style24" colspan="3" valign="top">
                                            <asp:CheckBox ID="cbZaSlideShow" runat="server" AutoPostBack="True" 
                                                oncheckedchanged="cbZaSlideShow_CheckedChanged" 
                                                Text="Дали да се врти во Slide-Show?" Width="300px" />
                                            <asp:Panel ID="pnlZaSlideShow" runat="server" BorderStyle="Dotted" 
                                                BorderWidth="1px" Visible="False" Width="700px">
                                                &nbsp;&nbsp;&nbsp; <span class="style45">Прикачи слика (голема) што ќе се врти 
                                                на Slide Show - то на главната страница:</span><br /> &nbsp;&nbsp;
                                                <asp:FileUpload ID="fuImageGolema" runat="server" CssClass="style44" />
                                                <asp:Button ID="btnImportImageGolema" runat="server" CausesValidation="False" 
                                                    CssClass="style44" onclick="btnImportImageGolema_Click" 
                                                    onclientclick="javascript:return confirm('Дали сте сигурни за прикачување на слика?');" 
                                                    Text="Upload" Width="67px" />
                                                <asp:Panel ID="pnlZaSlideShowSlika" runat="server" Visible="False">
                                                    &nbsp;&nbsp;
                                                    <asp:Image ID="imgError4" runat="server" ImageUrl="~/Images/wrong.png" />
                                                    &nbsp;<asp:Label ID="lblZaSlideShowSlika" runat="server" 
                                                        style="font-size: small; color: #FF0000; font-weight: 700" 
                                                        Text="Мора да внесете слика!"></asp:Label>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlCropGolema" runat="server" BorderColor="#333333" 
                                                    BorderStyle="Dotted" BorderWidth="1px" style="text-align: left" Visible="False">
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:Image ID="imgImageToCropGolema" runat="server" BorderColor="Gray" 
                                                        BorderStyle="Groove" BorderWidth="3px" ImageAlign="Middle" />
                                                    <br />
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCropGolema" runat="server" CausesValidation="False" 
                                                        CssClass="ButtonBlue" onclick="btnCropGolema_Click" 
                                                        onclientclick="javascript:return confirm('Дали сте сигурни за сечење на сликата?');" 
                                                        Text="Исечи" />
                                                    &nbsp;<asp:Button ID="btnZacuvajGolema" runat="server" CausesValidation="False" 
                                                        CssClass="ButtonBlue" onclick="btnZacuvajGolema_Click" 
                                                        Text="Зачувај со димензии" />
                                                    &nbsp;
                                                    <asp:Panel ID="pnlZaSlideShowZacuvaj" runat="server" Visible="False">
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
                                        <td class="style53" valign="top">
                                            &nbsp;</td>
                                        <td class="style22" valign="top">
                                            &nbsp;</td>
                                        <td class="style14" colspan="2" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style53" valign="top">
                                            <asp:Button ID="btnVnesi" runat="server" CssClass="ButtonBlue" 
                                                onclick="btnVnesi_Click" 
                                                onclientclick="javascript:return confirm('Дали сте сигурни за додавање на вест?');" 
                                                Text="Внеси" Width="91px" ValidationGroup="1" />
                                        </td>
                                        <td class="style22" valign="top">
                                            &nbsp;</td>
                                        <td class="style14" colspan="2" valign="top">
                                            &nbsp;</td>
                                    </tr>
                                </table>

                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
        tinyMCE.init({
            mode: "textareas",
            theme: "advanced",
            plugins: "safari,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,imagemanager,filemanager",
            theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: false,
            template_external_list_url: "js/template_list.js",
            external_link_list_url: "js/link_list.js",
            external_image_list_url: "js/image_list.js",
            media_external_list_url: "js/media_list.js",
            height: 550
        });
</script>
 
 <script language="Javascript" type="text/javascript">
     var jcrop_Obj;
     jQuery(document).ready(function () {
         jcrop_Obj = jQuery('#<%=imgImageToCrop.ClientID%>').Jcrop({
             onChange: CaptureImageArea,
             onSelect: CaptureImageArea,
             setSelect: [0, 0, 500, 500],
             boxWidth: 500, 
             bgColor: 'white',
             allowMove: true, allowResize: true, allowSelect: true
         });
     });

     jQuery(document).ready(function () {
         jcrop_Obj = jQuery('#<%=imgImageToCropMala.ClientID%>').Jcrop({
             onChange: CaptureImageArea,
             onSelect: CaptureImageArea,
             setSelect: [0, 0, 500, 500],
             boxWidth: 500,
             bgColor: 'white',
             allowMove: true, allowResize: true, allowSelect: true
         });
     });

     jQuery(document).ready(function () {
         jcrop_Obj = jQuery('#<%=imgImageToCropGolema.ClientID%>').Jcrop({
             onChange: CaptureImageArea,
             onSelect: CaptureImageArea,
             setSelect: [0, 0, 565, 290],
             boxWidth: 700,
             bgColor: 'white',
             allowMove: true, allowResize: false, allowSelect: false
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

<script type="text/javascript">
    function ShowDialog() {
        var rtvalue = window.showModalDialog("Site_Sliki.aspx");
        for (i = 0; i < rtvalue.length; i++) {
            alert(rtvalue[i]);
        }
    }
    </script>


<script type="text/javascript">
    function InvokePop(fname)
{
        val = document.getElementById(fname).value;
        // to handle in IE 7.0          
        if (window.showModalDialog)
        {      
            retVal = window.showModalDialog("Site_Sliki.aspx?Control1=" + fname + "&ControlVal=" + val ,'Show Popup Window',"dialogHeight:600px,dialogWidth:800px,resizable:yes,center:yes,");
            document.getElementById(fname).value = retVal;
        }
        // to handle in Firefox
        else
        {     
            retVal = window.open("Site_Sliki.aspx?Control1="+fname + "&ControlVal=" + val,'Show Popup Window','height=600,width=800,resizable=yes,modal=yes');
            retVal.focus();           
        }         
}
   </script>
</asp:Content>

