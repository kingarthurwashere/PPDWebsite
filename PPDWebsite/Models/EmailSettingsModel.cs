using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PPDWebsite.Models
{
    public class EmailSettingsModel
    {
        public int ID { get; set; }
        public string IncomingServer { get; set; }
        public string OutgoingServer { get; set; }
        public string UserName { get; set; }
        public string Sender { get; set; }
        public string Password { get; set; }
        public string CC { get; set; }
        public int OutgoingPort { get; set; }
        public int IncomingPort { get; set; }
        public bool UseSSL { get; set; }
    }
}