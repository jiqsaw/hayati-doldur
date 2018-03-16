using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activities_uActivityRelations : BaseUserControl
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
            BindData();
        }
    }

    protected void BindData()
    {
        DataTable dt = BUS.Activities.GetActivityRelations(this.ActivityID);

        if (dt.Rows.Count > 0)
            LIB.DataBindHelper.BindRepeater(ref rptActivities, dt);
        else
            dvRelationsActivities.Visible = false;
    }
    protected void rptActivities_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            HyperLink hlActivity = ((HyperLink)e.Item.FindControl("hlActivity"));
            Literal ltlCategory = ((Literal)e.Item.FindControl("ltlCategory"));
            hlActivity.NavigateUrl = this.strActivityDetailPage(int.Parse(hlActivity.NavigateUrl), ltlCategory.Text, hlActivity.Text);
        }
    }
}
