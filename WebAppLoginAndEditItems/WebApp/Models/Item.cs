using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class Item
    {
        public Item(String ItemId) {
            this.ItemId = ItemId;
        }

        public String ItemId { get; set; }
    }
}