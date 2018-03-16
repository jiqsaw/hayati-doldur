using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_User_uLogin : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HasCookie())
        {
            if (this.smIsLogin)
                this.qoDefaultPage();
            else
            {
                imgSignup.Attributes.Add("onclick", "ShowHideChng('" + pnlStep2.ClientID + "', '" + pnlStep1.ClientID + "')");
                imgSignup.Style.Add("cursor", "pointer");

                if (!IsPostBack)
                {
                    int IsNew;
                    if (int.TryParse(Request.QueryString["IsNew"], out IsNew))
                    {
                        if (IsNew == 1)
                            pnlStep1.Style.Add("display", "none");
                    }
                    else
                        pnlStep2.Style.Add("display", "none");
                }
            }           
        }
    }

    private bool HasCookie()
    {
        Cookie C = new Cookie();
        int UserID;
        if (int.TryParse(C.Read(COM.EnumUtil.Cookies.UserID), out UserID))
        {
            DataTable dt = BUS.Users.GetUserDetail(UserID);
            if (dt.Rows.Count > 0)
            {
                string Email = dt.Rows[0]["Email"].ToString();
                string FirstName = dt.Rows[0]["FirstName"].ToString();
                string Surname = dt.Rows[0]["Surname"].ToString();
                string Photo = String.Empty;
                string PhotoSmall = String.Empty;
                string PhotoBig = String.Empty;
                string PhotoSquare = String.Empty;

                if ((dt.Rows[0]["Photo"] != DBNull.Value))
                {
                    Photo = dt.Rows[0]["Photo"].ToString();
                    PhotoSmall = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Small50);
                    PhotoBig = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Big200);
                    PhotoSquare = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Square50);
                }

                this.SetUserSession(false, UserID, Email, FirstName, Surname, Photo, PhotoSmall, PhotoBig, PhotoSquare);
                this.qoDefaultPage();
            }
        }
        return false;
    }
}