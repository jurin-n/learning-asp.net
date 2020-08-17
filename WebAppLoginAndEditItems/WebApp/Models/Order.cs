using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class Order
    {
        public Order(string orderId, string orderDescription, string bulkRegistration, bool isBulk)
        {
            OrderId = orderId;
            OrderDescription = orderDescription;
            BulkRegistration = bulkRegistration;
            this.isBulk = isBulk;
        }

        public string OrderId { get; set; }
        public string OrderDescription { get; set; }
        public string BulkRegistration { get; set; }

        public bool isBulk { get; set; }
    }
}