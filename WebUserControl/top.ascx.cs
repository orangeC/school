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

public partial class WebUserControl_top : System.Web.UI.UserControl
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataList1.DataSource = data.GetDataReader("select * from  News ");
            DataList1.DataBind();
            if (Session["usersid"] != null)
            {
                Login1.Visible = true;
                Login2.Visible = false;

            }
            else
            {
                Login1.Visible = false;
                Login2.Visible = true;
            }


        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
      
        FormsAuthentication.SignOut();//清除验证信息
        HttpContext.Current.Session.Clear();//清除Session内容
        HttpContext.Current.Session.Abandon();//取消当前会话
        Response.Redirect("Default.aspx");
    }
}
