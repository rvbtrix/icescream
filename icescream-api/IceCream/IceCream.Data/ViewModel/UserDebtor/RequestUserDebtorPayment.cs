using System;

public partial class RequestUserDebtorPayment
{
    public int IdUserDebtor { get; set; }
    public int IdUser { get; set; }
    public DateTime PaymentDate { get; set; }
    public string PaymentImageUrl { get; set; }
}