using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Comment_uCommentList : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void BindData(DataTable dt)
    {
        if (dt.Rows.Count > 0)
            Paging1.GeneratePager(ref dt, rptList, 20);
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;
    }

    protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            Literal ltlCommentByName = ((Literal)e.Item.FindControl("ltlCommentByName"));
            Literal ltlUserID = ((Literal)e.Item.FindControl("ltlUserID"));
            HyperLink hlUserID = ((HyperLink)e.Item.FindControl("hlCommentByDetail"));
            ltlCommentByName.Visible = (ltlUserID.Text.Trim() == "");
            hlUserID.Visible = !ltlCommentByName.Visible;
        }
    }

    protected void chAll_CheckedChanged(object sender, EventArgs e)
    {
        this.CheckAll(rptList, chAll.Checked);
    }

    protected void btnBackApprove_Click(object sender, EventArgs e)
    {
        uSuccessApprov.Visible = (BUS.Comments.BackApprove(this.Checkeds(rptList), this.smAdminID));
        uErrorApprov.Visible = !uSuccessApprov.Visible;
        Response.Redirect("~/PendingComments.aspx");
    }
}
