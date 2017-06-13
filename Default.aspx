<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="WebUserControl/Left.ascx" TagName="Left" TagPrefix="uc1" %>

<%@ Register Src="~/WebUserControl/top.ascx" TagName="top" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControl/foot.ascx" TagName="foot" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上书店</title>

<link href="css/css.css" rel="stylesheet" type="text/css" />

<style type="text/css">

.white1 {color: #FFFFFF;
}
body {
	background-image: url(images/bg.gif);
}
    .style2
    {
        height: 6px;
    }
</style>
    <link href="common/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <cc1:top ID="top" runat="server" />
    <table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td height="5" colspan="3" valign="top"></td>
  </tr>
  <tr>
    <td width="3" valign="top" style="height: auto">&nbsp;</td>
    <td valign="top" style="width: 490px; height: auto;"><table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
      <tr>
        <td style="height: auto"></td>
        <td align="center" class="cpzs" style="height: auto"><table border="0" cellspacing="0" cellpadding="0" style="width: 100%">
           
            <tr>
              <td align="center" style="height: auto"><asp:DataList ID="DataList1" runat="server" 
                         RepeatColumns="3" Width="99%" >
                <ItemTemplate>
                 <table>
                                    <tr>
                                        <td>
                                            <a class="highlightit" href='ShowShoes.aspx?id=<%#Eval("ShoesID") %>'>
                                                <img alt="" border="0" src='<%#Eval("ShoesPhoto")%>' style="width: 240px; height: 151px" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href='ShowShoes.aspx?id=<%#Eval("ShoesID") %>'>
                                                <%#Eval("ShoesName")%>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                
                
              
                </ItemTemplate>
                </asp:DataList></td>
              
            </tr>
        </table></td>
        <td align="center" style="width: 3px; height: auto;"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top" style="width: 218px"><table border="0" cellpadding="0" 
            cellspacing="0" style="width: 226px" >
      <tr>
        <td class="lefttt1" style="width: 299px; font-size: 18px; background-image: url(images/关键字条框.jpg); color: #ffffff; background-repeat: repeat-x; height: 55px;">
            频道导航</td>
      </tr>
     
      <tr>
        <td align="left" valign="top"  style="width: 299px; border-right: #009933 0.1mm solid; border-top: #009933 0.1mm solid; border-left: #009933 0.1mm solid; border-bottom: #009933 0.1mm solid; height: 107px;">
            &nbsp;<uc1:Left ID="Left1" runat="server" />
        </td>
      </tr>
      <tr>
        <td align="center" style="width: 299px; height: 15px;"></td>
      </tr>
    </table></td>
    <td valign="top" style="width: 740px"><table border="0" cellspacing="0" cellpadding="0" style="width: 739px;border-right: #009933 0.1mm solid; border-top: #009933 0.1mm solid;  border-bottom: #009933 0.1mm solid;">
      <tr>
        <td width="100%" style="font-size: 18px; background-image: url(images/关键字条框.jpg); color: #ffffff; background-repeat: repeat-x; height: 55px" >
            热门款式</td>
      </tr>
      
      <tr>
        <td valign="top" align="center"  style="height: 108px;"><asp:DataList ID="DataList2" runat="server" 
                         RepeatColumns="3" Width="99%" RepeatDirection="Horizontal" >
                <ItemTemplate>
                <table>
                                    <tr>
                                        <td>
                                            <a class="highlightit" href='ShowShoes.aspx?id=<%#Eval("ShoesID") %>'>
                                                <img alt="" border="0" src='<%#Eval("ShoesPhoto")%>' style="width: 223px; height: 151px" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href='ShowShoes.aspx?id=<%#Eval("ShoesID") %>'>
                                                <%#Eval("ShoesName")%>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                
                </ItemTemplate>
            </asp:DataList></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="10" colspan="2" valign="top"></td>
  </tr>
</table>
<cc2:foot ID="foot" runat="server" />
    </form>
</body>
</html>
