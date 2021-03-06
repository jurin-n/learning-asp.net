﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class Item
    {
        public Item(int No, String Id, String name, String Description, String Type, bool isValid) {
            this.No = No;
            this.Id = Id;
            this.Name = name;
            this.Description = Description;
            this.Type = Type;
            this.isValid = isValid;
        }

        public int No { get; set; }
        public String Id { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public String Type { get; set; }
        public bool isValid { get; set; }
    }
}