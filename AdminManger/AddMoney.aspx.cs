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
public partial class AdminManger_AddMoney : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
                SqlDataReader dr;
                dr = data.GetDataReader("select * from  Member  where MemberID='" + Request.QueryString["id"].ToString() + "'");
                if (dr.Read())
                {
                    Label1.Text = dr["MemberMoney"].ToString();
                }
           
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (float.Parse(txtLoginName.Text) <= 0)
        {
            Alert.AlertAndRedirect("对比起金额必须大于0", "AddMoney.aspx");
        }

        else
        {

            data.RunSql("update Member set MemberMoney=MemberMoney+" + Convert.ToDecimal(txtLoginName.Text) + " where MemberID='" + Request.QueryString["id"].ToString() + "'");
            Alert.AlertAndRedirect("操作成功", "UserList.aspx");
        }
    }
}
