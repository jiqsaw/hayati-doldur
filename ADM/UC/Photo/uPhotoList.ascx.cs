using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Photo_uPhotoList : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindData(DataTable dt)
    {
        if (dt.Rows.Count > 0)
            Paging1.GeneratePager(ref dt, dlList, 20);
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;
    }

    protected string PhotoUrl(string PhotoName)
    {
        return COM.Util.genPhotoUrl(this.Config(COM.ADM.EnumUtil.Config.PathActivityImgByUser), PhotoName);
    }

    protected void dlList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            Literal ltlPhoto = ((Literal)e.Item.FindControl("ltlPhoto"));
            string Keywords = ((Literal)e.Item.FindControl("ltlKeywords")).Text;
            ltlPhoto.Text = COM.Util.genPhoto("lightbox", this.PhotoUrl(ltlPhoto.Text), Keywords, this.PhotoUrl(ltlPhoto.Text.Replace(",1.", ",3.")));
        }
    }

    protected void btnBackApprove_Click(object sender, EventArgs e)
    {
        BUS.Photos.BackApprovePhoto(this.Checkeds(dlList), this.smAdminID);
        Response.Redirect("~/PendingPhotos.aspx");
    }
}
