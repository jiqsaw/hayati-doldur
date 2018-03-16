using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activities_uUpcomingActivitiesHolder : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    protected void BindData()
    {
        DataTable dt = BUS.Activities.GetUpComingActivites(this.smUserID);
        DataTable dtUpComingActivities = dt.Clone();
        DataTable dtUpComingActivitiesOther = dt.Clone();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (i < 3)
                dtUpComingActivities.Rows.Add(dt.Rows[i].ItemArray);
            else
                dtUpComingActivitiesOther.Rows.Add(dt.Rows[i].ItemArray);
        }

        for (int i = 0; i < dtUpComingActivities.Rows.Count; i++)
        {
            if (i != 0)
                dtUpComingActivities.Rows[i]["ActivityHeader"] = String.Empty;
        }

        foreach (DataRow dr in dtUpComingActivitiesOther.Rows)
            dr["ActivityHeader"] = String.Empty;

        uActivities1.BindData(dtUpComingActivities);
        uActivitiesOther.BindData(dtUpComingActivitiesOther);
    }
}
