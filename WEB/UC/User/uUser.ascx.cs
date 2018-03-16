using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class UC_User_uUser : BaseUserControl
{
    protected int UserID = 0;
    private int Counter = 0;
    private int ShowItemCount = 5;

    public DataTable dtUploadPhotos
    {
        get { return (ViewState["vsUploadPhotos"] == null ? null : (DataTable)(ViewState["vsUploadPhotos"])); }
        set { ViewState["vsUploadPhotos"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (LIB.Util.IsNumeric(Request.QueryString["j"]))
            this.UserID = int.Parse(Request.QueryString["j"]);
        else
            this.qoDefaultPage();

        if (this.UserID == 0)
            this.UserID = this.smUserID;

        if (!IsPostBack)
        {
            BindProfileInfo();
            BindActivities();
            BindUploadPhotos(0);
        }
    }

    protected void BindUploadPhotos(int StartIndex)
    {
        this.dtUploadPhotos = BUS.Photos.GetPhotosByUserID(this.UserID);

        DataTable dtPhotos = this.dtUploadPhotos.Clone();
        for (int i = 0; i < this.dtUploadPhotos.Rows.Count; i++)
        {
            if (i >= StartIndex)                
                dtPhotos.Rows.Add(this.dtUploadPhotos.Rows[i].ItemArray);

            if (dtPhotos.Rows.Count == 8) break;
        }
        
        LIB.DataBindHelper.BindRepeater(ref rptPhotos, dtPhotos);

        if (this.dtUploadPhotos.Rows.Count < 1)
            lblNoPhotos.Visible = true;

        lnkPrev.CommandArgument = (StartIndex - 8).ToString();
        lnkNext.CommandArgument = (StartIndex + 8).ToString();


        lnkPrev.ToolTip = lnkPrev.CommandArgument;
        lnkNext.ToolTip = lnkNext.CommandArgument;

        lnkPrev.Visible = (int.Parse(lnkNext.CommandArgument) > 8);
        lnkNext.Visible = this.dtUploadPhotos.Rows.Count > int.Parse(lnkNext.CommandArgument);
    }

    void BindProfileInfo()
    {
        DataTable dtUserDetail = BUS.Users.GetUserDetail(this.UserID);
        if ((dtUserDetail != null) && (dtUserDetail.Rows.Count > 0))
        {
            hlProfileEdit.NavigateUrl = this.strUserProfilePage();
            string Photo = dtUserDetail.Rows[0]["Photo"] == DBNull.Value ? "" : dtUserDetail.Rows[0]["Photo"].ToString();

            UserImage1.UserID = Convert.ToInt32(dtUserDetail.Rows[0]["UserID"]);
            UserImage1.size = COM.Enum.FacebookPhotoSizes.small;
            UserImage1.uid = LIB.Util.fbUID(dtUserDetail.Rows[0]["FacebookID"]);
            UserImage1.Photo = Photo;

            ltlFullName.Text = dtUserDetail.Rows[0]["FirstName"].ToString() + " " + dtUserDetail.Rows[0]["Surname"].ToString();

            ltlSex.Visible = (dtUserDetail.Rows[0]["IsFemale"] != DBNull.Value);
            if (ltlSex.Visible)
                ltlFemale.Visible = Convert.ToBoolean(dtUserDetail.Rows[0]["IsFemale"]);

            if ((dtUserDetail.Rows[0]["BirthDate"] != null) && (dtUserDetail.Rows[0]["BirthDate"].ToString() != ""))
            {
                DateTime dtBirthDate = Convert.ToDateTime(dtUserDetail.Rows[0]["BirthDate"]);
                int Age = LIB.Util.Age(Convert.ToDateTime(dtUserDetail.Rows[0]["BirthDate"]));
                if (Age > 15)
                    ltlAge.Text = Age.ToString();
                else
                    ltlAge.Visible = false;
            }

            hlFacebook.NavigateUrl = dtUserDetail.Rows[0]["Facebook"].ToString();
            hlFriendfeed.NavigateUrl = dtUserDetail.Rows[0]["Friendfeed"].ToString();
            hlTwitter.NavigateUrl = dtUserDetail.Rows[0]["Twitter"].ToString();

            hlFacebook.Visible = hlFacebook.NavigateUrl.Length > 1;
            hlFriendfeed.Visible = hlFriendfeed.NavigateUrl.Length > 1;
            hlTwitter.Visible = hlTwitter.NavigateUrl.Length > 1;

            hlProfileEdit.Visible = (this.UserID == this.smUserID);
        }
    }

    protected void BindActivities()
    {
        DataTable dtJoinActivities = BUS.Users.GetUserActivities(this.UserID);

        LIB.DataBindHelper.BindRepeater(ref rptUserActivities, dtJoinActivities);

        lblNoUserActivities.Visible = dtJoinActivities.Rows.Count < 1;

        hlAllUserActivites.Visible = dtJoinActivities.Rows.Count > ShowItemCount;
    }

    protected void rpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {

            Literal ltlCategory = ((Literal)e.Item.FindControl("ltlCategory"));
            HyperLink hlActivity = ((HyperLink)e.Item.FindControl("hlActivity"));
            hlActivity.NavigateUrl = this.strActivityDetailPage(int.Parse(hlActivity.NavigateUrl), ltlCategory.Text, hlActivity.Text);

            Panel pnlDetail = ((Panel)e.Item.FindControl("pnlDetail"));

            if (this.Counter >= ShowItemCount)
                if (pnlDetail != null)
                    pnlDetail.Style.Add("display", "none");

            this.Counter++;
        }
        else if (e.Item.ItemType == ListItemType.Footer)
        {
            this.Counter = 1;
        }
    }

    protected void rptPhotos_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            Literal ltlCreatedByUserFirstname = (Literal)e.Item.FindControl("ltlCreatedByUserFirstname");
            Literal ltlCreatedByUserSurname = (Literal)e.Item.FindControl("ltlCreatedByUserSurname");
            Literal ltlKeywords = (Literal)e.Item.FindControl("ltlKeywords");

            HyperLink hlDetail = (HyperLink)e.Item.FindControl("hlDetail");
            hlDetail.ImageUrl = "~/" + this.Config(COM.ADM.EnumUtil.Config.PathActivityImgByUser) + hlDetail.ImageUrl.Replace(",1.", ",3.");
            hlDetail.NavigateUrl = this.strPhotoDetailPage(Convert.ToInt32(hlDetail.Text), Convert.ToInt32(hlDetail.NavigateUrl), ltlKeywords.Text, ltlCreatedByUserFirstname.Text, ltlCreatedByUserSurname.Text);
            hlDetail.Text = "";
        }
    }

    protected void lnkPrev_Click(object sender, EventArgs e)
    {
        int Index = int.Parse(lnkPrev.CommandArgument.ToString());
        BindUploadPhotos(Index);
    }

    protected void lnkNext_Click(object sender, EventArgs e)
    {
        int Index = int.Parse(lnkNext.CommandArgument.ToString());
        BindUploadPhotos(Index);
    }
}
