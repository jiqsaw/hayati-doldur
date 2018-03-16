using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activities_uActivityJoin : BaseUserControl
{
    public int ActivityID
    {
        get { return (ViewState["ActivityID"] == null ? 0 : int.Parse(ViewState["ActivityID"].ToString())); }
        set { ViewState["ActivityID"] = value; }
    }

    protected DataTable dtUserDetail;

    protected void Page_Load(object sender, EventArgs e)
    {

        if ((Request.Form[hdIsSend.UniqueID] != null) && (Request.Form[hdIsSend.UniqueID].ToString() == "1"))
            Join();

        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            if (!this.smIsLogin)
                this.qoLoginPage();

            if (LIB.Util.IsNumeric(Request.QueryString["j"]))
                this.ActivityID = Convert.ToInt32(Request.QueryString["j"]);
            else
                this.qoDefaultPage();

            FillData();
            BindData();

        }
    }

    private void FillData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlEducationLevelID, BUS.Educations.GetEducationLevels(), "EducationLevel", "EducationLevelID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlEducationStatusID, BUS.Educations.GetEducationStates(), "EducationStatus", "EducationStatusID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Educations.GetUniversities(), "UniversityName", "UniversityID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlLocationID, BUS.Locations.GetCities(), "LocationName", "LocationID", "0", "Lütfen Seçiniz", "0");
    }

    private void BindData()
    {
        DataTable dt = BUS.Activities.GetActivityDetail(this.ActivityID, this.smUserID);
        if ((dt == null) || (dt.Rows.Count < 1))
            this.qoDefaultPage();
        else
        {
            int UserCount = Convert.ToInt32(dt.Rows[0]["UserCount"]);
            int JoinCount = Convert.ToInt32(dt.Rows[0]["JoinCount"]);
            int AlternateUserCount = Convert.ToInt32(dt.Rows[0]["AlternateUserCount"]);
            int IsJoinUser = Convert.ToInt32(dt.Rows[0]["IsJoinUser"]);

            hdCategory.Value = dt.Rows[0]["CategoryName"].ToString();

            hdInvitePeopleInfoID.Value = "0";
            hdUserCount.Value = UserCount.ToString();
            hdJoinCount.Value = JoinCount.ToString();

            hdPhoto.Value = this.ImageUrl(COM.Enum.ImageTypes.Activity, dt.Rows[0]["ActivityPhoto"].ToString(), COM.Enum.PhotoSizes.Default100);
            hlActivityBack1.NavigateUrl = this.strActivityDetailPage(this.ActivityID, hdCategory.Value, dt.Rows[0]["ActivityTitle"].ToString());
            hlActivityBack2.NavigateUrl = this.strActivityDetailPage(this.ActivityID, hdCategory.Value, dt.Rows[0]["ActivityTitle"].ToString());

            if (IsJoinUser > 0)
                this.qoDefaultPage();

            if (JoinCount >= (UserCount + AlternateUserCount))
                this.qoDefaultPage();


            ltlActivityTitle.Text = dt.Rows[0]["ActivityTitle"].ToString();
            ltlActivityDate.Text = dt.Rows[0]["ActivityDate"].ToString();
            ltlPlace.Text = dt.Rows[0]["Place"].ToString();
            imgCategory.ImageUrl = imgCategory.ImageUrl.Replace("||CATEGORYID||", dt.Rows[0]["CategoryID"].ToString());            

            SetProfilData();

            imgBus.Visible = (Convert.ToBoolean(dt.Rows[0]["HasService"]));
            Service.Visible = imgBus.Visible;

           DataTable dtLabels = BUS.Activities.GetActivityLabels(this.ActivityID);
           if ((dtLabels != null) && (dtLabels.Rows.Count > 0))
           {
               hdInvitePeopleInfoID.Value = dtLabels.Rows[0]["InvitePeopleInfoID"].ToString();
               ltlLabel1.Text = dtLabels.Rows[0]["Label1"].ToString();
               ltlLabel2.Text = dtLabels.Rows[0]["Label2"].ToString();
               ltlLabel3.Text = dtLabels.Rows[0]["Label3"].ToString();
               ltlLabel4.Text = dtLabels.Rows[0]["Label4"].ToString();
               ltlLabel5.Text = dtLabels.Rows[0]["Label5"].ToString();
               ltlLabel6.Text = dtLabels.Rows[0]["Label6"].ToString();
           }
           if ( (ltlLabel1.Text == "") && (ltlLabel2.Text == "") && (ltlLabel3.Text == "") &&
                (ltlLabel4.Text == "") && (ltlLabel5.Text == "") && (ltlLabel6.Text == "") )

               pEkBilgi.Visible = false;

           pnlLabelValue1.Visible = (ltlLabel1.Text != "");
           pnlLabelValue2.Visible = (ltlLabel2.Text != "");
           pnlLabelValue3.Visible = (ltlLabel3.Text != "");
           pnlLabelValue4.Visible = (ltlLabel4.Text != "");
           pnlLabelValue5.Visible = (ltlLabel5.Text != "");
           pnlLabelValue6.Visible = (ltlLabel6.Text != "");


           if (this.smIsFacebookUser)
           {
               try
               {
                   FacebookService F = new FacebookService();
                   if (!F.hasAppPermission(facebook.Types.Enums.Extended_Permissions.status_update))
                       hlJoin.NavigateUrl = "javascript:JoinFormSend(true)";
               }
               catch (Exception)
               { }
           }
        }
    }

    protected void SetProfilData() {

        this.dtUserDetail = BUS.Users.GetUserDetail(this.smUserID);

        txtFirstName.Text = this.dtUserDetail.Rows[0]["FirstName"].ToString();
        txtSurname.Text = this.dtUserDetail.Rows[0]["Surname"].ToString();
        txtGsm.Text = (this.dtUserDetail.Rows[0]["Gsm"] == DBNull.Value) ? "" : this.dtUserDetail.Rows[0]["Gsm"].ToString();
        txtEmail.Text = (this.dtUserDetail.Rows[0]["Email"] == DBNull.Value) ? "" : this.dtUserDetail.Rows[0]["Email"].ToString();

        ddlEducationLevelID.SelectedValue = (this.dtUserDetail.Rows[0]["EducationLevelID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["EducationLevelID"].ToString();
        ddlEducationStatusID.SelectedValue = (this.dtUserDetail.Rows[0]["EducationStatusID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["EducationStatusID"].ToString();
        ddlUniversityID.SelectedValue = (this.dtUserDetail.Rows[0]["UniversityID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["UniversityID"].ToString();
        ddlLocationID.SelectedValue = (this.dtUserDetail.Rows[0]["LocationID"].ToString() == "") ? "0" : this.dtUserDetail.Rows[0]["LocationID"].ToString();

        txtFirstName.Enabled = !(txtFirstName.Text.Trim().Length > 0);
        txtSurname.Enabled = !(txtSurname.Text.Trim().Length > 0);
        txtGsm.Enabled = !(txtGsm.Text.Trim().Length > 0);
        txtEmail.Enabled = !(txtEmail.Text.Trim().Length > 0);
        ddlEducationLevelID.Enabled = !(int.Parse(ddlEducationLevelID.SelectedValue) > 0);
        ddlEducationStatusID.Enabled = !(int.Parse(ddlEducationStatusID.SelectedValue) > 0);
        ddlUniversityID.Enabled = !(int.Parse(ddlUniversityID.SelectedValue) > 0);
        ddlLocationID.Enabled = !(int.Parse(ddlLocationID.SelectedValue) > 0);
    }

    protected void Join()
    {
        System.Threading.Thread.Sleep(5000);
        Response.Redirect("a.aspx");

        /*

        bool IsSave = false;

        IsSave = BUS.Users.UserActivityJoinUp(this.smUserID, txtFirstName.Text, txtSurname.Text, txtGsm.Text, txtEmail.Text,
            int.Parse(ddlEducationLevelID.SelectedValue), int.Parse(ddlEducationStatusID.SelectedValue), int.Parse(ddlUniversityID.SelectedValue),
            int.Parse(ddlLocationID.SelectedValue));

        if (IsSave)
        {

            if (BUS.Users.UserActivityJoin(this.smUserID, this.ActivityID, chHasService.Checked, 
                int.Parse(hdInvitePeopleInfoID.Value), txtLabelValue1.Text, txtLabelValue2.Text, txtLabelValue3.Text, txtLabelValue4.Text, txtLabelValue5.Text, txtLabelValue6.Text))
            {
                SuccessButAlternate.Visible = (int.Parse(hdJoinCount.Value) >= int.Parse(hdUserCount.Value));
                Success.Visible = !SuccessButAlternate.Visible;
                pnlForm.Visible = false;

                //Facebook a post et
                if (this.smIsFacebookUser)
                {
                    string Photo = hdPhoto.Value.Replace("~/", "");
                    string Url = LIB.Util.ApplicationRootPath() + this.strActivityDetailPage(this.ActivityID, hdCategory.Value, ltlActivityTitle.Text).Replace("~/", "");
                    FacebookService F = new FacebookService();
                    F.Publish(Photo, Url, COM.Util.fbPublishTitle(), COM.Util.fbPublishDetail(ltlActivityTitle.Text));
                }

            }
            else
                err.Visible = true;
        }
        else
            err.Visible = true;
         
         */
    }
}