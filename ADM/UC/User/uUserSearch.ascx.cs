using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_User_uUserSearch : BaseUserControl
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
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Educations.GetUniversities(), "UniversityName", "UniversityID", "", "Tüm Üniversiteler", "0");
        LIB.DataBindHelper.BindDDL(ref ddlEducationLevelID, BUS.Educations.GetEducationLevels(), "EducationLevel", "EducationLevelID", "", "Tümü", "0");

        ltlUserCount.Text = BUS.Users.UserCount().ToString();
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        int IsFemale = -1;
        if (rdIsFemaleF.Checked) IsFemale = 1;
        if (rdIsFemaleM.Checked) IsFemale = 0;

        int IsFacebookUser = -1;
        if (rdIsFacebookUserY.Checked) IsFacebookUser = 1;
        if (rdIsFacebookUserN.Checked) IsFacebookUser = 0;
        
        int IsActive = -1;
        if (rdIsActive.Checked) IsActive = 1;
        if (rdIsInactive.Checked) IsActive = 0;

        DateTime CreateDate;
        if (!(DateTime.TryParse(txtCreateDate.Text, out CreateDate))) CreateDate = DateTime.MinValue;

        DateTime BirthDate;
        if (!(DateTime.TryParse(txtBirthDate.Text, out BirthDate))) BirthDate = DateTime.MinValue;

        DataTable dtResult = BUS.Users.Search(txtName.Text, int.Parse(ddlLocationID.SelectedValue), int.Parse(ddlUniversityID.SelectedValue), int.Parse(ddlEducationLevelID.SelectedValue), CreateDate, BirthDate, IsFemale, IsFacebookUser, IsActive);
        pnlResults.Visible = true;
        uUserManagement1.BindData(dtResult);
    }
}
