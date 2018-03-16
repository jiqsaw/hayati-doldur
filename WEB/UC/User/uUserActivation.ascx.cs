using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_User_uUserActivation : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ActivationCode = String.Empty;
        if (LIB.Util.IsString(Request.QueryString["AC"]))
        {
            ActivationCode = Request.QueryString["AC"].ToString();
            int UserID = BUS.Users.Activate(ActivationCode);
            if (UserID > 0)
            {
                DataTable dt = BUS.Users.GetUserDetail(UserID);
                if (dt.Rows.Count > 0)
                {
                    string Email = dt.Rows[0]["Email"].ToString();
                    string FirstName = dt.Rows[0]["FirstName"].ToString();
                    string Surname = dt.Rows[0]["Surname"].ToString();

                    this.SetUserSession(false, UserID, Email, FirstName, Surname, String.Empty, String.Empty, String.Empty, String.Empty);
                    this.qoUserProfilePage(true);
                }
            }
            this.qoLoginPage();
        }
        this.qoDefaultPage();
    }
}