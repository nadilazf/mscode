using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.IO;
using System.Web.Hosting;
using System.Configuration;
using System.Net.Configuration;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using Transforman.Connection;
using System.Data;

namespace Transforman.controller
{
    public class SentEmail
    {


        public static void EmailSendingScheduler(Guid IdOrder, string EmailName, string AliasFrom, string EmailFrom, string AliasTo, string EmailTo, string OrderNumber, string employeeName, string Opening, string Tujuan, string TglKeberangkatan, string Jam, string JumlahPenumpang, string LinkUrl, string emailTemplate, string Mobil, string Sopir)
        {

            SentEmail.SendHtmlFormattedEmailConfirmation(IdOrder, EmailName, AliasFrom, EmailFrom, AliasTo, EmailTo, OrderNumber, employeeName, Opening, Tujuan, TglKeberangkatan, Jam, JumlahPenumpang, LinkUrl, emailTemplate, Mobil, Sopir);

        }



        public static void SendHtmlFormattedEmailConfirmation(Guid IdOrder, string EmailName, string AliasFrom, string EmailFrom, string AliasTo, string EmailTo, string OrderNumber, string employeeName, string Opening, string Tujuan, string TglKeberangkatan, string Jam, string JumlahPenumpang, string LinkUrl, string emailTemplate, string Mobil, string Sopir)
        {
            var config = ConfigurationManager.GetSection(ConfigurationSettings.AppSettings["smtpConfig"]) as SmtpSection;

            String host = null, port = null, userName = null, password = null;
            host = config.Network.Host;
            port = config.Network.Port.ToString();
            userName = config.Network.UserName;
            password = config.Network.Password;



            using (MailMessage mail = new MailMessage())
            {
                mail.Subject = EmailName;
                mail.From = new MailAddress(EmailFrom, AliasFrom, System.Text.Encoding.UTF8);




                string bodyemail = PopulateBodyReg(IdOrder,AliasTo,Opening,OrderNumber ,employeeName,Tujuan,TglKeberangkatan,Jam,JumlahPenumpang,LinkUrl,"", emailTemplate,Mobil,Sopir);

                mail.Body = bodyemail;

                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                mail.To.Add(EmailTo);


                SmtpClient smtp = new SmtpClient();
                smtp.Host = host;
                if (!String.IsNullOrEmpty(port)) smtp.Port = int.Parse(port);
                //trusted_connection = bool.Parse();

                // var config = ConfigurationManager.GetSection(ConfigurationSettings.AppSettings["smtpConfig"]) as SmtpSection;
                smtp.EnableSsl = config.Network.EnableSsl;
                smtp.EnableSsl = true;


                smtp.Credentials = new System.Net.NetworkCredential(@userName, password);

                ServicePointManager.ServerCertificateValidationCallback =
                    delegate (object s, X509Certificate certificate,
                    X509Chain chain, SslPolicyErrors sslPolicyErrors)
                    { return true; };
                smtp.Send(mail);
            }
        }


        private static string PopulateBodyReg(Guid IdOrder, string userNameTo, string opening, string OrderNumber, string employeeName, string Tujuan, string TglBerangkat, string Jam, string jml, string link,
          string url, string pathTemplate, string Mobil, string Sopir)
        {

            DataTable dt =GetDataList.GetDataPenumpangById(IdOrder);


            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HostingEnvironment.MapPath(@pathTemplate)))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{UserName}", userNameTo);
            body = body.Replace("{Opening}", opening);
            body = body.Replace("{NamaOrder}", OrderNumber);
            body = body.Replace("{employeeName}", employeeName);
            body = body.Replace("{Tujuan}", Tujuan);
            body = body.Replace("{TglBerangkat}", TglBerangkat);
            body = body.Replace("{Jam}", Jam);
            body = body.Replace("{JmlPenumpang}", jml);
            body = body.Replace("{Link}", link);
            body = body.Replace("{Url}", url);
            if (Mobil == "")
            {
                body = body.Replace("{mobil}", "");
                body = body.Replace("{mobilvalue}", "");
            }
            else {
                body = body.Replace("{mobil}", "Nama Mobil      :");
                body = body.Replace("{mobilvalue}", Mobil);

            }

            if (Sopir == "")
            {
                body = body.Replace("{sopir}", "");
                body = body.Replace("{sopirvalue}", "");
            }
            else
            {
                body = body.Replace("{sopir}", "Nama Sopir      :");
                body = body.Replace("{sopirvalue}", Sopir);

            }



            string textBody = " <table border="+1+" cellpadding="+0+" cellspacing="+0+" width = "+400+"><tr bgcolor='#4da6ff'><td><b>No Pek</b></td> <td> <b> Nama</b> </td> <td> <b> Pesawat</b> </td><td> <b> Rangka</b> </td></tr>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //body = body.Replace("{NoPek}", dt.Rows[i]["No_Pek"].ToString());
                //body = body.Replace("{Nama}", dt.Rows[i][""].ToString());
                //body = body.Replace("{Pesawat}", dt.Rows[i]["Pesawat"].ToString());

                textBody += "<tr><td>" + dt.Rows[i]["No_Pek"] + "</td><td> " + dt.Rows[i]["Nama_Penumpang"] + "</td> <td> " + dt.Rows[i]["Pesawat"] + "</td> <td> " + dt.Rows[i]["Keterangan"] + "</td> </tr>";


            }
            textBody += "</table>";
            body = body.Replace("{table}", textBody);


            return body;
        }



    }
}