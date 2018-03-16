using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using LIB;

public partial class UC_User_uFacebookLogin : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((FacebookService.isConnected()) && (Util.IsNumeric(Request.QueryString["f"])))
            {

                FacebookService F = new FacebookService();
                int UserID = (BUS.Users.UserFacebookIn(F.uID, F.FirstName, F.Surname, COM.Util.fbIsFemale(F.Sex), F.BirthDate));
                DataTable dt = BUS.Users.GetUserDetail(UserID);
                if (dt.Rows.Count > 0)
                {
                    this.smFacebookID = F.uID;
                    string Email = dt.Rows[0]["Email"].ToString();
                    string FirstName = dt.Rows[0]["FirstName"].ToString();
                    string Surname = dt.Rows[0]["Surname"].ToString();
                    string Photo = (dt.Rows[0]["Photo"] != DBNull.Value) ? dt.Rows[0]["Photo"].ToString() : String.Empty;
                    string PhotoSmall = "";
                    string PhotoBig = "";
                    string PhotoSquare = "";

                    if (Photo != "")
                    {
                        Photo = dt.Rows[0]["Photo"].ToString();
                        PhotoSmall = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Small50);
                        PhotoBig = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Big200);
                        PhotoSquare = COM.Util.genPhotoNameOfSize(Photo, COM.Enum.PhotoSizes.Square50);
                    }

                    this.SetUserSession(true, UserID, Email, FirstName, Surname, Photo, PhotoSmall, PhotoBig, PhotoSquare);

                    F.CookiesRemove();

                    if (hdUrlReferrer.Value != String.Empty)
                        Response.Redirect(hdUrlReferrer.Value);
                    else
                        this.qoDefaultPage();
                }
            }

            if (Request.UrlReferrer != null)
                hdUrlReferrer.Value = Request.UrlReferrer.AbsoluteUri;
        }
    }
}
