<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMoney.aspx.cs" Inherits="AdminManger_AddMoney" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css"/>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    <table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e3ebfe" align="center">
<tr>
 <td height="26" >
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td align="center" style="height: 22px">
      会员金额管理</td>
 </tr>
</table>
</td>
</tr>
</table>
    </div>
        <table align="center" bgcolor="#e3ebfe" border="0" cellpadding="2" cellspacing="1"
            style="margin-top: 8px" width="98%">
            <tr align="right" bgcolor="#eef4ea">
                <td align="center" colspan="10" height="36">
                    <span style="font-family: Times New Roman">
                        <table align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td rowspan="1" style="width: 89px; height: 25px; text-align: center">
                                    现在有金额：</td>
                                <td style="width: 169px; height: 25px; text-: left">
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
                                <td style="width: 149px; color: #000000; height: 25px">
                                </td>
                            </tr>
                            <tr style="color: #000000">
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
                                    &nbsp; &nbsp; &nbsp;&nbsp;</td>
                                <td rowspan="1" style="width: 149px">
                                </td>
                            </tr>
                        </table>
                    </span></td>
            </tr>
        </table>
    </form>
</body>
</html>
