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
public partial class AdminManger_OrderChk : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    public string OrderStite;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
            string id = Request.QueryString["Orderid"].ToString();    
           
            SqlHelper data = new SqlHelper();
            SqlDataReader dr;
            string sql = "select * from tb_OrderInfo where Orderid='" + id + "'";
            dr = data.GetDataReader(sql);
            dr.Read();
            string sql1 = "select * from tb_Order where Orderid='" + id + "'";
            SqlDataReader sd;
            sd = data.GetDataReader(sql1);
            sd.Read();
            OrderStite = sd["OrderStite"].ToString();
            int num =Convert.ToInt32( dr["shuliang"].ToString());
            string Shoesid = dr["ShoesID"].ToString();
            if (OrderStite == "已经发货")
            {
                Alert.AlertAndRedirect("该订单已经发货", "OrderManger.aspx");

            }
            else
            {

                data.RunSql("update  Book set ShoesNum=ShoesNum-'" + num + "' where ShoesID='" + Shoesid + "'");
                data.RunSql("update tb_Order set OrderStite='已经发货' where Orderid='" + id + "'");
                Alert.AlertAndRedirect("操作成功", "OrderManger.aspx");

            }
        }

    
  
}
