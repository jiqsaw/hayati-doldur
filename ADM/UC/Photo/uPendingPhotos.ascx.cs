using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Photo_uPendingPhotos : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();

        uSuccessApprov.Visible = false;
        uSuccessDelete.Visible = false;
        uErrorApprov.Visible = false;
        uErrorDelete.Visible = false;
    }

    protected void BindData()
    {
        DataTable dt = BUS.Photos.GetPendingPhotos();
        if (dt.Rows.Count > 0)
            Paging1.GeneratePager(ref dt, dlList);
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;
    }

    protected void chAll_CheckedChanged(object sender, EventArgs e)
    {
        this.CheckAll(dlList, chAll.Checked);

    }
    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        uSuccessDelete.Visible = (BUS.Photos.Delete(this.Checkeds(dlList), this.smAdminID));
        uErrorDelete.Visible = !uSuccessDelete.Visible;
        BindData();
    }
    protected void btnApprov_Click(object sender, EventArgs e)
    {
        uSuccessApprov.Visible = (BUS.Photos.ApprovePhoto(this.Checkeds(dlList), this.smAdminID));
        uErrorApprov.Visible = !uSuccessApprov.Visible;
        BindData();
    }

    protected string PhotoUrl(string PhotoName) {
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
}