using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Quartz;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Configuration;

namespace Transforman.controller
{
    public class Jobclass : IJob
    {

        public void Execute(IJobExecutionContext context)
        {



            DataTable dt = GetDataList.GetDataEmail();
            string IdOrder;
            string EmailName ="", AliasFrom="", EmailFrom="", AliasTo="", EmailTo="",employeeName= "", Opening="", Tujuan="", TglKeberangkatan="",Jam ="", JumlahPenumpang = "", LinkUrl="" ,NamaUser = "", OrderNumber ="";
            string emailTemplate = ConfigurationManager.AppSettings["EmailRegistration"];
            string mobil = "",sopir="";
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                IdOrder = dt.Rows[i]["IdOrder"].ToString();
                EmailName = dt.Rows[i]["EmailName"].ToString();
                AliasFrom = dt.Rows[i]["AliasFrom"].ToString();
                EmailFrom = dt.Rows[i]["EmailFrom"].ToString();
                AliasTo = dt.Rows[i]["AliasTo"].ToString();
                EmailTo = dt.Rows[i]["EmailTo"].ToString();
                OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
                employeeName = dt.Rows[i]["EmployeeName"].ToString();
                Opening = dt.Rows[i]["Opening"].ToString();
                TglKeberangkatan = dt.Rows[i]["TglKeberangkatan"].ToString();
                Jam = dt.Rows[i]["Jam"].ToString();
                Tujuan = dt.Rows[i]["Tujuan"].ToString();
                JumlahPenumpang = dt.Rows[i]["JumlahPenumpang"].ToString();
                LinkUrl = dt.Rows[i]["LinkUrl"].ToString();
                mobil = dt.Rows[i]["Mobil"].ToString();
                sopir = dt.Rows[i]["Sopir"].ToString();




                SentEmail.EmailSendingScheduler(Guid.Parse(IdOrder), EmailName, AliasFrom, EmailFrom, AliasTo, EmailTo,OrderNumber ,employeeName, Opening, Tujuan, TglKeberangkatan,Jam, JumlahPenumpang, LinkUrl, emailTemplate,mobil, sopir);

                string  EmailId = dt.Rows[i]["idEmail"].ToString();
                ExecuteData.updateEmailStatus(Guid.Parse(EmailId));





            }




        }
    }
}
