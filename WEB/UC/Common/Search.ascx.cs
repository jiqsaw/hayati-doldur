using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_Search : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    protected void BindData() {
        LIB.DataBindHelper.BindDDL(ref ddlCategories, BUS.Categories.GetCategories(), "CategoryName", "CategoryID", "0", "Tümü", "0");
        LIB.DataBindHelper.BindDDL(ref ddlCities, BUS.Locations.GetCities(), "LocationName", "LocationID", "0", "Tümü", "0");
    }
    protected void btnImgSearchGo_Click(object sender, ImageClickEventArgs e)
    {
        string qoURL = "~/ActivityList.aspx?lt=1";

        if (txtSearchText.Text != "")
            qoURL += "&s=" + LIB.Util.r(txtSearchText.Text);

        if (txtStartDate.Text != "")
            qoURL += "&SD=" + LIB.Util.r(txtStartDate.Text);

        if (txtEndDate.Text != "")
            qoURL += "&ED=" + LIB.Util.r(txtEndDate.Text);

        if (int.Parse(ddlCategories.SelectedValue) > 0)
            qoURL += "&c=" + ddlCategories.SelectedValue;

        if (int.Parse(ddlCities.SelectedValue) > 0)
            qoURL += "&l=" + ddlCities.SelectedValue;

        Response.Redirect(qoURL);
    }
}