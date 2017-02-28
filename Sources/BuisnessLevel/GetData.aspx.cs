using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Collections.Specialized;
using System.Globalization;

namespace BL
{
    public partial class GetData : System.Web.UI.Page
    {
        
        protected void Page_PreInit(object sender, EventArgs e)
        {
            HttpRequest rq = this.Request;

            NameValueCollection par = rq.QueryString;
            string ret = Processing(par);

            Response.Write(ret);
            Response.End();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
        }


        private string Processing(NameValueCollection par)
        {
            string[] allKeys = par.AllKeys;

            float a = default(float), l = default(float);

            if (allKeys.Contains("a"))
            {
                a = Convert.ToSingle(par["a"], CultureInfo.InvariantCulture.NumberFormat);
            }

            if (allKeys.Contains("l"))
            {
                l = Convert.ToSingle(par["l"], CultureInfo.InvariantCulture.NumberFormat);
            }

            PointF p = new PointF(a, l);


            int? num = null;
            foreach (Tuple<int, List<PointF>> pl in Global.polList)
            {
                if (IsPointInPolygon4(pl.Item2, p))
                {
                    num = pl.Item1;
                }
            }

            string ret = "alert('не найдено');";

            if (num.HasValue)
            {
                string rez = null;
                Global.dataDict.TryGetValue(num.Value, out rez);

                if (!string.IsNullOrEmpty(rez))
                {
                    ret = rez;
                }
            }

            
            return ret;
        }
        


        public static bool IsPointInPolygon4(IList<PointF> polygon, PointF testPoint)
        {
            bool result = false;

            int j = polygon.Count() - 1;
            for (int i = 0; i < polygon.Count(); i++)
            {
                if (polygon[i].Y < testPoint.Y && polygon[j].Y >= testPoint.Y || polygon[j].Y < testPoint.Y && polygon[i].Y >= testPoint.Y)
                {
                    if (polygon[i].X + (testPoint.Y - polygon[i].Y) / (polygon[j].Y - polygon[i].Y) * (polygon[j].X - polygon[i].X) < testPoint.X)
                    {
                        result = !result;
                    }
                }
                j = i;
            }

            return result;
        }
    }
}