<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMoney.aspx.cs" Inherits="AddMoney" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="WebUserControl/Home.ascx" TagName="Home" TagPrefix="uc2" %>




<%@ Register Src="WebUserControl/Left.ascx" TagName="Left" TagPrefix="uc1" %>

<%@ Register Src="~/WebUserControl/top.ascx" TagName="top" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControl/foot.ascx" TagName="foot" TagPrefix="cc2" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>在线充值</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />

<style type="text/css">

.white1 {color: #FFFFFF;
}
body {
	background-image: url(images/bg.gif);
}

</style>
    <link href="common/common.css" rel="stylesheet" type="text/css" />
    <link href="common/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <cc1:top ID="top" runat="server" />
     <table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="218" valign="top" bgcolor="#F6F6F6" rowspan="1" style="height: 471px">
     <table border="0" cellpadding="0" 
            cellspacing="0" style="width: 226px" >
      <tr>
        <td class="lefttt1" style="width: 299px; font-size: 18px; background-image: url(images/关键字条框.jpg); color: #ffffff; background-repeat: repeat-x; height: 28px;">
            频道导航</td>
      </tr>
     
      <tr>
        <td align="left" valign="top"  style="width: 299px; border-right: #009933 0.1mm solid; border-top: #009933 0.1mm solid; border-left: #009933 0.1mm solid; border-bottom: #009933 0.1mm solid; height: 107px;">
        <uc2:Home ID="Home1" runat="server" />
       <uc1:Left ID="Left1" runat="server" />
        </td>
      </tr>
      <tr>
        <td align="center" style="width: 299px; height: 15px;">
            &nbsp;</td>
      </tr>
    </table>
    </td>
    <td width="10" valign="top" style="height: 471px">&nbsp;</td>
    <td width="752" valign="top" style="height: 471px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%" style="height: 8px"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="19" style="height: 24px"><img src="images/aa-2_16.gif" width="19" height="24" alt="" /></td>
            <td bgcolor="#D8D8D8" class="red" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;在线充值</td>
            <td width="7" style="height: 24px"><img src="images/index_23.gif" width="7" height="24" alt="" /></td>
          </tr>
        </table></td>
      </tr>
      
              
        </table>
        <table align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td rowspan="1" style="width: 89px; height: 25px; text-align: center">
                    现在有金额：</td>
                <td style="width: 169px; height: 25px; text-: left">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
                <td style="width: 149px; height: 25px">
                </td>
            </tr>
            <tr>
                <td rowspan="1" style="width: 89px; height: 25px; text-align: center">
                    充值金额：</td>
                <td style="width: 169px; height: 25px; text-: left">
                    <asp:TextBox ID="txtLoginName" runat="server" Font-Size="12pt" Width="123px"></asp:TextBox>
                </td>
                <td style="width: 149px; height: 25px">
                    &nbsp;<asp:RequiredFieldValidator ID="rfvLoginName" runat="server" ControlToValidate="txtLoginName"
                        Font-Size="12pt" Height="1px" Width="117px">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="1" rowspan="1" style="text-: center">
                </td>
                <td style="width: 169px; height: 22px; text-: left">
                    &nbsp; &nbsp; &nbsp;
                    <asp:Button ID="btnRegister" runat="server" Font-Size="12pt" OnClick="btnRegister_Click"
                        Text="充值" />
                    &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                <td rowspan="1" style="width: 149px">
                </td>
            </tr>
        </table>
    </td>
      </tr>
    </table>
    <cc2:foot ID="foot" runat="server" />
    </form>
</body>
</html>
