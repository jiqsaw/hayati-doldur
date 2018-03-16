using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activity_uActivitySearch : BaseUserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
        btnFind.OnClientClick = "$get('" + pnlExpand.ClientID + "').click()";
    }

    protected void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlLocationID, BUS.Locations.GetLocations(), "LocationName", "LocationID", "", "Tüm Şehirler", "0");
        LIB.DataBindHelper.BindDDL(ref ddlActivityCategories, BUS.Categories.GetCategories(), "CategoryName", "CategoryID", "", "Tüm Kategoriler", "0");
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        int IsActive = -1;
        if (rdActive.Checked) IsActive = 1;
        if (rdInactive.Checked) IsActive = 0;
        DateTime StartDate;
        if (!(DateTime.TryParse(txtActivityStartDate.Text, out StartDate))) StartDate = DateTime.MinValue;

        DateTime EndDate;
        if (!(DateTime.TryParse(txtActivityEndDate.Text, out EndDate))) EndDate = DateTime.MaxValue;        

        DataTable dtResult = BUS.Activities.ActivitySearch(int.Parse(ddlActivityCategories.SelectedValue), int.Parse(ddlLocationID.SelectedValue), txtActivityTitleDetail.Text, StartDate, EndDate, IsActive);
        pnlResults.Visible = true;
        uActivities1.BindData(dtResult);
    }
}