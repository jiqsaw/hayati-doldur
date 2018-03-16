using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class UC_Photo_uPhotoDetail : BaseUserControl
{
    public int ActivityID
    {
        get { return int.Parse(hdActivityID.Value); }
        set { hdActivityID.Value = value.ToString(); }
    }

    public int PhotoID
    {
        get { return int.Parse(hdPhotoID.Value); }
        set { hdPhotoID.Value = value.ToString(); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (LIB.Util.IsNumeric(Request.QueryString["j"]))
                this.ActivityID = int.Parse(Request.QueryString["j"].ToString());

            if (this.ActivityID < 1)
                this.qoDefaultPage();

            if (LIB.Util.IsNumeric(Request.QueryString["p"]))
                this.PhotoID = int.Parse(Request.QueryString["p"].ToString());

            if (this.PhotoID < 1)
                this.qoDefaultPage();

            lnkRemove.CommandArgument = this.PhotoID.ToString();

            BindData();
        }
    }

    protected void BindData()
    {
        DataTable dtActivityDetail = BUS.Activities.GetActivityDetail(this.ActivityID);
        if (dtActivityDetail.Rows.Count < 1)
            Response.End();
        else
        {
            ltlActivityTitle.Text = dtActivityDetail.Rows[0]["ActivityTitle"].ToString();
            hdCategory.Value = dtActivityDetail.Rows[0]["CategoryName"].ToString();
            imgCategory.ImageUrl = imgCategory.ImageUrl.Replace("||CATEGORYID||", dtActivityDetail.Rows[0]["CategoryID"].ToString());
            ltlPlace.Text = dtActivityDetail.Rows[0]["Place"].ToString();
            ltlActivityDate.Text = dtActivityDetail.Rows[0]["ActivityDate"].ToString();
            imgBus.Visible = (Convert.ToBoolean(dtActivityDetail.Rows[0]["HasService"]));
            hlBackActivity.NavigateUrl = this.strActivityDetailPage(this.ActivityID, hdCategory.Value, ltlActivityTitle.Text);
            hlBackPhotoGallery.NavigateUrl = "~/PhotoGallery.aspx?j=" + this.ActivityID;

            DataTable dtPhotos = BUS.Photos.GetPhotoDetail(this.PhotoID, this.ActivityID);

            if (dtPhotos.Rows.Count < 1) this.qoDefaultPage();
            hlImg.ImageUrl = "~/PhotoGallery/Activities/" + dtPhotos.Rows[0]["Photo"].ToString();
            ltlKeywords.Text = dtPhotos.Rows[0]["Keywords"].ToString();

            if (dtPhotos.Rows[0]["NextPhoto"].ToString() != "0")
                hlNext.NavigateUrl = this.strPhotoDetailPage(this.ActivityID, Convert.ToInt32(dtPhotos.Rows[0]["NextPhoto"]), ltlKeywords.Text, dtPhotos.Rows[0]["FirstName"].ToString(), dtPhotos.Rows[0]["Surname"].ToString());
            else
                hlNext.Visible = false;

            if (dtPhotos.Rows[0]["PrevPhoto"].ToString() != "0")                
                hlPrevious.NavigateUrl = this.strPhotoDetailPage(this.ActivityID, Convert.ToInt32(dtPhotos.Rows[0]["PrevPhoto"]), ltlKeywords.Text, dtPhotos.Rows[0]["FirstName"].ToString(), dtPhotos.Rows[0]["Surname"].ToString());
            else
                hlPrevious.Visible = false;

            hlUser.NavigateUrl = this.strUserPage(Convert.ToInt32(dtPhotos.Rows[0]["CreatedByUserID"]));
            hlUser.Text = dtPhotos.Rows[0]["FirstName"].ToString() + " " + dtPhotos.Rows[0]["Surname"].ToString();
            
            if (!hlNext.Visible) 
                hlImg.NavigateUrl = "javascript:;";
            else
                hlImg.NavigateUrl = hlNext.NavigateUrl;

            lblPhotoIndex.Text = dtPhotos.Rows[0]["PhotoIndex"].ToString();
            lblPhotoCount.Text = dtPhotos.Rows[0]["PhotoCount"].ToString();

            lnkRemove.Visible = this.smIsLogin && this.smUserID == Convert.ToInt32(dtPhotos.Rows[0]["CreatedByUserID"]);
        }
    }
    protected void lnkRemove_Click(object sender, EventArgs e)
    {
        int PhotoID = Convert.ToInt32(lnkRemove.CommandArgument);
        if (PhotoID > 0)
        {
            ArrayList arr = new ArrayList();
            arr.Add(PhotoID);
            if (BUS.Photos.Delete(arr, this.smUserID))
            {
                hlImg.Visible = false;
                lnkRemove.Visible = false;
                ArrowPanel.Visible = false;
                ltlKeywords.Visible = false;
                hlUser.Visible = false;
                ltlAddUserLbl.Visible = false;
                Success.Visible = true;
            }
        }
    }
}