using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Photo_uApprovedPhotos : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            uPhotoList1.BindData(BUS.Photos.GetPhotosforAdmin(true, false));
    }
}
