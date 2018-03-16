using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Common_uActivityPhotos : BaseUserControl
{
    private int _ActivityID = 0;
    public int ActivityID
    {
        get { return this._ActivityID; }
        set { this._ActivityID = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            DataTable dtPhotos;
            if (this.ActivityID == 0)
                dtPhotos = BUS.Photos.GetLastPhotos();
            else
                dtPhotos = BUS.Photos.GetActivityLastPhotos(this.ActivityID);

            if ((dtPhotos != null) && (dtPhotos.Rows.Count > 0))
                LIB.DataBindHelper.BindRepeater(ref rptPhotos, dtPhotos);
            else
                dvPhoto.Visible = false;

            hlGoToGallery.Visible = (this.ActivityID != 0) && ((dtPhotos != null) && (dtPhotos.Rows.Count > 0));
            if (hlGoToGallery.Visible) hlGoToGallery.NavigateUrl = "~/PhotoGallery.aspx?j=" + this.ActivityID.ToString();
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
            hlDetail.ToolTip = "Ekleyen: " + ltlCreatedByUserFirstname.Text + " " + ltlCreatedByUserSurname.Text;
        }
    }
}
