﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="WebUserControl/Home.ascx" TagName="Home" TagPrefix="uc2" %>

<%@ Register Src="WebUserControl/Left.ascx" TagName="Left" TagPrefix="uc1" %>

<%@ Register Src="~/WebUserControl/top.ascx" TagName="top" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControl/foot.ascx" TagName="foot" TagPrefix="cc2" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>我的订单</title>
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
          <uc2:Home ID="Home1" runat="server" />    &nbsp;<uc1:Left ID="Left1" runat="server" />
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
        <td width="100%" style="height: 8px"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="19" style="height: 24px"><img src="images/aa-2_16.gif" width="19" height="24" alt="" /></td>
            <td bgcolor="#D8D8D8" class="red" style="height: 24px">&nbsp;&nbsp;&nbsp;&nbsp;我的订单</td>
            <td width="7" style="height: 24px"><img src="images/index_23.gif" width="7" height="24" alt="" /></td>
          </tr>
        </table></td>
      </tr>
      
              
        </table>
        <asp:GridView ID="gvOrderInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" Font-Size="12pt" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="gvOrderInfo_PageIndexChanging"
            PageSize="8" Width="748px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Label ID="Yanse" runat="server" Text='<%# Bind("Yanse") %>' Width="0px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="0px" />
                    
                      </asp:TemplateField>
                <asp:TemplateField HeaderText="订单编号">
                    <ItemTemplate>
                        <asp:Label ID="OrderID" runat="server" Text='<%# Bind("OrderID") %>' Width="87px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品名称">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookName") %>' Width="102px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品价格">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("BookPrice") %>' Width="57px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="90px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="数量">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("shuliang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("shuliang") %>' Width="87px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="90px" />
                </asp:TemplateField>           
           
                <asp:TemplateField HeaderText="订单状态">
                    <ItemTemplate>
                        <asp:Label ID="OrderStite" runat="server" Text='<%# Bind("OrderStite") %>' Width="67px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="90px" />
                </asp:TemplateField>
                     
                <asp:TemplateField HeaderText="订单时间">
                    <ItemTemplate>
                        <asp:Label ID="Ordertime" runat="server" Text='<%# Bind("Ordertime","{0:d}") %>'
                            Width="87px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="90px" />
                </asp:TemplateField>
                
             
                <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="OrderChk.aspx?OrderID={0}"
                    HeaderText="确认收货" Text="确认收货">
                    <ControlStyle Font-Underline="False" ForeColor="Black" />
                </asp:HyperLinkField>
             <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="orderPingjia.aspx?OrderID={0}"
                    HeaderText="评价" Text="评价">
                    <ControlStyle Font-Underline="False" ForeColor="Black" />
                </asp:HyperLinkField>
            <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Label ID="chiMa" runat="server" Text='<%# Bind("chiMa") %>' Width="0px"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="0px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </td>
      </tr>
    </table>
    <cc2:foot ID="foot" runat="server" />
    </form>
</body>
</html>
