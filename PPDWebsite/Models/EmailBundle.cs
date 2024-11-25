using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PPDWebsite.Models
{
    public class EmailBundle
    {
        public string recipient { get; set; }
        public string subject { get; set; }
        public string body { get; set; }
    }
}