using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            string XMLDocPath = (args[0]);

            XmlDocument doc = new XmlDocument();
            doc.Load(XMLDocPath);

            foreach (XmlNode node in doc.DocumentElement.ChildNodes)
            {
                //string text = node.InnerText; //or loop through its children as well

                string attr = node.Attributes["trkpt"]?.InnerText;

                string text = node.InnerXml;

                //System.Console.WriteLine(attr);
                System.Console.WriteLine(text);
            }
        }
    }
}
