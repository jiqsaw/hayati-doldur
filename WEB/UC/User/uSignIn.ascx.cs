using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class UC_User_uSignIn : BaseUserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Request.UrlReferrer != null)
                hdUrlReferrer.Value = Request.UrlReferrer.AbsoluteUri;
    }

    protected void btnImgLogin_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = BUS.Users.Login(txtLoginEmail.Text, txtLoginPassword.Text);
        if ((dt != null) && (dt.Rows.Count > 0))
        {
            int UserID = Convert.ToInt32(dt.Rows[0]["UserID"]);
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

            if (hdUrlReferrer.Value != String.Empty)
                Response.Redirect(hdUrlReferrer.Value);
            else
                this.qoDefaultPage();
        }
        else
            errNoLogin.Visible = true;
    }
}