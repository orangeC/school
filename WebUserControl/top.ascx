<%@ Control Language="C#" AutoEventWireup="true" CodeFile="top.ascx.cs" Inherits="WebUserControl_top" %>
<link type="text/css" rel="stylesheet" href="common/common.css" />

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td align="center"  ><div class="top">
	
    <div class="topsr" align="right">
     
        <SPAN  runat=server id="Login1" class="text">
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="LinkButton1_Click">注销</asp:LinkButton>|<a href="Shopping.aspx">购物车</a>|<a href="MyOrder.aspx">我的订单</a>|</SPAN> <SPAN class="text" runat=server id="Login2"><a href="reg.aspx">用户注册</a>|<a href="Login.aspx">用户登录</a></SPAN>
       
    </div>
 
</div></td>
  </tr>
    <tr>
        <td align="center" style="height: 196px">

    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.jpg"  Height=196px  Width=980px/></td>
    </tr>
    <tr>
        <td align="center" style="height: 55px"><div class="head">
           <div class="nav" style="background-image: url(images/关键字条框.jpg)" >

	<ul >
    	<li><a href="Default.aspx">首页</a></li>
      
   <li><a href="NewsList.aspx">新闻资讯</a></li>
        <li><a href="NewShoesList.aspx">最新图书</a></li>
       
        <li><a href="HotShoesList.aspx">热门图书</a></li>
        <li><a href="AllShoesList.aspx">所有图书</a></li>
               <li ><a href="liuyan.aspx">留言板</a></li>
     <li><a href="Search.aspx">图书搜索</a></li>
    </ul>
</div>
</div>
        </td>
    </tr>
  <tr>
  
  <td>
   <marquee direction=right  scrollamount=6  onmouseover=this.stop()  behavior=alternate onmouseout=this.start() style="height: 154">
  <asp:DataList ID="DataList1" runat="server" RepeatColumns="12" RepeatDirection="Horizontal"
                            Width="707px">
                            <ItemTemplate>
                                
                            </ItemTemplate>
                        </asp:DataList></marquee>    
  </td>
  </tr>
</table>


