using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Management_uNavigate : BaseUserControl
{
    private string tmpLink = "<a href='||NavigateURL||'>· ||Text||</a>";
    private string tmpTitle = "<br /><h3>||Text||</h3>";

    private void Page_Init(object sender, System.EventArgs e) {
        if (!this.smIsLogin) Response.Redirect("~/Default.aspx");
        PermissionControl();
    }

    private void PermissionControl()
    {
        if (!this.HasUserPermission(LIB.Util.ReturnPageName()))
            Response.Redirect("~/Default.aspx?qo=true");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dtNavigate = LIB.DataTableHelper.Filter(this.smPermissions, "IsNavigate", "True");
            LIB.DataBindHelper.BindRepeater(ref rptMenu, dtNavigate);
        }
    }

    protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        int ParentID = -1;
        string Text = String.Empty;
        string NavigateURL = String.Empty;
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            ParentID = int.Parse(((Literal)e.Item.FindControl("ltlParentID")).Text);
            Text = ((Literal)e.Item.FindControl("ltlContent")).Text;
            NavigateURL = ((Literal)e.Item.FindControl("ltlNavigate")).Text;
            if (ParentID == 0)
                ((Literal)e.Item.FindControl("ltlShow")).Text = tmpTitle.Replace("||Text||", Text);
            else 
                ((Literal)e.Item.FindControl("ltlShow")).Text = tmpLink.Replace("||Text||", Text).Replace("||NavigateURL||", NavigateURL);
        }
    }
}
