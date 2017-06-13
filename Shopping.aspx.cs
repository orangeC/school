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
public partial class Shopping : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["users"] == null)
            {
                Response.Write("<script>alert('您还没有登录，请登录后再使用该功能!');location='javascript:history.go(-1)';</script>");
            }
            else
            {

                SqlDataReader dr = data.GetDataReader("select top 1 * from tb_Order where IsCheckout='否' and  Ordeuser='" + Session["users"].ToString() + "' order by id desc  ");
                if (dr.Read())
                {
                    Label5.Text = dr["Orderid"].ToString();
                }
                BinderOrder();

            }
        }
    }
    protected void lbtnCheck_Click(object sender, EventArgs e)
    {
        if (labMoney.Text == "0")
        {
            Alert.AlertAndRedirect("您的购物车中没有任何物品", "Shopping.aspx");


        }
        else
        {
            SqlHelper data = new SqlHelper();
            SqlDataReader dr;
            dr = data.GetDataReader("select * from Member where MemberName='" + Session["users"].ToString() + "'");
            dr.Read();
            string MPrice = dr["MemberMoney"].ToString();
            if (Convert.ToInt32(MPrice) < Convert.ToInt32(labMoney.Text.Trim()))
            {

                Alert.AlertAndRedirect("您的余额不足，请重新充值后再购买", "AddMoney.aspx");


            }
            else
            {

                string sqlstrshop1 = "update Member set MemberMoney='"
                    + (Convert.ToInt32(MPrice) - Convert.ToInt32(labMoney.Text)) + "' where MemberName='" + Session["users"].ToString() + "'";
                data.RunSql(sqlstrshop1);

                Response.Redirect("SuccShop.aspx?OrderMember=" + Session["users"].ToString());
            }
        }
    }
    protected void lbtnClear_Click(object sender, EventArgs e)
    {
        string sqlstr = "delete from tb_OrderInfo where OrderMember='"
            + Session["users"].ToString() + "' and IsCheckout='否'";
        data.RunSql(sqlstr);
        Response.Redirect("Shopping.aspx");
    }
    protected void gvOrderInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvOrderInfo.PageIndex = e.NewPageIndex;
        gvOrderInfo.DataBind();
    }
    protected void gvOrderInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      
    }
    protected void gvOrderInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sqlstr = "delete from tb_OrderInfo where id='" + gvOrderInfo.DataKeys[e.RowIndex].Value + "'";
        data.RunSql(sqlstr);
        Response.Redirect("Shopping.aspx");
    }
    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {
    }

    protected void gvOrderInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlHelper mydata = new SqlHelper();
        string ID = gvOrderInfo.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            if (float.Parse(((TextBox)gvOrderInfo.Rows[e.RowIndex].FindControl("TextBox1")).Text) <= 0)
            {
                Label6.Text = "请填写正确的数量";

            }
            else
            {
                mydata.RunSql("update tb_OrderInfo  set shuliang ='" + ((TextBox)gvOrderInfo.Rows[e.RowIndex].FindControl("TextBox1")).Text + "'  where id=" + ID);

                gvOrderInfo.EditIndex = -1;
                BinderOrder();
            }
        }
        catch
        {

        }
    }
    protected void gvOrderInfo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvOrderInfo.EditIndex = e.NewEditIndex;
        BinderOrder();
    }
    protected void gvOrderInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvOrderInfo.EditIndex = -1;
        BinderOrder();
    }
    public void gvDataBind(GridView gv, string sqlstr)
    {
        sqlconn.Open();
        SqlDataAdapter myda = new SqlDataAdapter(sqlstr, sqlconn);
        DataSet myds = new DataSet();
        myda.Fill(myds);
        gv.DataSource = myds;
        gv.DataBind();
        sqlconn.Close();
    }
    private void BinderOrder()
    {
        string sqlstr = "select id,shuliang,OrderID,BookName,BookTypeName,BookPrice from tb_OrderInfo where OrderMember='" + Convert.ToString(Session["users"]) + "' and IsCheckout='否'";
        gvOrderInfo.DataKeyNames = new string[] { "id" };
        gvDataBind(gvOrderInfo, sqlstr);

        SqlHelper data = new SqlHelper();
        SqlDataReader dr1;
        dr1 = data.GetDataReader("select OrderID from tb_OrderInfo where OrderMember='" + Convert.ToString(Session["users"]) + "' and IsCheckout='否'");
        if (dr1.Read())
        {

            string sqlstrtprice = "select sum(BookPrice*shuliang) as tprice from tb_OrderInfo"
                + " where OrderMember='" + Convert.ToString(Session["users"]) + "' and IsCheckout='否'";

            SqlDataReader dr;
            dr = data.GetDataReader(sqlstrtprice);
            dr.Read();
            labMoney.Text = Convert.ToString(int.Parse(dr["tprice"].ToString()));


        }
        else
        {
            labMoney.Text = "0";

        }
    }
}
