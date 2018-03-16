using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Activity_uActivityNewHolder : BaseUserControl
{
    private int ActivityID;
    private int qo;
    public bool IsEdit
    {
        get { return (ViewState["IsEdit"] == null ? false : bool.Parse(ViewState["IsEdit"].ToString())); }
        set { ViewState["IsEdit"] = value.ToString(); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (int.TryParse(Request.QueryString["j"], out ActivityID))
            {
                uActivityNew1.ActivityID = ActivityID;
                this.IsEdit = true;
            }
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if ((!IsPostBack) && (int.TryParse(Request.QueryString["qo"], out qo)))
        {
            if (qo == 3)
            {
                uActivityNew1.Visible = false;
                uPhotoUpload1.Visible = false;

                uActivityNewRelations1.Visible = true;
                uActivityNewRelations1.ActivityID = this.ActivityID;
                uActivityNewRelations1.ActivityID = this.ActivityID;
                uActivityNewRelations1.CategoryID = int.Parse(Request.QueryString["c"]);
                uActivityNewRelations1.IsEdit = true;
            }
        }
        else
        {
            if (uActivityNewRelations1.IsSaved)
            {
                uActivityNewRelations1.Visible = false;
                uSuccess1.Visible = true;
            }
            else
            {
                if (uActivityNew1.IsSaved)
                {

                    uActivityNew1.Visible = false;
                    uPhotoUpload1.Visible = true;

                    uPhotoUpload1.PhotoSaveNameOrg = COM.Util.genAcDefName(uActivityNew1.ActivityID, 0, this.smAdminID);
                    uPhotoUpload1.PhotoSaveNameCropped = COM.Util.genAcDefName(uActivityNew1.ActivityID, 1, this.smAdminID);
                    uPhotoUpload1.PhotoSaveNameThumb = COM.Util.genAcDefName(uActivityNew1.ActivityID, 2, this.smAdminID);

                    uActivityNewRelations1.ActivityID = uActivityNew1.ActivityID;
                    uActivityNewRelations1.CategoryID = uActivityNew1.CategoryID;

                    if (uPhotoUpload1.IsSaved)
                    {
                        if (PhotoUpdate())
                        {
                            uPhotoUpload1.Visible = false;
                            if (!this.IsEdit)
                            {
                                uActivityNewRelations1.Visible = true;
                            }
                            else
                                Response.Redirect("ActivityNew.aspx?j=" + uActivityNew1.ActivityID.ToString());
                        }
                    }
                }
            }
        }
    }

    protected bool PhotoUpdate()
    {
        return BUS.Activities.ActivityPhotoUp(uActivityNew1.ActivityID, uPhotoUpload1.PhotoName);
    }

}