using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LIB;

public partial class UC_MarkaElcileri_uMarkaElcileri :BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Fill();
    }

    protected void Fill()
    {
        DataTable dt = BUS.MarkaElcileri.GetMarkaElcileri();

        DataTable dtLocations = DataTableHelper.Distinct(dt, "LocationName"); 
        DataTable dtUniversities = DataTableHelper.Distinct(dt, "UniversityName");

        DataTable dtRendered = dt.Clone();
        foreach (DataRow dr in dt.Rows)
        {
            if (DataTableHelper.ExistValue(dtRendered, "UniversityName", dr["UniversityName"].ToString()))
                dr["UniversityName"] = "";

            if (DataTableHelper.ExistValue(dtRendered, "LocationName", dr["LocationName"].ToString()))
                dr["LocationName"] = "";

            dtRendered.Rows.Add(dr.ItemArray);
        }
        
        LIB.DataBindHelper.BindRepeater(ref rptList, dtRendered);
    }
    protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            Panel sepLocation = ((Panel)e.Item.FindControl("sepLocation"));
            Panel sepUniversities = ((Panel)e.Item.FindControl("sepUniversities"));
            Literal ltlLocationName = ((Literal)e.Item.FindControl("ltlLocationName"));
            Literal ltlUniversityName = ((Literal)e.Item.FindControl("ltlUniversityName"));

            sepLocation.Visible = ltlLocationName.Text != "";
            sepUniversities.Visible = ltlUniversityName.Text != "";

            if (sepLocation.Visible && sepUniversities.Visible)
                sepUniversities.Visible = false;
        }
    }
}
