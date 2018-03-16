using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class UC_AdminUserManagement_uAdminUserNew : BaseUserControl
{
    private int AdminID = 0;
    private DataTable dtUserPermission = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPermissions();

            if (int.TryParse(Request.QueryString["jID"], out AdminID))
                FillData();
        }
        else
        {
            hdPermissionChecked.Value = "";
            uSuccess1.Visible = false;
            uSuccess2.Visible = false;
            uError1.Visible = false;
            uError2.Visible = false;
        }
        ChSelectedGenereate(!(Request.Form[btnSend.UniqueID] == null));
    }

    protected void FillData() {
        DataTable dt = BUS.AdminPermissions.GetAdmin(this.AdminID);
        if (dt.Rows.Count > 0) {
            hdAdminID.Value = this.AdminID.ToString();
            txtUserName.Text = dt.Rows[0]["UserName"].ToString();
            txtPassword.Text = LIB.Encryption.Decrypt(dt.Rows[0]["Password"].ToString());
            txtFirstname.Text = dt.Rows[0]["FirstName"].ToString();
            txtSurName.Text = dt.Rows[0]["SurName"].ToString();
            txtDescription.Text = dt.Rows[0]["Description"].ToString();
            rdActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
            rdInactive.Checked = !rdActive.Checked;

            txtUserName.ReadOnly = true;

            this.dtUserPermission = BUS.AdminPermissions.GetAdminUserPermission(this.AdminID);
            foreach (DataRow dr in this.dtUserPermission.Rows)
                hdPermissionChecked.Value += dr["AdminPermissionID"].ToString() + ", ";
        }
    }

    protected void BindPermissions()
    {
        LIB.DataBindHelper.BindRepeater(ref rptPermissionList, BUS.AdminPermissions.AdminPermissionsSel());        
    }

    private void ChSelectedGenereate(bool IsSaveClick)
    {
        int PermissionID = 0;     
        int ParentID = 0;

        bool IsChecked = false;

        CheckBox ch;

        foreach (RepeaterItem e in rptPermissionList.Items)
        {
            if ((e.ItemType == ListItemType.Item) || (e.ItemType == ListItemType.AlternatingItem))
            {
                PermissionID = int.Parse(((Literal)e.FindControl("ltlPermissionID")).Text);
                ParentID = int.Parse(((Literal)e.FindControl("ltlParentID")).Text);
                
                foreach (Control c in e.Controls)
                {
                    if (c.GetType().Name == "CheckBox")
                    {                        
                        ch = (CheckBox)c;
                        if (!IsSaveClick)
                        {
                            if (ParentID == 0)
                            {
                                ch.AutoPostBack = true;
                                ch.Font.Bold = true;

                                ((Literal)e.FindControl("ltlHr")).Visible = true;
                                ((Literal)e.FindControl("ltlBr")).Visible = true;

                                IsChecked = ch.Checked;
                            }
                            else
                                ch.Checked = IsChecked;

                            if (this.AdminID > 0)
                                ch.Checked = LIB.DataTableHelper.ExistValue(this.dtUserPermission, "AdminPermissionID", PermissionID.ToString());
                        }
                        if (ch.Checked) hdPermissionChecked.Value += PermissionID + ", ";
                    }
                }
            }                        
        }                
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        uError2.Visible = ((int.Parse(hdAdminID.Value) == 0) && (BUS.AdminPermissions.HasAdmins(txtUserName.Text)));
        if (!uError2.Visible)
        {
            ArrayList arr = new ArrayList(hdPermissionChecked.Value.Split(new string[] { ", " }, StringSplitOptions.RemoveEmptyEntries));
            bool IsSave =(BUS.AdminPermissions.AdminUserNew(int.Parse(hdAdminID.Value), txtUserName.Text, txtPassword.Text, txtFirstname.Text, txtSurName.Text, txtDescription.Text, this.smAdminID, rdActive.Checked, arr));
            if (IsSave)
            {
                uSuccess1.Visible = (int.Parse(hdAdminID.Value) == 0);
                uSuccess2.Visible = !uSuccess1.Visible;
            }
            uError1.Visible = !IsSave;
            pnlForm.Visible = !IsSave;
        }        
    }
}
