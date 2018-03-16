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
using COM.ADM;

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


    public int smAdminID
    {
        get { return (GET(EnumUtil.Sess.AdminID) == null ? 0 : (int)GET(EnumUtil.Sess.AdminID)); }
        set { SET(EnumUtil.Sess.AdminID, value); }
    }

    public DataTable smPermissions
    {
        get { return (GET(EnumUtil.Sess.Permissions) == null ? null : (DataTable)GET(EnumUtil.Sess.Permissions)); }
        set { SET(EnumUtil.Sess.Permissions, value); }
    }

    public string smPhoto
    {
        get { return (GET(EnumUtil.Sess.Photo) == null ? String.Empty : GET(EnumUtil.Sess.Photo).ToString()); }
        set { SET(EnumUtil.Sess.Photo, value); }
    }

}