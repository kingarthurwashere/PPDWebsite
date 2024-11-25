using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PPDWebsite.Models
{
    public class SystemUserModel
    {
        public int ID { get; set; }
        public int UserType { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool Active { get; set; }
        public bool Locked { get; set; }
    }
}