using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Comment_uComment : BaseUserControl
{
    private COM.Enum.CommentTypeCode _CommentTypeCode;
    private int _CommentTypeID;

    public COM.Enum.CommentTypeCode CommentTypeCode
    {
        get { return _CommentTypeCode; }
        set { _CommentTypeCode = value; }
    }
    public int CommentTypeID
    {
        get { return _CommentTypeID; }
        set { _CommentTypeID = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    public void BindData()
    {
        DataTable dt = BUS.Comments.GetComments(this.CommentTypeID, COM.Enum.CommentTypeCode.Activity);
        if ((dt != null) && (dt.Rows.Count > 0))
            LIB.DataBindHelper.BindRepeater(ref rptComments, dt);
        else
            pnlNoComment.Visible = true;

        pnlComments.Visible = !pnlNoComment.Visible;
    }

    protected void rptComments_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        int UserID;
        bool IsActive;
        HyperLink hlUserPage;
        Panel pnlComment;
        Panel pnlPending;
        UserControl UserImage;

        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            UserID = (((Literal)e.Item.FindControl("ltlUserID")).Text == "") ? -1 : int.Parse(((Literal)e.Item.FindControl("ltlUserID")).Text);
            IsActive = bool.Parse(((Literal)e.Item.FindControl("ltlIsActive")).Text);

            pnlComment = ((Panel)e.Item.FindControl("pnlComment"));
            pnlPending = ((Panel)e.Item.FindControl("pnlPending"));

            if (!IsActive && (this.smUserID == 0 || UserID != this.smUserID))
                pnlComment.Visible = false;
            else
            {
                pnlPending.Visible = ((UserID == this.smUserID) && (!IsActive));

                if (pnlPending.Visible)
                    ((Literal)e.Item.FindControl("ltlOriginalDetail")).Visible = true;


                hlUserPage = ((HyperLink)e.Item.FindControl("hlUserPage"));
                UserImage = ((UserControl)e.Item.FindControl("UserImage1"));

                if (UserID == 0)
                {
                    hlUserPage.Enabled = false;
                    UserImage.Visible = false;
                }
                else
                    hlUserPage.NavigateUrl = this.strUserPage(UserID);

                if ((this.smIsLogin) && (UserID == this.smUserID))
                    ((LinkButton)e.Item.FindControl("lnkDelete")).Visible = true;
            }
        }
    }
    protected void rptComments_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            LinkButton lnkDelete = ((LinkButton)e.Item.FindControl("lnkDelete"));
            if (e.CommandName == "Delete")
            {
                int CommentID = int.Parse(e.CommandArgument.ToString());
                errDelete.Visible = (BUS.Comments.Delete(CommentID, this.smUserID));
                BindData();
            }
        }
    }
}
