﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SuccShop.aspx.cs" Inherits="SuccShop" %>

<%@ Register Src="WebUserControl/Home.ascx" TagName="Home" TagPrefix="uc2" %>


<%@ Register Src="WebUserControl/Left.ascx" TagName="Left" TagPrefix="uc1" %>

<%@ Register Src="~/WebUserControl/top.ascx" TagName="top" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControl/foot.ascx" TagName="foot" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>购物车</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />

<style type="text/css">

.white1 {color: #FFFFFF;
}
body {
	background-image: url(images/bg.gif);
}

</style>
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
          <uc2:Home ID="Home1" runat="server" />  &nbsp;<uc1:Left ID="Left1" runat="server" />
        </td>
      </tr>
      <tr>
        <td align="center" style="width: 299px; height: 15px;"></td>
      </tr>
    </table>
    </td>
    <td width="10" valign="top" style="height: 471px">&nbsp;</td>
    <td width="752" valign="top" style="height: 471px"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%" height="8"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="19" style="height: 24px"><img src="images/aa-2_16.gif" width="19" height="24" alt="" /></td>
            <td bgcolor="#D8D8D8" class="red" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;确认订单</td>
            <td width="7" style="height: 24px"><img src="images/index_23.gif" width="7" height="24" alt="" /></td>
          </tr>
        </table></td>
      </tr>
      
              
        </table>
        <table cellpadding="0" cellspacing="0" style="width: 759px; height: 315px">
            <tr>
                <td align="center" colspan="3" style=" width: 916px;
                    color: #ff9966; height: 5px">
                    收货人信息</td>
            </tr>
            <tr>
                <td align="left" colspan="3" style="width: 916px; color: #ff9966; height: 5px">
                    收 件 人：<asp:Label ID="Label2" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="left" colspan="3" style="width: 916px; color: #ff9966; height: 5px">
                    收货地址：<asp:Label ID="Label3" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="left" colspan="3" style="width: 916px; color: #ff9966; height: 5px">
                    联系电话：<asp:Label ID="Label4" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="left" colspan="3" style="width: 916px;
                    color: #ff9966; height: 5px">
                    送货方式：<asp:DropDownList ID="DropDownList1" runat="server" Width="143px">
                        <asp:ListItem>快递</asp:ListItem>
                        <asp:ListItem>普通</asp:ListItem>
                        <asp:ListItem>上门</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="left" colspan="3" style=" width: 916px;
                    color: #ff9966; height: 5px">
                    付款方式：<asp:DropDownList ID="DropDownList2" runat="server" Width="144px">
                        <asp:ListItem>货到付款</asp:ListItem>
                        <asp:ListItem>先付款</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="center" colspan="3" style=" width: 916px;
                    color: #ff9966; height: 5px">
                    商品清单</td>
            </tr>
            <tr>
                <td align="left" colspan="3" style="width: 916px;
                    color: #ff9966; height: 49px">
                    <span style="font-size: 12pt; color: #808080">
                        <asp:GridView ID="gvOrderInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="12pt" ForeColor="#333333" GridLines="None" PageSize="8"
                            Width="760px">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="名称">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ShoesName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="类别">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShoesTypeName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="价格">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ShoesPrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="数量">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("shuliang") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("shuliang") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:Label ID="Label5" runat="server" Text="合计金额："></asp:Label><asp:Label ID="labMoney"
                            runat="server"></asp:Label>
                    </span>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="font-weight: bold; width: 916px;" align="center">
                  
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认订单" />
                 
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
