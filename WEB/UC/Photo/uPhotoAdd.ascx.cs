using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Photo_uPhotoAdd : BaseUserControl
{
    private int ActivityID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.smIsLogin)
            Response.End();
        if (!IsPostBack)
        {
            if (!int.TryParse(Request.QueryString["j"], out this.ActivityID))
                Response.End();

            if (this.ActivityID > 0)
                hdActivityID.Value = this.ActivityID.ToString();
            else
                Response.End();

            BindData();
        }
    }

    protected void BindData() {
        DataTable dtActivityDetail = BUS.Activities.GetActivityDetail(this.ActivityID);
        if (dtActivityDetail.Rows.Count < 1)
            Response.End();
        else {
            ltlActivityTitle.Text = dtActivityDetail.Rows[0]["ActivityTitle"].ToString();
            imgCategory.ImageUrl = imgCategory.ImageUrl.Replace("||CATEGORYID||", dtActivityDetail.Rows[0]["CategoryID"].ToString());
            ltlPlace.Text = dtActivityDetail.Rows[0]["Place"].ToString();
            ltlActivityDate.Text = dtActivityDetail.Rows[0]["ActivityDate"].ToString();
            uPhotoAddContent1.ActivityID = this.ActivityID;
            uPhotoAddContent2.ActivityID = this.ActivityID;
            uPhotoAddContent3.ActivityID = this.ActivityID;
            uPhotoAddContent4.ActivityID = this.ActivityID;
            uPhotoAddContent5.ActivityID = this.ActivityID;
        }
    }
    protected void BtnImgUpload_Click(object sender, ImageClickEventArgs e)
    {
        string Photo1 = uPhotoAddContent1.Photo();
        string Photo2 = uPhotoAddContent2.Photo();
        string Photo3 = uPhotoAddContent3.Photo();
        string Photo4 = uPhotoAddContent4.Photo();
        string Photo5 = uPhotoAddContent5.Photo();

        uPhotoAddContent1.Succ = (Photo1 != "") && BUS.Photos.PhotosIn(int.Parse(hdActivityID.Value), Photo1, uPhotoAddContent1.Desc, this.smUserID);
        uPhotoAddContent2.Succ = (Photo2 != "") && BUS.Photos.PhotosIn(int.Parse(hdActivityID.Value), Photo2, uPhotoAddContent2.Desc, this.smUserID);
        uPhotoAddContent3.Succ = (Photo3 != "") && BUS.Photos.PhotosIn(int.Parse(hdActivityID.Value), Photo3, uPhotoAddContent3.Desc, this.smUserID);
        uPhotoAddContent4.Succ = (Photo4 != "") && BUS.Photos.PhotosIn(int.Parse(hdActivityID.Value), Photo4, uPhotoAddContent4.Desc, this.smUserID);
        uPhotoAddContent5.Succ = (Photo5 != "") && BUS.Photos.PhotosIn(int.Parse(hdActivityID.Value), Photo5, uPhotoAddContent5.Desc, this.smUserID);

        uPhotoAddContent1.Err = !uPhotoAddContent1.Succ;
        uPhotoAddContent2.Err = !uPhotoAddContent2.Succ;
        uPhotoAddContent3.Err = !uPhotoAddContent3.Succ;
        uPhotoAddContent4.Err = !uPhotoAddContent4.Succ;
        uPhotoAddContent5.Err = !uPhotoAddContent5.Succ;

        uPhotoAddContent1.pnlForm = false;
        uPhotoAddContent1.pnlHeader = false;

        uPhotoAddContent2.pnlForm = false;
        uPhotoAddContent2.pnlHeader = false;

        uPhotoAddContent3.pnlForm = false;
        uPhotoAddContent3.pnlHeader = false;

        uPhotoAddContent4.pnlForm = false;
        uPhotoAddContent4.pnlHeader = false;

        uPhotoAddContent5.pnlForm = false;
        uPhotoAddContent5.pnlHeader = false;

        uPhotoAddContent1.pnlWrapper = uPhotoAddContent1.HasFile;
        uPhotoAddContent2.pnlWrapper = uPhotoAddContent2.HasFile;
        uPhotoAddContent3.pnlWrapper = uPhotoAddContent3.HasFile;
        uPhotoAddContent4.pnlWrapper = uPhotoAddContent4.HasFile;
        uPhotoAddContent5.pnlWrapper = uPhotoAddContent5.HasFile;

        BtnImgUpload.Visible = false;
    }
}