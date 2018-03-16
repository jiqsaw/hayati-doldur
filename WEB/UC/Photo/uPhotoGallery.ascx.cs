using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Photo_uPhotoGallery : BaseUserControl
{
    public int ActivityID 
    {
        get { return int.Parse(hdActivityID.Value); }
        set { hdActivityID.Value = value.ToString(); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (LIB.Util.IsNumeric(Request.QueryString["j"]))
                this.ActivityID = int.Parse(Request.QueryString["j"].ToString());

            if (this.ActivityID < 1)
                this.qoDefaultPage();

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

            DataTable dtPhotos = BUS.Photos.GetActivityPhotos(this.ActivityID);
            Paging1.GeneratePager(ref dtPhotos, rptList, 16);
        }
    }
    protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            Literal ltlCreatedByUserFirstname = (Literal)e.Item.FindControl("ltlCreatedByUserFirstname");
            Literal ltlCreatedByUserSurname = (Literal)e.Item.FindControl("ltlCreatedByUserSurname");
            Literal ltlKeywords = (Literal)e.Item.FindControl("ltlKeywords");

            HyperLink hlImg = (HyperLink)e.Item.FindControl("hlImg");
            hlImg.ImageUrl = "~/PhotoGallery/Activities/" + hlImg.ImageUrl.Replace(",1.", ",3.");
            hlImg.NavigateUrl = this.strPhotoDetailPage(this.ActivityID, Convert.ToInt32(hlImg.NavigateUrl), ltlKeywords.Text, ltlCreatedByUserFirstname.Text, ltlCreatedByUserSurname.Text);
            hlImg.ToolTip = "Ekleyen: " + ltlCreatedByUserFirstname.Text + " " + ltlCreatedByUserSurname.Text;
        }
    }
}