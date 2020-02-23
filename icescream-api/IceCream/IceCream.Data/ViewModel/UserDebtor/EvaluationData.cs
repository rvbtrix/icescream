using IceCream.Data.Models;
using System;
using System.Collections.Generic;

public partial class EvaluationData
{
    public string UserName { get; set; }
    public DateTime DebitDate { get; set; }
    public DateTime PaymentDate { get; set; }
    public string Reason { get; set; }
    public decimal Evaluation { get; set; }
}