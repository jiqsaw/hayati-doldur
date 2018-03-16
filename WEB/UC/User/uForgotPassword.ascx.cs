using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_User_uForgotPassword : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imgTell_Click(object sender, ImageClickEventArgs e)
    {
        string Pass = BUS.Users.GetPassword(txtEmail.Text);
        if (Pass != String.Empty)
        {
            Pass = LIB.Encryption.Decrypt(Pass);
            Mailing Mail = new Mailing();
            Success.Visible = Mail.SendPassword(txtEmail.Text, Pass);
        }

        errNoUser.Visible = !Success.Visible;
    }
}