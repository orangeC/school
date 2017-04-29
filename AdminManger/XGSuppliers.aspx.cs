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
public partial class AdminManger_XGSuppliers : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataReader dr;
            dr = data.GetDataReader("select * from Suppliers where id="+Request.QueryString["id"].ToString());
            if (dr.Read())
            {
                txtname.Text = dr["SName"].ToString();
                TextBox2.Text = dr["STel"].ToString();
                TextBox1.Text = dr["SUserName"].ToString();
                TextBox3.Text = dr["SDs"].ToString();
            }
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        data.RunSql("update Suppliers set SName='" + txtname.Text + "', STel='" + TextBox2.Text + "',SUserName='" + TextBox1.Text + "',SDs='"+TextBox3.Text+"' where id="+Request.QueryString["id"].ToString());
        Alert.AlertAndRedirect("修改成功", "SuppliersManger.aspx");
    }
}
