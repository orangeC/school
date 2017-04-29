using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class orderPingjia : System.Web.UI.Page
{

    SqlHelper data = new SqlHelper();
    public string OrderStite;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["Orderid"].ToString();
        SqlHelper data = new SqlHelper();
        SqlDataReader dr;
        string sql = "select * from tb_Order where Orderid='" + id + "'";
        dr = data.GetDataReader(sql);
        dr.Read();
        OrderStite = dr["OrderStite"].ToString();

        if (OrderStite == "货已到")
        {
            data.RunSql("update tb_Order set pingjia='" + DropDownList1.SelectedValue + "',pingjiacontent='" + TextBox1.Text + "' where Orderid='" + id + "'");
            Alert.AlertAndRedirect("评价成功", "MyOrder.aspx");

        }
        else if (OrderStite == "未发货")
        {
            Alert.AlertAndRedirect("还没有发货您不能操作订单", "MyOrder.aspx");
        }
        else
        {
            Alert.AlertAndRedirect("您还没收货请收货后在进行评价", "MyOrder.aspx");

        }



    }
}
