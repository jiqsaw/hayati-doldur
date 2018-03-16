using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_MarkaElcileri_uMarkaElcileriNew : BaseUserControl
{
    private int MarkaElcileriID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();

            if (int.TryParse(Request.QueryString["j"], out MarkaElcileriID))
                FillData();
            
        }
    }

    protected void FillData()
    {
        DataTable dt = BUS.MarkaElcileri.GetMarkaElcileriDetail(this.MarkaElcileriID);
        if (dt.Rows.Count > 0)
        {
            hdMarkaElcileriID.Value = this.MarkaElcileriID.ToString();
            ddlLocationID.SelectedValue = dt.Rows[0]["LocationID"].ToString();
            ddlUniversityID.SelectedValue = dt.Rows[0]["UniversityID"].ToString();
            txtFullName.Text = dt.Rows[0]["FullName"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
        }
    }

    private void BindData()
    {
        LIB.DataBindHelper.BindDDL(ref ddlLocationID, BUS.Locations.GetLocations(), "LocationName", "LocationID", "0", "Lütfen Seçiniz", "0");
        LIB.DataBindHelper.BindDDL(ref ddlUniversityID, BUS.Educations.GetUniversities(), "UniversityName", "UniversityID", "0", "Lütfen Seçiniz", "0");
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        bool IsSave = BUS.MarkaElcileri.Save(int.Parse(hdMarkaElcileriID.Value), int.Parse(ddlLocationID.SelectedValue), int.Parse(ddlUniversityID.SelectedValue), txtFullName.Text,txtEmail.Text);
        if (IsSave)
        {
            if (hdMarkaElcileriID.Value == "0")
                uSuccess1.Visible = true;
            else
                uSuccess2.Visible = true;

            LIB.Util.ClearForm(pnlFormInputs);
        }
        else
            uError1.Visible = true;
    }
}
