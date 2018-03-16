using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace LIB {
    public class XMLHelper
    {
        public static string BuildXmlString(string xmlRootName, string xmlNodeName, string[] values)
        {
            StringBuilder xmlString = new StringBuilder();
            xmlString.AppendFormat("<{0}>", xmlRootName);
            for (int i = 0; i < values.Length; i++)
            {
                xmlString.AppendFormat("<{1}>{0}</{1}>", values[i], xmlNodeName);
            }
            xmlString.AppendFormat("</{0}>", xmlRootName);
            return xmlString.ToString();
        }

        public static string BuildXmlString(string xmlRootName, string xmlNodeName, ArrayList arrValues)
        {
            string[] strValues = new string[arrValues.Count];
            arrValues.CopyTo(strValues);
            return BuildXmlString(xmlRootName, xmlNodeName, strValues);
        }
    }
}
