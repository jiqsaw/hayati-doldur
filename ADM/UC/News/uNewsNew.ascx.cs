using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_News_uNewsNew : BaseUserControl
{
    private int NewsID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();

            if (int.TryParse(Request.QueryString["j"], out NewsID))
                FillData();
        }
    }

    protected void FillData()
    {
        DataTable dt = BUS.News.GetNewsDetail(this.NewsID);
        if (dt.Rows.Count > 0)
        {
            hdNewsID.Value = this.NewsID.ToString();
            ddlActivities.SelectedValue = dt.Rows[0]["ActivityID"].ToString();
            txtNewsTitle.Text = dt.Rows[0]["NewsTitle"].ToString();
            txtNewsDetail.Text = dt.Rows[0]["NewsDetail"].ToString();
            txtNewsDate.Text = dt.Rows[0]["NewsDate"].ToString();     
            rdActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
            rdInactive.Checked = !rdActive.Checked;
        }
    }

    private void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlActivities, BUS.Activities.GetActivityList(), "ActivityTitle", "ActivityID", "0", "Lütfen Seçiniz", "0");
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        bool IsSave = BUS.News.Save(int.Parse(hdNewsID.Value), int.Parse(ddlActivities.SelectedValue), txtNewsTitle.Text, 
                                    txtNewsDetail.Text, Convert.ToDateTime(txtNewsDate.Text), this.smAdminID, rdActive.Checked);
        if (IsSave)
        {
            if (this.NewsID == 0)
                uSuccess1.Visible = true;
            else
                uSuccess2.Visible = true;
        }
        else
            uError1.Visible = true;
    }
}
