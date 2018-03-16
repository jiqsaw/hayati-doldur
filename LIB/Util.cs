using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace LIB {
    public class Util
    {
        public static string Left(string param, int length) 
        {
            if (param.Length < length) { length = param.Length; }
            return param.Substring(0, length);
        }
        public static string Right(string param, int length) 
        {
            if (param.Length < length) { length = param.Length; }
            return param.Substring(param.Length - length, length);
        }
        public static string Mid(string param, int startIndex, int length) 
        {
            if (param.Length < length) { length = param.Length; }
            return param.Substring(startIndex, length);
        }
        public static string Mid(string param, int startIndex) 
        {
            return param.Substring(startIndex);
        }

        public static string ToUpper(string Text) 
        {
            return Text.Replace('i', '�').Replace('�', 'I').ToUpperInvariant();
        }
        public static string ToLower(string Text) 
        {
            return Text.Replace('�', 'i').Replace('I', '�').ToLowerInvariant();
        }
        public static string SpecialName(string Text) {
            string strOutput = String.Empty;
            ArrayList arrTexts = new ArrayList();
            arrTexts.AddRange(Text.Split(' '));
            for (int i = 0; i < arrTexts.Count; i++)
            {
                if (arrTexts[i].ToString().Trim() != String.Empty)
                {
                    strOutput += ToUpper(Left(arrTexts[i].ToString(), 1)) + ToLower(Mid(arrTexts[i].ToString(), 1));
                    if ((arrTexts.Count > 0) && ((arrTexts.Count - 1) > i)) strOutput += ' ';
                }
            }
            return strOutput;
        }

        public static string ReturnPageNameFull() 
        {
            return System.IO.Path.GetFileName(System.Web.HttpContext.Current.Request.RawUrl);
        }
        public static string ReturnPageName() 
        {
            return HttpContext.Current.Request.Url.Segments[HttpContext.Current.Request.Url.Segments.Length - 1];
        }        
        public static string ReturnRefererPageName() 
        {
            return System.IO.Path.GetFileName(System.Web.HttpContext.Current.Request.UrlReferrer.ToString());
        }
        public static string ApplicationRootPath() {
            return System.Web.HttpContext.Current.Request.Url.AbsoluteUri.Substring(0, System.Web.HttpContext.Current.Request.Url.AbsoluteUri.LastIndexOf('/') + 1);
        }
        public static bool IsLocal()
        {
            return HttpContext.Current.Request.IsLocal;
        }

        public static float FormatPrice(object inNumber) {
            return float.Parse(String.Format("{0:c}", inNumber).Replace(System.Globalization.CultureInfo.CurrentCulture.NumberFormat.CurrencySymbol, "").Trim());
        }
        public static string FormatPriceToString(object inNumber) {
            return String.Format("{0:c}", inNumber).Replace(System.Globalization.CultureInfo.CurrentCulture.NumberFormat.CurrencySymbol, "").Trim();
        }
        public static string FormatPhone(string input) {
            input = input.Replace(" ", String.Empty);
            if (input.Length == 7) return String.Format("{0:### ## ##}", Convert.ToInt64(input));
            else if (input.Length == 10) return String.Format("{0:(###) ### ## ##}", Convert.ToInt64(input));
            else if (input.Length == 11) return String.Format("{0:#(###) ### ## ##}", Convert.ToInt64(input));
            else if (input.Length == 12) return String.Format("{0:##(###) ### ## ##}", Convert.ToInt64(input));
            else if (input.Length == 13) return String.Format("{0:###(###) ### ## ##}", Convert.ToInt64(input));
            else return input;
        }
        public static string FormatURL(string URL)
        {
            URL = URL.Replace(" ", "-");
            URL = TrToEng(URL);
            Regex objAlphaNumericPattern = new Regex("[^a-zA-Z0-9-]");
            return objAlphaNumericPattern.Replace(URL, "");
        }

        public static bool IsEven(object input)
        { return ((int)((int.Parse(input.ToString())))) % 2 == 0; }

        /// <summary>
        /// String i�indeki yeni sat�rlar� <code>&lt;br /&gt;</code>'ye d�n��t�r�r.
        /// </summary>
        /// <param name="Text">Yeni sat�rlar� html break'e d�n��t�r�lecek string</param>
        /// <returns>Yeni sat�rlar� break'e d�n��t�r�lm�� string</returns>
        public static string Nl2Br(string Text) {
            return Text.Replace("\n", "<br />");
        }

        /// <summary>
        /// String i�indeki linkleri <code>&lt;a href=''&gt;</code>'e d�n��t�r�r.
        /// </summary>
        /// <param name="Text">Input String</param>
        /// <returns></returns>

        public static string Url2Link(string inputText)
        {
            int UrlIndex = inputText.IndexOf("http://");
            if (UrlIndex != -1)
            {
                try
                {
                    int UrlEndIndex = inputText.IndexOf(" ", UrlIndex) != -1 ? inputText.IndexOf(" ", UrlIndex) : inputText.Length;
                    string UrlWord = inputText.Substring(UrlIndex, UrlEndIndex - UrlIndex);
                    inputText = inputText.Replace(UrlWord, "<a target='_blank' href='" + UrlWord + "'>" + UrlWord.Replace("http://", "") + "</a>");
                }
                catch (Exception)
                { }

            }
            return inputText;
        }

        /// <summary>
        /// STRING TEMIZLE (REG EXP)
        /// </summary>
        /// <param name="input">Temizlenecek De�i�ken</param>
        /// <returns></returns>
        public static string ClearString(string input)
        {
            System.Text.RegularExpressions.Regex regEx = new System.Text.RegularExpressions.Regex("[^0-9a-zA-Z_i�����������@\\-,.:]");
            return regEx.Replace(input, "");
        }

        /// <summary>
        /// String temizleme fonksiyonuna ihtiya� duyulmu� mu ?
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static bool isNeedClearString(string input) {
            return (input != ClearString(input));
        }

        /// <summary>
        /// Querystring var m� ve d�zg�n m�?
        /// </summary>
        /// <param name="input">Temizlenecek De�i�ken</param>
        /// <returns></returns>
        public static bool IsString(object input)
        {
            string m_input = String.Empty;

            if (input == null) { return false; }
            try
            {
                m_input = ClearString(input.ToString());
                if (m_input == string.Empty) { return false; }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// String deki t�m html taglar�n� temizler
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string ClearHtmlTags(string input) {
            return System.Text.RegularExpressions.Regex.Replace(input, "(<[^>]+>)", "");
        }

        /// <summary>
        /// String in db ye kay�t i�in d�zenlenmesi
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string ReplaceStrForDB(string input)
        {
            return ClearHtmlTags(input).Replace("'", "");
        }

        /// <summary>
        /// String in db ye kay�t i�in d�zenlenmesi
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string r(string input)
        {
            return ClearHtmlTags(input).Replace("'", "&#39;").Replace("\"", "").Replace("~", "").Replace("|", "");
        }

        /// <summary>
        /// De�i�ken Numeric ise true, de�ilse false
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static bool IsNumeric(object input) {

            if (input == null) {
                return false;
            }

            if (input.ToString() == string.Empty) {
                return false;
            }

            foreach (char c in input.ToString()) {
                if (!char.IsNumber(c))
                    return false;
            }
            return true;
        }

        /// <summary>
        /// De�i�ken Date ise true, de�ilse false
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static bool IsDate(object input)
        {
            try
            {
                Convert.ToDateTime(input);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        /// <summary>
        /// Rasgele Say� �retir
        /// </summary>
        /// <param name="CharLength">Rasgele Say� Ka� Karakterli Olsun</param>
        /// <returns></returns>
        public static string CreateRandomNumber(int CharLength) {
            //Random rnd = new Random(DateTime.Now.Year * DateTime.Now.Month * DateTime.Now.Day * DateTime.Now.Millisecond);
            Random rnd = GetRandom(0);
            string RndNumber = string.Empty;
            lock (rnd)
            {                
                for (int i = 1; i <= CharLength; i++)
                {
                    RndNumber += rnd.Next(0, 9).ToString();
                }
            }
            return RndNumber;
        }

        public static Random GetRandom(int seed)
        {
            Random r = (Random)System.Web.HttpContext.Current.Cache.Get("RandomNumber");
            if (r == null)
            {
                if (seed == 0)
                    r = new Random();
                else r = new Random(seed);
                System.Web.HttpContext.Current.Cache.Insert("RandomNumber", r);
            }
            return r;
        }

        ///<summary>
        /// String b
        /// </summary>
        public static string PurifyStrFromTRChars(string Text)
        {
            return Text.Replace("�", "&#351;").Replace("�", "&#350;").Replace("�", "&#305;").Replace("�", "&#304;").Replace("�", "&ouml;").Replace("�", "&Ouml;").Replace("�", "&ccedil;").Replace("�", "&Ccedil;").Replace("�", "&#287;").Replace("�", "&#286;").Replace("�", "&uuml;").Replace("�", "&Uuml;").Replace("�", "&rsquo;");
        }

        ///<summary>
        /// T�rnak i�areti gibi istenmeyenler karakter kodu olarak decode etmek
        /// </summary>
        public static string CodeRplc(string Text)
        {
            return Text.Replace("'", "&#39;");
        }

        ///<summary>
        /// T�rnak i�areti gibi istenmeyen karakterleri encode etmek
        /// </summary>
        public static string DecodeRplc(string Text)
        {
            return Text.Replace("&#39;", "'");
        }

        ///<summary>
        /// T�rk�e karakterleri �ngilizce karakterlere �evirir
        /// </summary>
        public static string TrToEng(string Text) {
            return Text.Replace('�', 'i').Replace('�', 's').Replace('�', 'g').Replace('�', 'u').Replace('�', 'c').Replace('�', 'o')
                .Replace('�', 'I').Replace('�', 'S').Replace('�', 'G').Replace('�', 'U').Replace('�', 'C').Replace('�', 'O').Trim();
        }

        ///<summary>
        /// 10.12.2009 15:45 >> 101220091545        
        /// </summary>
        public static string DateStr(){
            StringBuilder strText = new StringBuilder("");
            strText.Append(DateTime.Now.Day.ToString().PadLeft(2, '0'));
            strText.Append(DateTime.Now.Month.ToString().PadLeft(2, '0'));
            strText.Append(DateTime.Now.Year.ToString());
            strText.Append(DateTime.Now.Minute.ToString().PadLeft(2, '0'));
            strText.Append(DateTime.Now.Second.ToString().PadLeft(2, '0'));
            return strText.ToString();
        }

        /// <summary>
        /// Noktadan sonraki uzant�y� almak
        /// </summary>
        /// <param name="Text"></param>
        /// <returns></returns>
        public static string GetExtension(string Text) {
            return Text.Substring(Text.LastIndexOf('.'));
        }

        public static float ByteToMB(float Byte) {
            try { return (Byte / 1048576); }
            catch (Exception) { return Byte; }
        }

        /// <summary>
        /// Sql Server a g�nderebilmek i�in tarihi formatlar
        /// 19.07.2009 > 2009-07-19
        /// </summary>
        /// <param name="inDate"></param>
        /// <returns></returns>
        public static string DateForSql(DateTime inDate) {
            return inDate.Year.ToString() + "-" + inDate.Month.ToString().PadLeft(2, '0') + "-" + inDate.Day.ToString().PadLeft(2, '0');
        }

        public static int Age(DateTime BirthDate) {
            return DateTime.Now.Year - BirthDate.Year;
        }

        public static string MonthName(int MonthNumber) {
            switch (MonthNumber)
            {
                case 1:
                    return "Ocak";
                case 2:
                    return "�ubat";
                case 3:
                    return "Mart";
                case 4:
                    return "Nisan";
                case 5:
                    return "May�s";
                case 6:
                    return "Haziran";
                case 7:
                    return "Temmuz";
                case 8:
                    return "A�ustos";
                case 9:
                    return "Eyl�l";
                case 10:
                    return "Ekim";
                case 11:
                    return "Kas�m";
                case 12:
                    return "Aral�k";
            }
            return "";
        }

        //Facebook Uid yoksa 0 lama
        public static long fbUID(object UID)
        {
            if ((UID == null) || (UID.ToString() == ""))
                return 0;
            return long.Parse(UID.ToString());
        }

        //Facebook sex isfemale atama
        public static string fbIsFemale(string Sex)
        {
            if (Sex == "") return "";
            return (Sex == "erkek") ? "false" : "true";
        }

        public static string DblClickBlock(System.Web.UI.Page Page, System.Web.UI.Control C)
        {
            return "if (typeof(Page_ClientValidate) == 'function') { if (Page_ClientValidate() == false) { return false; }} " +
                "this.disabled = true; " +
                Page.GetPostBackEventReference(C) +
                ";";
        }

        public static void ClearForm(Control ParentControl)
        {
            foreach (Control ctrl in ParentControl.Controls)
            {
                TextBox tb = ctrl as TextBox;
                if (tb != null) tb.Text = "";
                else
                {
                    DropDownList ddl = ctrl as DropDownList;
                    if (ddl != null) ddl.SelectedValue = "0";
                    else
                    {
                        RadioButton rd = ctrl as RadioButton;
                        if (rd != null) rd.Checked = false;
                        else
                        {
                            CheckBox ch = ctrl as CheckBox;
                            if (ch != null) ch.Checked = false;
                            else {
                                Panel pnl = ctrl as Panel;
                                if (pnl != null) ClearForm(pnl);
                            }
                        }
                    }
                }
            }
        }
    }
}