using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PPDWebsite.Models
{
    public class UserModel
    {
        public int id { get; set; }
        public string firstName { get; set; }
        public string surname { get; set; }
        public string email { get; set; }
        public DateTime dateOfRegistration { get; set; }
        public string source { get; set; }
    }
}