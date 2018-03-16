using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class UC_AdminUserManagement_uAdminUserManagement : BaseUserControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    protected void BindData()
    {
        DataTable dt = BUS.AdminPermissions.AdminSel();
        Paging1.GeneratePager(ref dt, rptList);
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        uSuccess1.Visible = (BUS.AdminPermissions.AdminDel(this.Checkeds(rptList), this.smAdminID));
        uError1.Visible = !uSuccess1.Visible;
        BindData();
    }
    protected void chAll_CheckedChanged(object sender, EventArgs e)
    {
        this.CheckAll(rptList, chAll.Checked);
    }
}