using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UserControls_Common_ModalPopup : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e) {
        pnlModal.Style.Add("display", "none");
    }

    public string TargetControlID
    {
        set { MPE.TargetControlID = value; }
    }

    public string Title
    {
        set { ltlTitle.Text = value; }
    }

    public string Message
    {
        set { ltlText.Text = value; }
    }

    public string OnOkScript
    {
        set { MPE.OnOkScript = value; }
    }
}
