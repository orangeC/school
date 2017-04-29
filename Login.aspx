<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ Register Src="WebUserControl/Left.ascx" TagName="Left" TagPrefix="uc1" %>

<%@ Register Src="~/WebUserControl/top.ascx" TagName="top" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControl/foot.ascx" TagName="foot" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>用户登录</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
html,body{width:100%;height:100%;}
body{height: 100%;background-repeat: no-repeat;background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));}
#TABLE1{    background-color: #F7F7F7;padding: 40px;margin-top:100px;}
#table2{    background-color: #F7F7F7;padding: 40px;margin-top:100px;}

</style>
</head>
<body>
    <form id="form1" runat="server">
     
        <table style="width: 50%" align="center">
            <tr>
                <td align="center" style="width: 100%">
                    <table id="TABLE1" runat="server" cellpadding="0" cellspacing="0" >
                        <tr>
                            <td align="center" height="90" style="width: 100%" valign="top">
                                <table cellpadding="0" cellspacing="0" height="123" style="width: 277px">
                                    <tr>
                                        <td style="height: 133px">
											<h1 align="center">网上书店用户登录</h1>
                                            <table cellpadding="0" cellspacing="0" height="120" style="width: 100%">
                                                <tr>
                                                    <td align="center" class="huicu" height="29" style="width: 87px">
                                                        用户：</td>
                                                    <td align="left" width="70">
                                                        <asp:TextBox ID="txtMName" runat="server" Width="120px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" class="huicu" style="width: 87px">
                                                        密码：</td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtMPwd" runat="server" TextMode="Password" Width="120px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="height: 24px">
                                                        <a href="#"></a>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                                                            Text="登录" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="height: 19px">
                                                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#00C0C0" OnClick="LinkButton1_Click">注册</asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton2" runat="server"  ForeColor="#00C0C0" OnClick="LinkButton2_Click" CausesValidation="False">找回密码</asp:LinkButton></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table id="table2" runat="server" cellpadding="0" cellspacing="0" class="huicu" >
                        <tr>
                            <td align="center" bgcolor="#3399cc" style="height: 16px">
                                会员登陆信息</td>
                        </tr>
                        <tr>
                            <td style="height: 14px;" valign="top" align="center">
                                            <table style="width: 266px">
                                                <tr>
                                                    <td class="huicu" style="text-align: center">
                                                        欢迎<asp:Label ID="MName" runat="server" ForeColor="#FF8000" Width="107px"></asp:Label>光临！</td>
                                                </tr>
                                                <tr>
                                                    <td class="huicu" style="height: 16px; text-align: center">
                                                        <asp:LinkButton ID="lbtnLogout" runat="server" Font-Underline="False" ForeColor="Black"
                                                            OnClick="lbtnLogout_Click" Width="96px">注销</asp:LinkButton>
                                                        <asp:HyperLink ID="hlinkEdit" runat="server" Font-Underline="False" ForeColor="Black"
                                                            NavigateUrl="UserHome.aspx" Width="90px">用户中心</asp:HyperLink></td>
                                                    <td style="height: 16px">
                                                    </td>
                                                </tr>
                                            </table>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
      </tr>
    </table>
    </form>
</body>
</html>
