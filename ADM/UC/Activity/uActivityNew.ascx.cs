using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activity_uActivityNew : BaseUserControl
{
    public int ActivityID { get { return int.Parse(hdActivityID.Value); } set { hdActivityID.Value = value.ToString(); } }
    public int CategoryID { get { return int.Parse(ddlActivityCategories.SelectedValue); } }
    public bool IsSaved
    {
        get { return (ViewState["IsSaved"] == null ? false : Convert.ToBoolean((ViewState["IsSaved"]))); }
        set { ViewState["IsSaved"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();

            if (ActivityID > 0)
                FillData();
        }
    }

    protected void FillData()
    {
        DataTable dt = BUS.Activities.GetActivityDetail(this.ActivityID);
        if ((dt != null) && (dt.Rows.Count > 0))
        {
            ddlActivityCategories.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
            ddlLocationID.SelectedValue = dt.Rows[0]["LocationID"].ToString();
            txtActivityTitle.Text = dt.Rows[0]["ActivityTitle"].ToString();
            txtActivityHeader.Text = dt.Rows[0]["ActivityHeader"].ToString();
            txtActivityDetail.Text = dt.Rows[0]["ActivityDetail"].ToString();
            txtPlace.Text = dt.Rows[0]["Place"].ToString();
            txtActivityDate.Text = dt.Rows[0]["ActivityDate"].ToString();
            txtActivityStartDate.Text = dt.Rows[0]["ActivityStartDate"].ToString();
            txtActivityEndDate.Text = dt.Rows[0]["ActivityEndDate"].ToString();
            chIsShowMainPage.Checked = Convert.ToBoolean(dt.Rows[0]["IsShowMainPage"]);
            txtShowMainStartDate.Text = dt.Rows[0]["ShowMainStartDate"].ToString();
            txtShowMainStartDate.Enabled = chIsShowMainPage.Checked;
            txtUserCount.Text = dt.Rows[0]["UserCount"].ToString();
            txtAlternateUserCount.Text = dt.Rows[0]["AlternateUserCount"].ToString();
            ddlInvitePeopleCount.SelectedValue = dt.Rows[0]["InvitePeopleCount"].ToString();
            chHasService.Checked = Convert.ToBoolean(dt.Rows[0]["HasService"]);
            rdActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
            rdInactive.Checked = !rdActive.Checked;

            imgActivity.ImageUrl = "~/" + COM.Util.genPhotoUrl(this.Config(COM.ADM.EnumUtil.Config.PathActivityImg), dt.Rows[0]["ActivityPhoto"].ToString());
            pnlEdit.Visible = true;
            hlActivityRelations.NavigateUrl = "~/ActivityNew.aspx?j=" + this.ActivityID.ToString() + "&c=" + this.CategoryID.ToString() + "&qo=3";
            hlActivityDetailLink.NavigateUrl += this.ActivityID.ToString();

            hlJoinsUsers.NavigateUrl = "~/UserActivities.aspx?j=" + this.ActivityID.ToString();

            DataTable dtInviteLabels = BUS.InvitePeople.GetInvitePeopleInfo(this.ActivityID);
            if (dtInviteLabels.Rows.Count > 0)
            {
                txtInviteLabel1.Text = dtInviteLabels.Rows[0]["Label1"].ToString();
                txtInviteLabel2.Text = dtInviteLabels.Rows[0]["Label2"].ToString();
                txtInviteLabel3.Text = dtInviteLabels.Rows[0]["Label3"].ToString();
                txtInviteLabel4.Text = dtInviteLabels.Rows[0]["Label4"].ToString();
                txtInviteLabel5.Text = dtInviteLabels.Rows[0]["Label5"].ToString();
                txtInviteLabel6.Text = dtInviteLabels.Rows[0]["Label6"].ToString();
            }
        }
    }

    protected void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlLocationID, BUS.Locations.GetLocations(), "LocationName", "LocationID", "", "Şehir Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlActivityCategories, BUS.Categories.GetCategories(), "CategoryName", "CategoryID", "", "Etkinlik Kategorisini Seçiniz", "0");

        LIB.DataBindHelper.LoadNumberDDL(ref ddlInvitePeopleCount, 10, 1, 0);
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        int ActivityID = int.Parse(hdActivityID.Value);
        int returnID = BUS.Activities.ActivityNew(ActivityID, int.Parse(ddlActivityCategories.SelectedValue), int.Parse(ddlLocationID.SelectedValue), txtActivityTitle.Text,
            txtActivityHeader.Text, txtActivityDetail.Text, txtPlace.Text, txtActivityDate.Text, DateTime.Parse(txtActivityStartDate.Text), DateTime.Parse(txtActivityEndDate.Text),
            chIsShowMainPage.Checked, txtShowMainStartDate.Text, int.Parse(txtUserCount.Text), int.Parse(txtAlternateUserCount.Text), int.Parse(ddlInvitePeopleCount.SelectedValue),
            chHasService.Checked, rdActive.Checked, this.smAdminID, txtInviteLabel1.Text, txtInviteLabel2.Text, txtInviteLabel3.Text, txtInviteLabel4.Text, txtInviteLabel5.Text, txtInviteLabel6.Text);

        if (ActivityID < 1)
        {
            this.IsSaved = (returnID > 0);
            if (IsSaved)
                hdActivityID.Value = returnID.ToString();
            else
                uError1.Visible = true;
        }
        else
        {
            uSuccess1.Visible = (returnID > 0);
            uError1.Visible = !uSuccess1.Visible;
        }
    }

    protected void chIsShowMainPage_CheckedChanged(object sender, EventArgs e)
    {
        txtShowMainStartDate.Enabled = chIsShowMainPage.Checked;
    }
    protected void lnkActivityEditPhoto_Click(object sender, EventArgs e)
    {
        this.IsSaved = true;
    }
}