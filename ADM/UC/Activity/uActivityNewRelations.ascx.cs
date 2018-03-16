using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class UC_Activity_uActivityNewRelations : BaseUserControl
{
    public int ActivityID
    {
        get { return (ViewState["ActivityID"] == null ? -1 : int.Parse(ViewState["ActivityID"].ToString())); }
        set { ViewState["ActivityID"] = value; }
    }

    public int CategoryID
    {
        get { return (ViewState["CategoryID"] == null ? 0 : int.Parse(ViewState["CategoryID"].ToString())); }
        set { ViewState["CategoryID"] = value; }
    }

    public bool IsSaved
    {
        get { return (ViewState["IsSaved"] == null ? false : Convert.ToBoolean((ViewState["IsSaved"]))); }
        set { ViewState["IsSaved"] = value; }
    }

    public bool IsEdit
    {
        get { return (ViewState["IsEdit"] == null ? false : Convert.ToBoolean((ViewState["IsEdit"]))); }
        set { ViewState["IsEdit"] = value; }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        DataTable dtResult;

        if (this.IsEdit)
        {
            dtResult = BUS.Activities.GetActivityRelations(this.ActivityID);
            btnRelationActivity.Visible = dtResult.Rows.Count > 0;
            uActivitiyRelations.BindData(dtResult);

            uActivities1.Visible = false;
            btnRelationAdd.Visible = false;
        }
        else {

            uActivitiyRelations.Visible = false;
            btnRelationActivity.Visible = false;

            dtResult = BUS.Activities.GetActivitesByCategoryID(this.CategoryID);
            uActivities1.BindData(dtResult);
            btnRelationAdd.Visible = dtResult.Rows.Count > 0;
            
        }

        uActivitiyRelations.HideDelete = true;
        uActivities1.HideDelete = true;
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        DataTable dtResult = BUS.Activities.ActivitySearch(txtActivityTitleDetail.Text);
        uActivities1.BindData(dtResult);        
        uActivities1.Visible = dtResult.Rows.Count > 0;
        btnRelationAdd.Visible = uActivities1.Visible;
    }

    protected void btnRelationActivity_Click(object sender, EventArgs e)
    {
        this.IsSaved = (BUS.Activities.ActivityRelationsDel(this.ActivityID, uActivitiyRelations.arrCheckeds));
    }
    protected void btnRelationAdd_Click(object sender, EventArgs e)
    {
        this.IsSaved = (BUS.Activities.ActivityRelationsIn(this.ActivityID, uActivities1.arrCheckeds));
    }
}