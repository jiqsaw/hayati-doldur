using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activities_uActivities : BaseUserControl
{
    int ItemIndex = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindData(DataTable dt) {
        LIB.DataBindHelper.BindRepeater(ref rptActivities, dt);
    }
    protected void rptActivities_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            ItemIndex++;


            Label ActivityHeader = (Label)e.Item.FindControl("lblActivityHeader");

            DateTime EndDate = DateTime.Parse(((Literal)e.Item.FindControl("ltlActivityEndDate")).Text);
            ((UserControl)e.Item.FindControl("btnJoinActivity1")).Visible = EndDate > DateTime.Now;

            Image imgPhoto = (Image)e.Item.FindControl("imgPhoto");
            string Photo = imgPhoto.ImageUrl;
            if (ItemIndex > 1)
            {
                Photo = COM.Util.genPhotoNameOfSize(Photo, 2);
                ActivityHeader.Visible = false;
            }
            imgPhoto.ImageUrl = this.ImageUrl(COM.Enum.ImageTypes.Activity, Photo, COM.Enum.PhotoSizes.Default100);

            int JoinCount = int.Parse(((Literal)e.Item.FindControl("ltlJoinCount")).Text);
            if (JoinCount > 0)
            {
                int ActivityID = int.Parse(((Literal)e.Item.FindControl("ltlActivityID")).Text);
                ((HyperLink)e.Item.FindControl("hlActivityUsers")).NavigateUrl = "~/ActivityUsers.aspx?j=" + ActivityID.ToString();
            }

            Literal ltlCategory = (Literal)e.Item.FindControl("ltlCategory");

            HyperLink hlTitle = (HyperLink)e.Item.FindControl("hlTitle");
            hlTitle.NavigateUrl = this.strActivityDetailPage(Convert.ToInt32(hlTitle.NavigateUrl), ltlCategory.Text, hlTitle.Text);

            HyperLink hlImg = (HyperLink)e.Item.FindControl("hlImg");
            hlImg.NavigateUrl = hlTitle.NavigateUrl;
        }
    }

    public void BindCategory(int CategoryID)
    {
        DataTable dt = BUS.Activities.GetActivitesByCategory(CategoryID, this.smUserID);
        if (dt.Rows.Count > 0)
        {
            Paging1.Visible = true;
            Paging1.GeneratePager(ref dt, rptActivities, 5);
            ltlTitle.Text = dt.Rows[0]["CategoryName"].ToString();
        }
        else
            ltlTitle.Text = "Şu an için etkinliğimiz bulunmamaktadır.";
    }
}