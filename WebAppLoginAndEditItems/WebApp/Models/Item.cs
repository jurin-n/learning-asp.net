using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class Item
    {
        public Item(int No, String Id, String name, String Description, String Type) {
            this.No = No;
            this.Id = Id;
            this.Name = name;
            this.Description = Description;
            this.Type = Type;
        }

        public int No { get; set; }
        public String Id { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public String Type { get; set; }
    }
}