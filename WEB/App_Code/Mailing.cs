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
using System.IO;
using System.Net.Mail;
using LIB;

public class Mailing
{
    private LIB.Mailing objMail;
    private string appURL =  LIB.Util.ApplicationRootPath();
    private string _MailTemplateFile = "MailTemplates/Default.html";
    private string _MailTemplate = String.Empty;
    private string _MailMain = ConfigurationManager.AppSettings["MailMain"].ToString();

    private string _Subject = String.Empty;
    private string _Title = String.Empty;
    private StringBuilder _Content = new StringBuilder();

    public Mailing()
    {
        objMail = new LIB.Mailing();

        try
        {
            StreamReader sr = new StreamReader(HttpContext.Current.Request.MapPath(this._MailTemplateFile), Encoding.GetEncoding("iso-8859-9"));
            this._MailTemplate = sr.ReadToEnd();
            sr.Close();
        }
        catch (Exception)
        {
            this._MailTemplate = "||TITLE|| <br><br> ||CONTENT||";
        }
    }

    public bool SendPassword(string To, string Password) {
        this._Subject = "Hayatidoldur.com Þifre Hatýrlatma";
        this._Title = "ÞÝFRE HATIRLATMA";
        this._Content.Append("Hayata Doldur’a giriþ yapmanýz için gerekli þifreniz aþaðýda belirtilmiþtir");
        this._Content.Append("<br><br>");
        this._Content.Append("Þifreniz: <b>");
        this._Content.Append(Password);
        this._Content.Append("</b>");
        return Send(To);
    }    

    public bool SendCommentNotify(string To, string Isim, string ActivityTitle, string ActivityUrl)
    {
        this._Subject = "Hayatidoldur.com Yorumunuza cevap verildi";
        this._Title = "";
        this._Content.Append("Yorum yaptýðýnýz ");
        this._Content.Append(ActivityTitle);
        this._Content.Append(" etkinliðine yeni yorum yapýldý. Yorumu görüntülemek için aþaðýdaki linke týklayýn.<br><br>");
        this._Content.Append(this.appURL + ActivityUrl);
        return Send(To);
    }

    public bool SendActivate(string To, string ActivationURL)
    {
        string URL = this.appURL + "UserActivation.aspx?AC=" + ActivationURL;
        this._Subject = "Hayatidoldur.com Üyelik aktivasyonu";
        this._Title = "ÜYELÝK AKTÝVASYONU";
        this._Content.Append("Üye giriþi yapabilmeniz için lütfen aþaðýdaki linke týklayýn, aktivasyon sürecini tamamlayýn.");
        this._Content.Append("<br /><br />");
        this._Content.Append("<a href=\"");
        this._Content.Append(URL);
        this._Content.Append("\" >");
        this._Content.Append(URL);
        this._Content.Append("</a>");
        return Send(To);
    }

    public bool SendFriend(string Name, string Email, string NameFriend, string EmailFriend, string ActivityTitle, string URL)
    {
        this._Subject = "Hayatý Doldur’a sen de katýl!";

        this._Title = "Merhaba, " + NameFriend;

        this._Content.Append("Arkadaþýn ");
        this._Content.Append(Name);
        this._Content.Append(" , akýllý bir etkinlik rehberi olan Hayatý Doldur’a seni davet ediyor. Hayatý Doldur’a üye ol, kiþilik özelliklerine göre istediðin etkinlikten haber al, avantajlarýndan faydalan.<br><br>");
        this._Content.Append("<a href='");
        this._Content.Append(URL);
        this._Content.Append("'>");
        this._Content.Append(ActivityTitle);
        this._Content.Append("</a>");

        this._MailTemplate = this._MailTemplate.Replace("||TITLE||", this._Title).Replace("||CONTENT||", this._Content.ToString());

        return objMail.Send(Email, Name, EmailFriend, this._Title, this._MailTemplate, "", "", MailPriority.Normal, false);
    }

    public bool SendContact(string Name, string Email, string University, string Subject, string Message)
    {
        this._Subject = "Hayatidoldur.com Ýletiþim Formu";

        this._Content.Append("<br><br>Ýsim: ");
        this._Content.Append(Util.r(Name));
        this._Content.Append("<br><br>E-posta: ");
        this._Content.Append(Util.r(Email));
        this._Content.Append("<br><br>Üniversite: ");
        this._Content.Append(Util.r(University));
        this._Content.Append("<br><br>Konu: ");
        this._Content.Append(Util.r(Subject));
        this._Content.Append("<br><br>Mesaj: ");
        this._Content.Append(LIB.Util.Nl2Br(Message));

        this._MailTemplate = this._Content.ToString();

        string To = ConfigurationManager.AppSettings["MailContactTo"].ToString();
        string Cc = ConfigurationManager.AppSettings["MailContactCc"].ToString();
        string Bcc = ConfigurationManager.AppSettings["MailContactBcc"].ToString();

        return objMail.Send(Email, Name, To, this._Subject, this._MailTemplate, Bcc, Cc, MailPriority.Normal, false);
    }
    
    public bool Send(string To) {
        this._MailTemplate = this._MailTemplate.Replace("||TITLE||", this._Title).Replace("||CONTENT||", this._Content.ToString());
        return objMail.Send(To, this._Subject, this._MailTemplate, String.Empty, String.Empty, MailPriority.Normal, false);
    }
}