<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Left.ascx.cs" Inherits="WebUserControl_Left" %>


 <table width="218" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="leftmenutop">图书类别</td>
      </tr>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
        <tr>
        <td class="leftmenuli"><a href='BookTypeList.aspx?id=<%#Eval("id")%>'><span class="red">&nbsp;<%#Eval("Name")%></span></a></td>
      </tr>
        </ItemTemplate>
        </asp:Repeater>
      <tr>
      <td></td>
      </tr>
      
    </table>
    <table width="218" border="0" cellspacing="0" cellpadding="0">
   
      <tr>
      <td style="height: 15px" class="leftmenutop" >图书搜索</td>
      </tr>
    
    
       <tr>
      <td style="height: 15px"  >
          <table align="center" bgcolor="#e3ebfe" border="0" cellpadding="2" cellspacing="1"
              style="margin-top: 8px" width="98%">
              <tr bgcolor="#e7e7e7">
                  <td align="left" colspan="10" height="24">
                      图书名称：<asp:TextBox ID="txtName" runat="server" Style="border-right: #ffcc00 1px solid;
                          border-top: #ffcc00 1px solid; border-left: #ffcc00 1px solid; border-bottom: #ffcc00 1px solid"
                          Width="100px"></asp:TextBox></td>
              </tr>
              <tr bgcolor="#e7e7e7">
                  <td align="left" colspan="10" height="24">
                      图书类别：<asp:DropDownList ID="DropDownList1" runat="server" Width="98px">
                      </asp:DropDownList></td>
              </tr>
              <tr bgcolor="#e7e7e7">
                  <td align="left" colspan="10" style="height: 24px">
                      销售单价：从<asp:TextBox ID="BookMoney1" runat="server" Width="90px"></asp:TextBox><br />
                      销售单价到：<asp:TextBox ID="BookMoney2" runat="server" Width="87px"></asp:TextBox><br />
                      输入价格范围</td>
              </tr>
              <tr bgcolor="#e7e7e7">
                  <td align="left" colspan="10" height="24">
                      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜索" /></td>
              </tr>
          </table>
      </td>
      </tr>
    </table>
        