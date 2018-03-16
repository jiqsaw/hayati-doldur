using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Video_uPendingVideos : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    protected void BindData()
    {
        DataTable dt = BUS.Videos.GetPendingVideos();
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
        uSuccessDelete.Visible = (BUS.Videos.Delete(this.Checkeds(dlList), this.smAdminID));
        uErrorDelete.Visible = !uSuccessDelete.Visible;
        BindData();
    }
    protected void btnApprov_Click(object sender, EventArgs e)
    {
        uSuccessApprov.Visible = (BUS.Videos.ApproveVideo(this.Checkeds(dlList), this.smAdminID));
        uErrorApprov.Visible = !uSuccessApprov.Visible;
        BindData();
    }
}
