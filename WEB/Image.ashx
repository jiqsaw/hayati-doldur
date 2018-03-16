<%@ WebHandler Language="C#" Class="Image" %>

using System;
using System.Web;
using System.Configuration;

public class Image : IHttpHandler {

    private string Path = ConfigurationManager.AppSettings["AdminRoot"].ToString();
    private string pathActivity = ConfigurationManager.AppSettings["PathActivityImg"].ToString();
    private string pathActivityByUser = ConfigurationManager.AppSettings["PathActivityImgByUser"].ToString();
    private string pathUser = ConfigurationManager.AppSettings["PathUserImg"].ToString();

    private string PhotoName = "";
    private int PhotoSize = 0;    
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    
    public void ProcessRequest(HttpContext context) {

        int ImageTypeqs = 0;
        COM.Enum.ImageTypes ImageType = COM.Enum.ImageTypes.None;
        if (int.TryParse(context.Request.QueryString["t"], out ImageTypeqs)) {
            switch (ImageTypeqs)
            {
                case (int)COM.Enum.ImageTypes.Activity:
                    ImageType = COM.Enum.ImageTypes.Activity;
                    Path += pathActivity;
                    break;
                    
                case (int)COM.Enum.ImageTypes.User:
                    ImageType = COM.Enum.ImageTypes.User;
                    Path += pathUser;
                    break;
                    
                case (int)COM.Enum.ImageTypes.ActivityByUser:
                    ImageType = COM.Enum.ImageTypes.ActivityByUser;
                    Path += pathActivityByUser;
                    break;
            }
            
            if (LIB.Util.IsString(context.Request.QueryString["p"])) {
                PhotoName = context.Request.QueryString["p"].ToString();
            }
        }
        
        try
        {
            if ((ImageType != COM.Enum.ImageTypes.None) && (PhotoName != ""))
                Path += PhotoName;
            else
            {
                if (int.TryParse(context.Request.QueryString["sz"], out PhotoSize))            
                    Path += "NoPicture," + PhotoSize.ToString() + ".jpg";
            }
            
            GetImage(Path);
        }
        catch
        {
            //context.Response.Write("");
        }
    }

    public void GetImage(string Photo) {
        Path = Path.Replace("/", "\\");
        System.IO.FileStream oStream = System.IO.File.OpenRead(Path);

        byte[] bn = new byte[oStream.Length];
        while (oStream.Read(bn, 0, bn.Length) == bn.Length) { }
        oStream.Close();
        string binary = Convert.ToBase64String(bn);
        byte[] d = Convert.FromBase64String(binary);

        //context.Response.ContentType = “image/gif”;
        HttpContext.Current.Response.BinaryWrite(d);
    }    

}