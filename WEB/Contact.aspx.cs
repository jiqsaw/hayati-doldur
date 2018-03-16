using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIB;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnImgSend_Click(object sender, ImageClickEventArgs e)
    {
        Mailing Mail = new Mailing();

        try
        {
            Success.Visible = Mail.SendContact(Util.r(txtName.Text), Util.r(txtEmail.Text), Util.r(txtUniversity.Text), Util.r(ddlSubject.SelectedValue), Util.r(txtMessage.Text));
        }
        catch (Exception)
        {
        }        
        Err.Visible = !Success.Visible;
        pnlForm.Visible = false;
    }
}