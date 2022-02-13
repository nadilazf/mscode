using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.DirectoryServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Transforman.controller;

namespace Transforman
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["NoPek"] = "";
            Session["TypeUser"] = "3";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string dominName    = string.Empty;
            string adPath       = string.Empty;
            string userName     = txtPass.Text.Trim().ToUpper();
            string strError     = string.Empty;

            try

            {

                foreach (string key in ConfigurationSettings.AppSettings.Keys)

                {

                    dominName =  ConfigurationSettings.AppSettings["DirectoryDomain"] ;

                    adPath = ConfigurationSettings.AppSettings["DirectoryPath"] ;

                    if (!String.IsNullOrEmpty(dominName) && !String.IsNullOrEmpty(adPath))
                    {
                        if (true == AuthenticateUser(dominName, userName, txtPass.Text, adPath, out strError))
                        {
                            DataUser();
                           // Response.Redirect("default.aspx");// Authenticated user redirects to default.aspx
                        }

                        dominName = string.Empty;
                        adPath = string.Empty;
                        if (String.IsNullOrEmpty(strError)) break;

                    }



                }

                if (!string.IsNullOrEmpty(strError))
                {
                    MessegeBox.Show ("Invalid user name or Password!");
                }
            }

            catch{

            }finally{
                
            }


          

        }


        public void DataUser() {

            DataTable dtLogin = GetDataList.GetDataLoginByparam(txtUserName.Text,txtPass.Text);
            if (dtLogin.Rows.Count > 0)
            {

                Session["UserName"] = dtLogin.Rows[0]["Nama"];
                Session["TypeUser"] = dtLogin.Rows[0]["Type"].ToString();
                string type = dtLogin.Rows[0]["Type"].ToString();
                Session["NoPek"] = txtPass.Text;

                if (type == "4")
                    Response.Redirect("~/Web/Costumer/Pos1.aspx");
                else if (type == "5")
                    Response.Redirect("~/Web/Costumer/Pos9.5.aspx");
                else
                    Response.Redirect("~/Default.aspx");

            }
            else
            {
                DataTable dtUser = GetDataList.GetDataUserByparam(txtUserName.Text,txtPass.Text);
                if (dtUser.Rows.Count > 0)
                {

                    Session["UserName"] = dtUser.Rows[0]["Nama"];
                    Session["NoPek"] = dtUser.Rows[0]["No_Pek"];

                    if (int.Parse(dtUser.Rows[0]["Position"].ToString()) == 2)
                        Session["TypeUser"] = "2";

                    Response.Redirect("~/Default.aspx");

                }
                //else
                //{
                //    MessegeBox.Show("Silahkan Cek data user name dan password");
                //}



            }


        }

        public bool AuthenticateUser(string domain, string username, string password, string LdapPath, out string Errmsg)

        {

            Errmsg = "";

            string domainAndUsername = domain + @"\" + username;
            DirectoryEntry entry = new DirectoryEntry(LdapPath, domainAndUsername, password);
            try

            {
                // Bind to the native AdsObject to force authentication.
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();
                if (null == result)

                {
                    return false;
                }

                // Update the new path to the user in the directory
                LdapPath = result.Path;
                string _filterAttribute = (String)result.Properties["cn"][0];
            }

            catch (Exception ex)

            {

                Errmsg = ex.Message;

                return false;

                throw new Exception("Error authenticating user." + ex.Message);

            }

            return true;

        }
    }
}