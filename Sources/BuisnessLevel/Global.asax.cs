using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
using System.Drawing;
using System.Globalization;

namespace BL
{
    public class Global : System.Web.HttpApplication
    {
        public static List<Tuple<int, List<PointF>>> polList = new List<Tuple<int, List<PointF>>>();
        public static Dictionary<int, string> dataDict = new Dictionary<int, string>();

        protected void Application_Start(object sender, EventArgs e)
        {
            string[] sep2 = new string[] { "],[" };


            string line;
            FileStream file = new FileStream(Server.MapPath("~\\Data.txt"), FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(file);
            while ((line = sr.ReadLine()) != null)
            {
                string[] lines2 = line.Split('\t');

                int num = Convert.ToInt32(lines2.First());
                string[] lines3 = lines2.Last().Split(sep2, StringSplitOptions.RemoveEmptyEntries);

                List<PointF> pointList = new List<PointF>();

                foreach (string str2 in lines3)
                {
                    string[] lines4 = str2.Split(',');

                    float X = Convert.ToSingle(lines4.First().Replace("[", string.Empty), CultureInfo.InvariantCulture.NumberFormat);
                    float Y = Convert.ToSingle(lines4.Last().Replace("]", string.Empty), CultureInfo.InvariantCulture.NumberFormat);

                    pointList.Add(new PointF(X, Y));
                }

                polList.Add(new Tuple<int, List<PointF>>(num, pointList));            
            }

            file.Close();


            file = new FileStream(Server.MapPath("~\\Data1.txt"), FileMode.Open, FileAccess.Read);
            sr = new StreamReader(file);
            while ((line = sr.ReadLine()) != null)
            {
                string[] lines2 = line.Split('\t');

                int num = Convert.ToInt32(lines2.First());

                dataDict.Add(num, lines2.Last());
            }

            file.Close();


        }


        protected void Session_Start(object sender, EventArgs e)
        {
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpRequest rq = this.Request;
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}