using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Collections;

/// <summary>
/// Summary description for BaseUserControl
/// </summary>
public class BaseUserControl : SM
{
    public string Config(COM.ADM.EnumUtil.Config Param)
    {
        return (ConfigurationManager.AppSettings[Param.ToString()] == null) ? String.Empty : ConfigurationManager.AppSettings[Param.ToString()].ToString();
    }

    public void Login() {
        if (!this.smIsLogin)
            this.qoLoginPage();
    }

    public void qoDefaultPage() {
        HttpContext.Current.Response.Redirect("~/");
    }

    public void qoLoginPage()
    {
        HttpContext.Current.Response.Redirect("~/Login.aspx");
    }

    public void qoActivityDetail(int ActivityID, string Category, string ActivityTitle)
    {
        HttpContext.Current.Response.Redirect(strActivityDetailPage(ActivityID, Category, ActivityTitle));
    }
    public void qoUserPage(int UserID)
    {
        HttpContext.Current.Response.Redirect(this.strUserPage(UserID));
    }
    public void qoUserPage(long FacebookID)
    {
        HttpContext.Current.Response.Redirect(this.strUserPage(FacebookID));
    }
    public void qoUserProfilePage()
    {
        HttpContext.Current.Response.Redirect(this.strUserProfilePage());
    }
    public void qoUserProfilePage(bool IsFirstLogin)
    {
        HttpContext.Current.Response.Redirect("~/UserProfile.aspx?Is=" + (Convert.ToInt32(IsFirstLogin)).ToString());
    }  

    public string strActivityDetailPage(int ActivityID, string Category, string ActivityTitle)
    {
        return COM.Util.UrlMap(ActivityID, Category, ActivityTitle);
    }

    public string strUserPage(int UserID)
    {
        return "~/User.aspx?j=" + UserID.ToString();
    }
    public string strUserPage(long FacebookID)
    {
        return "~/User.aspx?j=" + FacebookID.ToString();
    }    
    public string strUserProfilePage()
    {
        return "~/UserProfile.aspx";
    }

    public string strPhotoDetailPage(int ActivityID, int PhotoID, string Keywords, string CreatedByUserFirstname, string CreatedByUserSurname)
    {
        return "~/__j" + ActivityID.ToString() + "/__p" + PhotoID.ToString() + "/" + LIB.Util.Left(LIB.Util.FormatURL(Keywords), 20) + "/" + LIB.Util.FormatURL(CreatedByUserFirstname) + LIB.Util.FormatURL(CreatedByUserSurname) + ".hd";
    }

    public void SetUserSession(bool IsFacebookUser, int UserID, string Email, string FirstName, string Surname, string Photo, string PhotoSmall, string PhotoBig, string PhotoSquare) {
        this.smIsFacebookUser = IsFacebookUser;
        this.smIsLogin = true;
        this.smUserID = UserID;
        this.smEmail = Email;
        this.smFirstName = FirstName;
        this.smSurname = Surname;
        this.smPhoto = Photo;
        this.smPhotoSmall = PhotoSmall;
        this.smPhotoBig = PhotoBig;
        this.smPhotoSquare = PhotoSquare;
    }
    
    public string ImageUrl(COM.Enum.ImageTypes ImageType, string PhotoName, COM.Enum.PhotoSizes PhotoSize)
    {
        return ImageUrl(ImageType, PhotoName, (int)PhotoSize);
    }

    public string ImageUrl(COM.Enum.ImageTypes ImageType, string PhotoName, int PhotoSize)
    {
        if (PhotoName.IndexOf("http://profile.ak.fbcdn.net") != -1)
            return PhotoName;
        else
            return "~/Image.ashx?t=" + ((int)ImageType).ToString() + "&p=" + COM.Util.genPhotoNameOfSize(PhotoName, PhotoSize) + "&sz=" + PhotoSize.ToString();
    }

    public bool IsFacebookImg(string Photo) {
        return (Photo.IndexOf("http://profile.ak.fbcdn.net") != -1);
    }

    public string FacebookImgChangeSize(string Photo, COM.Enum.PhotoSizes PhotoSize) {
        switch (PhotoSize)
        {
            case COM.Enum.PhotoSizes.Big200:
                return Photo.Replace("/s", "/n");
                break;
            case COM.Enum.PhotoSizes.Small50:
                return Photo.Replace("/s", "/t");
                break;
            case COM.Enum.PhotoSizes.Square50:
                return Photo.Replace("/s", "/q");
                break;
        }
        return Photo;
    }

}