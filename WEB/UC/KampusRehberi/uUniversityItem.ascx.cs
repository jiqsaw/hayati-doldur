using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIB;

public partial class UC_KampusRehberi_uUniversityItem : System.Web.UI.UserControl
{

    public int OrientationUniversityID { set { hlUniversity.NavigateUrl = "~/KampusRehberiDetay.aspx?j=" + value; } }
    public string University { set { hlUniversity.Text = value; } }
    public string Address { set { ltlAddress.Text = Util.Nl2Br(value); } }
    public string Web { set { hlWeb.Text = value; hlWeb.NavigateUrl = "http://" + value; } }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
