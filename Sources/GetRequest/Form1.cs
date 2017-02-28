using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GetRequest
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            BI.hlpHttp.SinglInstance.Method = "GET";
            string data = BI.hlpHttp.SinglInstance.SendPost(textBox1.Text, string.Empty);

            int pos1 = data.IndexOf("[[[") + 3;
            int pos2 = data.IndexOf("}}},[", pos1);

            data = data.Substring(pos1, pos2 - pos1);

            string[] objectsSeparators = new string[] { "]]]},\"name\":\"", "\"coordinates\":[[[" };
            string[] msgParts = data.Split(objectsSeparators, StringSplitOptions.None);

            string[] coordPairSeparators = new string[] { "],[" };
            string[] coordSeparators = new string[] { "," };
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < msgParts.Length ; i = i + 2)
            {
                sb.Append(msgParts[i+1].Substring(0,3));
                sb.Append("\t");

                string[] coordsPair = msgParts[i].Split(coordPairSeparators, StringSplitOptions.None);
                bool First = true;
                for (int j = coordsPair.Length -1; j >= 0; j--)
                //for (int j = 0; j < coordsPair.Length; j++)
                {
                    if (First)
                    {
                        First = false;
                    }
                    else
                    {
                        sb.Append(",");
                    }

                    string[] coords = coordsPair[j].Split(coordSeparators, StringSplitOptions.None);

                    sb.Append("[");
                    sb.Append(coords.Last());
                    sb.Append(",");
                    sb.Append(coords.First());
                    sb.Append("]");
                }

                sb.Append(Environment.NewLine);
            }

            data = sb.ToString();

            textBox2.Text = data;
        }
    }
}
