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
