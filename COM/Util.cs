using System;
using System.Collections.Generic;
using System.Text;

namespace COM
{
    public class Util
    {
        public static string ToDateTimeString(DateTime inDate) {
            return inDate.ToShortDateString() + " " + inDate.ToShortTimeString();
        }

        public static string ToDateTimeString(object inDateObj)
        {
            try
            {
                DateTime inDate = Convert.ToDateTime(inDateObj);
                return inDate.ToShortDateString() + " " + inDate.ToShortTimeString();
            }
            catch (Exception)
            {
                return String.Empty;                    
            }
        }

        public static string genAcDefName(int ActivityID, int ImgSize, int CreatedBy) {
            //00012_06_180809,0.jpg
            StringBuilder sb = new StringBuilder();
            sb.Append("HayatiDoldur_");
            sb.Append(ActivityID.ToString().PadLeft(5, '0'));
            sb.Append("_");
            sb.Append(CreatedBy.ToString().PadLeft(2, '0'));
            sb.Append("_");
            sb.Append(DateTime.Now.Day.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Month.ToString().PadLeft(2, '0'));
            sb.Append(LIB.Util.Right(DateTime.Now.Year.ToString(), 2));
            sb.Append("-");
            sb.Append(DateTime.Now.Hour.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Minute.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Second.ToString().PadLeft(2, '0'));
            sb.Append(",");
            sb.Append(ImgSize.ToString());
            
            return sb.ToString();
        }

        public static string genAcByUserName(int ActivityID, int UserID, int ImgSize)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("HayatiDoldur_");
            sb.Append(ActivityID.ToString().PadLeft(5, '0'));
            sb.Append("_");
            sb.Append(UserID.ToString().PadLeft(5, '0'));
            sb.Append("_");
            sb.Append(DateTime.Now.Day.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Month.ToString().PadLeft(2, '0'));
            sb.Append(LIB.Util.Right(DateTime.Now.Year.ToString(), 2));
            sb.Append("-");
            sb.Append(DateTime.Now.Hour.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Minute.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Second.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Millisecond.ToString().PadLeft(2, '0'));
            sb.Append("_");
            sb.Append(LIB.Util.CreateRandomNumber(2));
            sb.Append(",");
            sb.Append(ImgSize.ToString());

            return sb.ToString();
        }

        public static string genUserPicName(int UserID, COM.Enum.PhotoSizes PhotoSize)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("HayatiDoldur_");
            sb.Append(UserID.ToString().PadLeft(5, '0'));
            sb.Append("_");
            sb.Append(DateTime.Now.Day.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Month.ToString().PadLeft(2, '0'));
            sb.Append(LIB.Util.Right(DateTime.Now.Year.ToString(), 2));
            sb.Append("-");
            sb.Append(DateTime.Now.Hour.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Minute.ToString().PadLeft(2, '0'));
            sb.Append(DateTime.Now.Second.ToString().PadLeft(2, '0'));
            sb.Append(",");
            sb.Append(((int)PhotoSize).ToString());
            return sb.ToString();
        }

        public static string genPhotoUrl(string PhotoPath, string PhotoName) {
            return PhotoPath + PhotoName;
        }

        public static string genPhotoUrl(string PhotoPath, string PhotoName, COM.Enum.PhotoSizes PhotoSize)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(PhotoPath);
            sb.Append(PhotoName.Substring(0, PhotoName.LastIndexOf('.')));
            sb.Append(",");
            sb.Append(((int)PhotoSize).ToString());
            sb.Append(LIB.Util.GetExtension(PhotoName));
            return sb.ToString();
        }

        public static string genPhoto(string Class, string Href, string Keywords, string Src)
        {
            string tmp = "<a class='||CLASS||' href='||HREF||' title='||KEYWORDS||'><img alt='' src='||SRC||' /></a>";
            return tmp.Replace("||CLASS||", Class).Replace("||HREF||", Href).Replace("||KEYWORDS||", Keywords).Replace("||SRC||", Src);
        }

        public static string genVideoScript(string eID, string Video, string Photo, string Title, string Url) {
            Video = LIB.Encryption.base64Encode(Video);
            Photo = LIB.Encryption.base64Encode(Photo);
            Title = LIB.Encryption.base64Encode(Title);
            Url = LIB.Encryption.base64Encode(Url);
            return "Video(" + eID + ", " + Video + ", " + Photo + ", " + Title + ", " + Url + ")";
        }

        public static string genPhotoNameOfSize(string PhotoName, COM.Enum.PhotoSizes PhotoSize) {
            return genPhotoNameOfSize(PhotoName, (int)PhotoSize);
        }

        public static string genPhotoNameOfSize(string PhotoName, int ImgNo)
        {
            return PhotoName.Replace(",1", "," + ImgNo.ToString());
        }

        public static string fbIsFemale(string Sex)
        {
            if (Sex == "") return "";
            return (Sex == "erkek") ? "false" : "true";
        }

        public static string genActivatonCode() {
            return "HD" + LIB.Util.CreateRandomNumber(14);
        }

        public static string ReturnTimeAgo(DateTime inDate) {
            string strTime = "";
            TimeSpan ts = DateTime.Now - inDate;

            if (ts.Days >= 365)
                strTime = ((int)(ts.Days / 365)).ToString() + " yıl";

            else if (ts.Days >= 30)
                strTime = ((int)(ts.Days / 30)).ToString() + " ay";

            else if (ts.Days >= 7)
                strTime = ((int)(ts.Days / 7)).ToString() + " hafta";

            else if (ts.Days >= 1)
                strTime = ts.Days.ToString() + " gün";

            else if (ts.Hours >= 1)
                strTime = ts.Hours.ToString() + " saat";

            else if (ts.Minutes >= 1)
                strTime = ts.Minutes.ToString() + " dakika";

            else if (ts.Seconds >= 1)
                strTime = ts.Seconds.ToString() + " dakika";

            return strTime;
        }

        public static string fbPublishTitle()
        {
            return "Hayatı Doldur'da";
        }

        public static string fbPublishDetail(string ActivityTitle)
        {
            return ActivityTitle + " etknliğine katılıyor";
        }

        public static string UrlMap(int ActivityID, string Category, string ActivityTitle)
        {
            return "~/__j" + ActivityID.ToString() + "/" + LIB.Util.FormatURL(Category) + "/" + LIB.Util.FormatURL(ActivityTitle) + ".etkinligi";
        }
    }
}