using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class UC_Activity_uActivities : BaseUserControl
{
    public DataTable vsDataSource
    {
        get { return (ViewState["vsDataSource"] == null ? null : (DataTable)(ViewState["vsDataSource"])); }
        set { ViewState["vsDataSource"] = value; }
    }

    private COM.Enum.Categories _CategoryID = 0;
    public COM.Enum.Categories CategoryID { get { return _CategoryID; } set { _CategoryID = value; } }

    public bool HideDelete { 
        get { return btnDelete.Visible; } set { btnDelete.Visible = false; }
    }

    public ArrayList arrCheckeds { get { return this.Checkeds(rptList); } }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (((int)CategoryID) > 0)
                BindData();
    }

    protected void BindData()
    {
        DataTable dt = BUS.Activities.GetActivitesByCategoryID((int)this.CategoryID);
        BindData(dt);
    }

    public void BindData(DataTable dt)
    {
        if ((dt != null) && (dt.Rows.Count > 0))
        {
            pnlNoData.Visible = false;
            Paging1.GeneratePager(ref dt, rptList);
            this.vsDataSource = dt;
        }
        else
            pnlNoData.Visible = true;

        pnlPage.Visible = !pnlNoData.Visible;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        uSuccess1.Visible = (BUS.Activities.ActivitesDel(this.Checkeds(rptList), this.smAdminID));
        uError1.Visible = !uSuccess1.Visible;
        BindData();
    }
    protected void chAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckAll();
    }

    public void CheckAll() {
        this.CheckAll(rptList, chAll.Checked);
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        LIB.ExportFile Export = new LIB.ExportFile();
        Export.Export(LIB.ExportFile.ExportTypes.Excel, "Etkinlikler", this.vsDataSource);
    }
}