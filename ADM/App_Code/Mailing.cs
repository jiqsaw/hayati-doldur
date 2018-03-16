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

public class Mailing
{
    private LIB.Mailing objMail;

    private string _MailTemplateFile = String.Empty;
    private string _MailTamplate = String.Empty;

    private string _Subject = String.Empty;
    private string _Title = String.Empty;
    private StringBuilder _Content = new StringBuilder();

    public Mailing()
    {
        objMail = new LIB.Mailing();

        StreamReader sr = new StreamReader(this._MailTemplateFile, Encoding.GetEncoding("iso-8859-9"));
        this._MailTamplate = sr.ReadToEnd();
        sr.Close();
    }

    public bool SendPassword(string To, string Password) {
        this._Subject = "Hayatidoldur.com ÞÝFRE HATIRLATMA";
        this._Title = "ÞÝFRE HATIRLATMA";
        this._Content.Append("Sitemiz üzerinden bu email adresi ile kayýtlý üyeliðinize ait þifre hatýrlatma talebinde bulundunuz.");
        this._Content.Append("<br><br>CF Nickiniz ve aþaðýdaki þifreniz ile sitemize login olabilirsiniz.<br><br>");
        this._Content.Append("Þifreniz: <b>");
        this._Content.Append(Password);
        this._Content.Append("</b>");
        return Send(To);
    }

    public bool SendContactForm(string To, string Isim, string CfNick, string Email, string Konu, string Mesaj)
    {
        this._Subject = "Hayatidoldur.com Ýletiþim Formu";
        this._Title = "ÝLETÝÞÝM FORMU";
        this._Content.Append("<b>Ýsim:</b> ");
        this._Content.Append(Isim);
        this._Content.Append("<b>Cf Nickname:</b> ");
        this._Content.Append(CfNick);
        this._Content.Append("<b>Email:</b> ");
        this._Content.Append(Email);
        this._Content.Append("<b>Konu:</b> ");
        this._Content.Append(Konu);
        this._Content.Append("<b>Mesaj:</b> ");
        this._Content.Append(LIB.Util.Nl2Br(Mesaj));
        return Send(To);
    }

    public bool SendSiparis(string To, string Isim, string Nick, string Tel, string Mail, string Urunler, string OdemeTipi, string Aciklama)
    {
        this._Subject = "Hayatidoldur.com SÝPARÝÞ";
        this._Title = "SÝPARÝÞ";
        this._Content.Append("Ýsim: ");
        this._Content.Append(Isim);
        this._Content.Append("<br>Ýrtibat Nick: ");
        this._Content.Append(Nick);
        this._Content.Append("<br>Tel: ");
        this._Content.Append(Tel);
        this._Content.Append("<br>Mail: ");
        this._Content.Append(Mail);
        this._Content.Append("<br>Ürünler: ");
        this._Content.Append(Urunler);
        this._Content.Append("<br>Ödeme Tipi: ");
        this._Content.Append(OdemeTipi);
        this._Content.Append("<br>Açýklama: ");
        this._Content.Append(Aciklama);
        return Send(To);
    }

    public bool Send(string To) {
        this._MailTamplate = this._MailTamplate.Replace("||TITLE||", this._Title).Replace("||CONTENT||", this._Content.ToString());
        return objMail.Send(To, this._Subject, this._MailTamplate, String.Empty, String.Empty, System.Net.Mail.MailPriority.Normal, true);
    }
}