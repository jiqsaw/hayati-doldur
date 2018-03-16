using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_User_uUserManagement : BaseUserControl
{
    public DataTable vsDataSource
    {
        get { return (ViewState["vsDataSource"] == null ? null : (DataTable)(ViewState["vsDataSource"])); }
        set { ViewState["vsDataSource"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void BindData()
    {
        DataTable dt = BUS.Users.GetUsers();
        BindData(dt);
    }

    public void BindData(DataTable dt)
    {
        if ((dt != null) && (dt.Rows.Count > 0))
        {
            pnlNoData.Visible = false;
            Paging1.GeneratePager(ref dt, rptList);
            this.vsDataSource = dt;
        }
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        uSuccess1.Visible = (BUS.Users.Delete(this.Checkeds(rptList), this.smAdminID));
        uError1.Visible = !uSuccess1.Visible;
        BindData();
    }
    protected void chAll_CheckedChanged(object sender, EventArgs e)
    {
        this.CheckAll(rptList, chAll.Checked);
    }
    protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            bool IsFacebookUser = bool.Parse(((Literal)e.Item.FindControl("ltlIsFacebookUser")).Text);
            Image imgUser = (Image)e.Item.FindControl("imgUser");

            imgUser.Visible = (imgUser.ImageUrl.Trim().Length > 0);

            if (!IsFacebookUser)
                imgUser.ImageUrl = "~/" + this.Config(COM.ADM.EnumUtil.Config.PathUserImg) + imgUser.ImageUrl;
        }
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        LIB.ExportFile Export = new LIB.ExportFile();
        Export.Export(LIB.ExportFile.ExportTypes.Excel, "Uyeler", this.vsDataSource);
    }
}