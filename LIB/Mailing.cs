using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

namespace LIB {
    public class Mailing {
        private string m_MailServer;
        private string m_MailDisplayName;
        private string m_MailUser;
        private string m_MailPass;

        public Mailing () {
            this.m_MailServer = (ConfigurationManager.AppSettings["MailServer"] == null) ? String.Empty : ConfigurationManager.AppSettings["MailServer"].ToString();
            this.m_MailDisplayName = (ConfigurationManager.AppSettings["MailDisplayName"] == null) ? String.Empty : ConfigurationManager.AppSettings["MailDisplayName"].ToString();
            this.m_MailUser = (ConfigurationManager.AppSettings["MailUser"] == null) ? String.Empty : ConfigurationManager.AppSettings["MailUser"].ToString();
            this.m_MailPass = (ConfigurationManager.AppSettings["MailPass"] == null) ? String.Empty : ConfigurationManager.AppSettings["MailPass"].ToString();            
        }

        public Mailing (string MailServer) {
            m_MailServer = MailServer;
        }

        public bool Send(string To, string Subject, string Body, string Bcc, string CC, MailPriority Priority, bool IsGmail)
        {
            return Send(this.m_MailUser, this.m_MailDisplayName, To, Subject, Body, Bcc, CC, Priority, this.m_MailUser, this.m_MailPass, IsGmail);
        }

        public bool Send(string From, string DisplayName, string To, string Subject, string Body, string Bcc, string CC, MailPriority Priority, bool IsGmail)
        {
            return Send(From, DisplayName, To, Subject, Body, Bcc, CC, Priority, this.m_MailUser, this.m_MailPass, IsGmail);
        }

        public bool Send (string From, string DisplayName, string To, string Subject, string Body, string Bcc, string CC, MailPriority Priority, string UserName, string Password, bool IsGmail) {
            try {
                MailMessage Msg = new MailMessage();
                SmtpClient smtp;

                if (!IsGmail)
                    smtp = new SmtpClient();
                else
                {
                    smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;
                }

                MailAddress Address = new MailAddress(From, DisplayName);

                if ((UserName != String.Empty) && (Password != String.Empty)) {
                    smtp.Credentials = new System.Net.NetworkCredential(UserName, Password);
                }

                Msg.From = Address;
                Address = new MailAddress(To);

                Msg.To.Add(Address);
                Msg.Subject = Subject;
                Msg.Body = Body;
                Msg.BodyEncoding = System.Text.Encoding.UTF8;

                if (CC != "") { Msg.CC.Add(CC); }
                if (Bcc != "") { Msg.Bcc.Add(Bcc); }

                Msg.Priority = Priority;
                Msg.IsBodyHtml = true;

                smtp.Host = this.m_MailServer;

                smtp.Send(Msg);
                return true;
            }
            catch (Exception) {
                return false;
            }
        }
    }
}