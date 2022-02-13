using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace CIFOR.App.Roster.controller
{
    public class clsLog
    {
        private StreamWriter fLog = null;

        public clsLog(string strFileName)
        {
            this.fLog = File.AppendText(strFileName);
            /*
            this.subAddTextLine("");
            this.subAddTextLine("*** START LOG ********************************************************");
			this.subAddTextLine("LOG DATE: "+System.DateTime.Now.ToString());
             * */
        }

        public void subCloseLog()
        {
            this.subAddTextLine("============= END =============");
            this.subAddTextLine("");
            this.fLog.Close();
            this.fLog = null;
        }

        public void subAddText(string strText)
        {
            this.fLog.Write(strText);
            this.fLog.Flush();
        }

        public void subAddTextLine(string strText)
        {
            List<string> listlog = new List<string>();
            listlog.AddRange(strText.Split('|'));
            foreach(string s in listlog)
                this.fLog.WriteLine(s);
            this.fLog.Flush();
        }
    }
}
