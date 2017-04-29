﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.SqlClient;
public partial class ShowShoes : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinderReplay();
            string sql = "select * from Shoes where ShoesID=" + Request.QueryString["id"].ToString();
            getdata(sql);
            data.RunSql("update Shoes set ShoesClick=ShoesClick+1 where ShoesID="+Request.QueryString["id"].ToString());
        }
    }
    private void getdata(string sql)
    {
        SqlDataReader dr = data.GetDataReader(sql);
        if (dr.Read())
        {
            Label1.Text = dr["ShoesName"].ToString();
            Label2.Text = dr["ShoesName"].ToString();
            Label4.Text = dr["ShoesPrice"].ToString();
            Label5.Text= dr["ShoesNum"].ToString();
            DIV1.InnerHtml = dr["ShoesIntroduce"].ToString();
            Label6.Text = dr["ShoesClick"].ToString();
            iGPhoto.ImageUrl = dr["ShoesPhoto"].ToString();
            Label3.Text = dr["ShoesTypeName"].ToString();
       
            Hidden1.Value = dr["ShoesTypeID"].ToString();
        }

    }
    protected void btnShop_Click(object sender, EventArgs e)
    {
        //异常处理，数量必须是正整数
        int store =Convert.ToInt32(  Label5.Text);
         int num =0;
        try
        {
          num = Convert.ToInt32(TextBox1.Text);
        }
        catch(Exception ex)
        {
            //弹出窗口并跳转到指定的页面
            Alert.AlertAndRedirect(ex.Message,"ShowShoes.aspx?id="+Request.QueryString["id"]);
        }
        if (store < num)
        {
            Label8.Text = "购买数量不能大于库存";
            return;
        }
        if (num< 1)
        {
            Label8.Text = "数量不能小于1";
            return;

        }
        else
        {

            string Orderid;
            if (Session["users"] == null)
            {
                Alert.AlertAndRedirect("您还没有登录，请登录后再购买，谢谢合作！", "Login.aspx");

            }
            else
            {
                string a = Session["users"].ToString();
                SqlDataReader dr = data.GetDataReader("select top 1 * from tb_Order where IsCheckout='否' and  Ordeuser='" + Session["users"].ToString() + "' order by id desc  ");
                if (dr.Read())
                {
                    Orderid = dr["Orderid"].ToString();
                }
                else
                {
                    Orderid = DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();
                    string sqlOrder = "insert into tb_Order(Orderid,Ordeuser,OrderStite)values('" + Orderid + "','" + Session["users"].ToString() + "','未发货')";
                    data.RunSql(sqlOrder);
                }
                sqlconn.Open();
                string strid = Page.Request.QueryString["ShoesID"];
                string sqlstr = "insert into tb_OrderInfo"
                    + "(OrderID,OrderMember,ShoesID,ShoesName,ShoesTypeID,ShoesTypeName,ShoesPrice,IsCheckout,shuliang,Yanse,chiMa)"
                    + " values('" + Orderid + "','" + Session["users"].ToString() + "','" + Request.QueryString["id"].ToString() + "','"
                    + Label2.Text + "','" + Hidden1.Value + "','" + Label3.Text + "','" + Label4.Text + "','否','" + TextBox1.Text + "','"
                    + DropDownList1.Text + "','"
                    + DropDownList2.Text + "')";
                data.RunSql(sqlstr);
                Response.Redirect("Shopping.aspx");
            }
        }
    }
    private void BinderReplay()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        string sql = "select * from  Comment where ShoesId=" + id;
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        PagedDataSource objPds = new PagedDataSource();
        objPds.DataSource = ds.Tables[0].DefaultView;

        objPds.AllowPaging = true;
        objPds.PageSize = 5;

        int CurPage;
        if (Request.QueryString["Page"] != null)
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        else
            CurPage = 1;

        objPds.CurrentPageIndex = CurPage - 1;
        lblCurrentPage.Text = CurPage.ToString();
        lblSumPage.Text = objPds.PageCount.ToString();

        if (!objPds.IsFirstPage)
        {
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1 + "&id=" + id;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1) + "&id=" + id;
        }

        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount + "&id=" + id;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1) + "&id=" + id;
        }

        this.DataList2.DataSource = objPds;
        this.DataList2.DataBind();
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        if (Session["usersid"] == null)
        {
            Alert.AlertAndRedirect("您还没有登录不能评论", "Default.aspx");

        }
        else
        {

            data.RunSql("insert into  Comment(UserId,UserName,ShoesId,Titles)values('" + Session["usersid"].ToString() + "','" + Session["users"].ToString() + "','" + id + "','" + TextBox2.Text + "')");
            BinderReplay();
            Alert.AlertAndRedirect("评论成功", "ShowShoes.aspx?id=" + id);
        }
    }
    
}
