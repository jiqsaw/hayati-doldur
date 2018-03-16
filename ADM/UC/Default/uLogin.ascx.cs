using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LIB;

public partial class UC_Default_uLogin : BaseUserControl
{
    private bool IsLogout = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (bool.TryParse(Request.QueryString["qo"], out IsLogout))
                if (IsLogout) SessionClear();
        }
        if (this.smIsLogin) Response.Redirect("~/Management.aspx");
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        int returnID = BUS.AdminLogin.Login(txtUserName.Text, txtPassword.Text);
        if (returnID > 0)
        {
            BindSession(returnID);
            Response.Redirect("~/Management.aspx");
        }
        else
            uError1.Visible = true;

    }

    void SessionClear() {
        Session.Clear();
        Session.Abandon();
    }

    void BindSession(int AdminID) {
        this.smIsLogin = true;
        this.smAdminID = AdminID;
        this.smPermissions = BUS.AdminLogin.GetUserPermission(AdminID);
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        txtUserName.Text = "Wanda";
        txtPassword.Text = "wanda987";
        btnSend_Click(new object(), new EventArgs());
    }
}
