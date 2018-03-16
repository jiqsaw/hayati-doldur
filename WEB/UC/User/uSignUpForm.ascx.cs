using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_User_uSignUpForm : BaseUserControl
{
    protected void Page_Init(object sender, EventArgs e)
    {
        txtBirthDate.IsBirthDate = true;
        txtBirthDate.ValidationGrup = "vgSignUp";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    private void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlEducationLevelID, BUS.Educations.GetEducationLevels(), "EducationLevel", "EducationLevelID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlEducationStatusID, BUS.Educations.GetEducationStates(), "EducationStatus", "EducationStatusID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Educations.GetUniversities(), "UniversityName", "UniversityID", "0", "Lütfen Seçiniz", "0");
    }

    protected void btnImgSignUp_Click(object sender, ImageClickEventArgs e)
    {
        if (BUS.Users.HasUser(txtEmail.Text))
            errHasEmail.Visible = true;
        else
        {
            string ActivationCode = COM.Util.genActivatonCode();

            int UserID = BUS.Users.UserIn(txtFirstName.Text, txtSurname.Text, txtEmail.Text, txtPassword.Text, txtBirthDate.Date, int.Parse(ddlEducationLevelID.SelectedValue), int.Parse(ddlEducationStatusID.SelectedValue), int.Parse(ddlUniversityID.SelectedValue), ActivationCode);
            if (UserID > 0)
            {
                pnlForm.Visible = false;
                pnlFormSended.Visible = true;

                Mailing Mail = new Mailing();
                ltlSuccess.Visible = (Mail.SendActivate(LIB.Util.r(txtEmail.Text), ActivationCode));
                ltlSuccessNoEmail.Visible = !ltlSuccess.Visible;
            }
            else
                errNoSave.Visible = true;
        }
    }
}