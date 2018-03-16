using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Comment_uPendingComments : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    protected void BindData()
    {
        DataTable dt = BUS.Comments.GetPendingComments();
        if (dt.Rows.Count > 0)
            Paging1.GeneratePager(ref dt, rptList, 20);
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;
    }

    protected void chAll_CheckedChanged(object sender, EventArgs e)
    {
        this.CheckAll(rptList, chAll.Checked);
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
    protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            if (e.CommandName == "btnApprov")
            {
                int CommentID = int.Parse(((Button)e.Item.FindControl("btnApprov")).CommandArgument);
                string CommentDetail = ((TextBox)e.Item.FindControl("txtCommentDetail")).Text;
                if (BUS.Comments.ApproveComment(CommentID, CommentDetail, this.smAdminID))
                {
                    BindData();
                    uSuccessApprov.Visible = true;
                }
                else
                    uErrorApprov.Visible = true;
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        uSuccessDelete.Visible = (BUS.Comments.Delete(this.Checkeds(rptList), this.smAdminID));
        uErrorDelete.Visible = !uSuccessDelete.Visible;
        BindData();
    }
}
