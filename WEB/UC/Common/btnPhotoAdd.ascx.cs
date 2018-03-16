using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_btnPhotoAdd : BaseUserControl
{
    private int _ActivityID;
    public int ActivityID {
        set { this._ActivityID = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (this.smIsLogin)
                hlAddPhoto.NavigateUrl = "javascript:PhotoAdd(" + this._ActivityID.ToString() + ")";
            else
                hlAddPhoto.NavigateUrl = "~/Login.aspx";
        }
    }
}