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
using System.IO;
using System.Data.SqlClient;
public partial class AdminManger_ModifyF : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList3.DataSource = data.GetDataReader("select * from Suppliers ");
            DropDownList3.DataTextField = "SName";
            DropDownList3.DataValueField = "id";
            DropDownList3.DataBind();
            DropDownList1.DataSource = data.GetDataReader("select * from Booktype");
            DropDownList1.DataValueField = "id";
            DropDownList1.DataTextField = "name";
            DropDownList1.DataBind();
         string   sql = "select * from Book where BookID=" + Request.QueryString["id"].ToString();
            getdata(sql);
        }
    }
    private void getdata(string sql)
    {
        SqlDataReader dr = data.GetDataReader(sql);
        if (dr.Read())
        {
            title.Text = dr["BookName"].ToString();
            TextBox2.Text = dr["BookPrice"].ToString();
            TextBox3.Text = dr["BookNum"].ToString();

            content1.Value = dr["BookIntroduce"].ToString();
            pic.Text = dr["BookPhoto"].ToString();
            Image1.ImageUrl = "../" + dr["BookPhoto"].ToString();
            DropDownList1.Items.FindByValue(dr["BookTypeID"].ToString()).Selected = true;
            DropDownList1.Items.FindByText(dr["BookTypeName"].ToString()).Selected = true;
            DropDownList3.Items.FindByText(dr["Suppliers"].ToString()).Selected = true;
         

        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string res;
        upload up = new upload();
        res = up.Up(file1, "../uploadfiles/");
        this.Label1.Visible = true;
        this.Label1.Text = up.Resup[Convert.ToInt32(res)];
        this.pic.Text = up.s;
        Image1.ImageUrl = "../" + pic.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "update Book set BookName='" + title.Text.ToString().Trim() + "',BookPrice='" + TextBox2.Text + "',BookNum='" + TextBox3.Text + "',BookIntroduce='" + content1.Value + "' ,BookPhoto='" + pic.Text + "',BookTypeID='" + DropDownList1.SelectedValue + "',BookTypeName='" + DropDownList1.SelectedItem.Text + "'  where BookID=" + Request.QueryString["id"].ToString();
        data.RunSql(sql);
        Alert.AlertAndRedirect("修改成功", "BookManger.aspx");
    }
}
