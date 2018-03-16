using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_User_uSendActivationCode : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void imgActivationSend_Click(object sender, ImageClickEventArgs e)
    {
        string ActivationCode = BUS.Users.GetActivationCode(txtEmail.Text);
        if (ActivationCode != String.Empty)
        {
            Mailing Mail = new Mailing();
            Success.Visible = Mail.SendActivate(txtEmail.Text, ActivationCode);
        }

        errNoUser.Visible = !Success.Visible;
    }
}
