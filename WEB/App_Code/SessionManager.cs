using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using COM;

public class SM : System.Web.UI.UserControl
{
    private void SET(EnumUtil.Sess SessionName, object Value) { System.Web.HttpContext.Current.Session[SessionName.ToString()] = Value; }
    private object GET(EnumUtil.Sess SessionName) { return System.Web.HttpContext.Current.Session[SessionName.ToString()]; }

    /*
    public EnumDB.LanguageID smLanguageID
    {
        get { return (GET(EnumUtil.Sess.LanguageID) == null ? EnumDB.LanguageID.Turkish : (EnumDB.LanguageID)((int)GET(EnumUtil.Sess.LanguageID))); }
        set { SET(EnumUtil.Sess.LanguageID, (int)value); }
    }

    public DateTime smLastLoginDate
    {
        get { return (GET(EnumUtil.Sess.LastLoginDate) == null ? DateTime.MaxValue : Convert.ToDateTime(GET(EnumUtil.Sess.LastLoginDate).ToString())); }
        set { SET(EnumUtil.Sess.LastLoginDate, value); }
    }

    public bool smIsCvActive
    {
        get { return (GET(EnumUtil.Sess.IsCvActive) == null ? false : Convert.ToBoolean(GET(EnumUtil.Sess.IsCvActive).ToString())); }
        set { SET(EnumUtil.Sess.IsCvActive, value); }
    }

    public string smPikCredi
    {
        get { return (GET(EnumUtil.Sess.PikCredi) == null ? String.Empty : GET(EnumUtil.Sess.PikCredi).ToString()); }
        set { SET(EnumUtil.Sess.PikCredi, value); }
    }

    public int smJobID
    {
        get { return (GET(EnumUtil.Sess.JobID) == null ? 0 : (int)GET(EnumUtil.Sess.JobID)); }
        set { SET(EnumUtil.Sess.JobID, value); }
    }

    public ArrayList smMessageUserIDs
    {
        get { return (GET(EnumUtil.Sess.MessageUserIDs) == null ? new ArrayList() : (ArrayList)GET(EnumUtil.Sess.MessageUserIDs)); }
        set { SET(EnumUtil.Sess.MessageUserIDs, value); }
    }

    public DataTable smPermissions
    {
        get { return (GET(EnumUtil.Sess.Permissions) == null ? null : (DataTable)GET(EnumUtil.Sess.Permissions)); }
        set { SET(EnumUtil.Sess.Permissions, value); }
    }


    public struct User
    {
        public int UyeID;
        public string Nickname;
        public string Email;
        public string Isim;
        public bool ErkekMi;
        public int DogumTarihi;
        public string Custom;
        public string UyeResim;
        public COM.Enum.UserLevel YetkiKodu;
    }
    public User smUser
    {
        get { return (GET(EnumUtil.Sess.User) == null) ? new User() : (User)GET(EnumUtil.Sess.User); }
        set { SET(EnumUtil.Sess.User, value); }
    }

    */

    public bool smIsLogin
    {
        get { return (GET(EnumUtil.Sess.IsLogin) == null ? false : Convert.ToBoolean(GET(EnumUtil.Sess.IsLogin).ToString())); }
        set { SET(EnumUtil.Sess.IsLogin, value); }
    }

    public bool smIsFacebookUser
    {
        get { return (GET(EnumUtil.Sess.IsFacebookUser) == null ? false : Convert.ToBoolean(GET(EnumUtil.Sess.IsFacebookUser).ToString())); }
        set { SET(EnumUtil.Sess.IsFacebookUser, value); }
    }

    public int smUserID
    {
        get { return (GET(EnumUtil.Sess.UserID) == null ? 0 : (int)GET(EnumUtil.Sess.UserID)); }
        set { SET(EnumUtil.Sess.UserID, value); }
    }

    public long smFacebookID
    {
        get { return (GET(EnumUtil.Sess.FacebookID) == null ? 0 : (long)GET(EnumUtil.Sess.FacebookID)); }
        set { SET(EnumUtil.Sess.FacebookID, value); }
    }

    public string smEmail
    {
        get { return (GET(EnumUtil.Sess.Email) == null ? String.Empty : GET(EnumUtil.Sess.Email).ToString()); }
        set { SET(EnumUtil.Sess.Email, value); }
    }

    public string smFirstName
    {
        get { return (GET(EnumUtil.Sess.FirstName) == null ? String.Empty : GET(EnumUtil.Sess.FirstName).ToString()); }
        set { SET(EnumUtil.Sess.FirstName, value); }
    }

    public string smSurname
    {
        get { return (GET(EnumUtil.Sess.Surname) == null ? String.Empty : GET(EnumUtil.Sess.Surname).ToString()); }
        set { SET(EnumUtil.Sess.Surname, value); }
    }

    public string smPhoto
    {
        get { return (GET(EnumUtil.Sess.Photo) == null ? String.Empty : GET(EnumUtil.Sess.Photo).ToString()); }
        set { SET(EnumUtil.Sess.Photo, value); }
    }

    public string smPhotoSmall
    {
        get { return (GET(EnumUtil.Sess.PhotoSmall) == null ? String.Empty : GET(EnumUtil.Sess.PhotoSmall).ToString()); }
        set { SET(EnumUtil.Sess.PhotoSmall, value); }
    }

    public string smPhotoBig
    {
        get { return (GET(EnumUtil.Sess.PhotoBig) == null ? String.Empty : GET(EnumUtil.Sess.PhotoBig).ToString()); }
        set { SET(EnumUtil.Sess.PhotoBig, value); }
    }

    public string smPhotoSquare
    {
        get { return (GET(EnumUtil.Sess.PhotoSquare) == null ? String.Empty : GET(EnumUtil.Sess.PhotoSquare).ToString()); }
        set { SET(EnumUtil.Sess.PhotoSquare, value); }
    }    
}