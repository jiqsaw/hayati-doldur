using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using facebook;
using facebook.web;
using facebook.Schema;
using facebook.Utility;

/// <summary>
/// Summary description for FacebookService
/// </summary>
public class FacebookService
{
    public enum PhotoSize
    {
        thumb,
        small,
        normal,
        square
    }

    #region :: Init ::

    API F;
    user u;

    private void Init()
    {
        F = new API();

        F.ApplicationKey = FacebookService.ApiKey;
        F.SessionKey = FacebookService.SessionKey;
        F.Secret = FacebookService.SecretKey;
        F.uid = FacebookService.UserID;
    }

    public FacebookService()  
    {
        Init();
    }
  
    public static bool isConnected()  
    {  
        return (SessionKey != null && UserID != -1);  
    }

    public static string ApiKey  
    {  
        get  
        {  
            return ConfigurationManager.AppSettings["APIKey"];  
        }  
    }    
    public static string SecretKey  
    {  
        get  
        {  
            return ConfigurationManager.AppSettings["Secret"];  
        }  
    }  
  
    public static string SessionKey  
    {  
        get  
        {  
            return GetFacebookCookie("session_key");  
        }
    }
    public static long UserID
    {
        get
        {
            long userID = -1;
            long.TryParse(GetFacebookCookie("user"), out userID);
            return userID;
        }
    }
  
    private static string GetFacebookCookie(string cookieName)
    {  
        string retString = null;  
        string fullCookie = ApiKey + "_" + cookieName;  
  
        if (HttpContext.Current.Request.Cookies[fullCookie] != null)  
            retString = HttpContext.Current.Request.Cookies[fullCookie].Value;  
  
        return retString;  
    }  
    
    #endregion

    public user gUserInfo()
    {
        return F.users.getInfo();
    }

    private void SetUserInfo() {
        if (u == null) u = gUserInfo();
    }

    public long uID
    {
        get
        {
            SetUserInfo();
            return (long)u.uid;
        }
    }

    public string FirstName {
        get {
            SetUserInfo();
            return u.first_name;
        }
    }

    public string Surname
    {
        get
        {
            SetUserInfo();
            return u.last_name;
        }
    }

    public DateTime BirthDate
    {
        get
        {
            SetUserInfo();
            try
            {
                return Convert.ToDateTime(u.birthday);
            }
            catch (Exception)
            {
                return DateTime.MinValue;
            }
        }
    }

    public string Sex
    {
        get
        {
            SetUserInfo();
            return u.sex;
        }
    }

    public string PhotoBig
    {
        get
        {
            SetUserInfo();
            return u.pic_big;
        }
    }

    public string Photo
    {
        get
        {
            SetUserInfo();
            return u.pic;
        }
    }

    public string PhotoSmall
    {
        get
        {
            SetUserInfo();
            return u.pic_small;
        }
    }

    public string PhotoSquare
    {
        get
        {
            SetUserInfo();
            return u.pic_square;
        }
    }

    public static string ProfileURLByID(long FacebookID)
    {
        return "http://www.facebook.com/profile.php?id=" + FacebookID.ToString();
    }

    public IList<user> gFriends()
    {
        return F.friends.getUserObjects();
    }

    public void LogOff() {
        CookiesRemove();
        F.LogOff();        
    }

    public void CookiesRemove() {
        try
        {
            //HttpContext.Current.Request.Cookies.Clear();
            HttpContext.Current.Request.Cookies.Remove(ApiKey);
            HttpContext.Current.Request.Cookies.Remove(ApiKey + "_" + "user");
            HttpContext.Current.Request.Cookies.Remove(ApiKey + "_" + "ss");
            HttpContext.Current.Request.Cookies.Remove(ApiKey + "_" + "session_key");
            HttpContext.Current.Request.Cookies.Remove(ApiKey + "_" + "expires");
            HttpContext.Current.Request.Cookies.Remove("fbsetting" + "_" + ApiKey);
        }
        catch (Exception)
        { }   
    }

    public bool Publish(string imgPath, string URL, string Title, string Detail)
    {
        //146183773771
        //{*actor*}, {*blogname*} > Feyyaz, Hayatı Doldur'da
        //{*body*} > Tükiye Maçı etknliğini gördü ve katılmayı düşünüyor

        if (F.users.hasAppPermission(facebook.Types.Enums.Extended_Permissions.status_update))
        {
            long templateid;
            Dictionary<string, string> template_data = new Dictionary<string, string>();
            List<long> target_ids = new List<long>(); //Sadece login olan kişinin duvarına yapıştıracağı için id eklemeye gerek yok
            facebook.feed.PublishedStorySize story_size;

            templateid = 146183773771;
            template_data.Add("images", TemplateImagesGen(imgPath, URL));
            template_data.Add("blogname", Title);
            template_data.Add("body", Detail);

            URL = "<a href='" + URL + ">" + URL + "</a>";
            story_size = facebook.feed.PublishedStorySize.Full;
            try
            {
                return F.feed.publishUserAction(templateid, template_data, target_ids, URL, story_size);
            }
            catch (Exception)
            {
                return false;
            }            
        }
        return false;
    }

    private string TemplateImagesGen(string imgPath, string URL) {
        List<string> jsonPaths = new List<string>();
        Dictionary<string, string> path = new Dictionary<string, string>();
        imgPath = LIB.Util.ApplicationRootPath() + imgPath;
        //imgPath = "http://www.hayatidoldur.com/Image.ashx?t=1&p=HayatiDoldur_00034_01_300909-133808,1.jpeg&sz=1"; //Test Images
        path.Add("src", imgPath);
        path.Add("href", URL);
        path.Add("target", "_blank");
        jsonPaths.Add(JSONHelper.ConvertToJSONAssociativeArray(path));
        return JSONHelper.ConvertToJSONArray(jsonPaths);
    }
    
    public bool hasAppPermission(facebook.Types.Enums.Extended_Permissions Extended_Permission) {
        return F.users.hasAppPermission(Extended_Permission);
    }
}