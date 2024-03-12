using DentalClinicProject.Models;

namespace DentalClinicProject.DTO
{
    public class InvoiceDTO
    {
        public int InvoiceId { get; set; }
        public int? CustomerId { get; set; }
        public string? CustomerName { get; set; }
        public int? StaffId { get; set; }
        public string? StaffName { get; set; }
        public DateTime? Date { get; set; }
        public double? Discount { get; set; }
        public int? Status { get; set; }
        public string? Comment { get; set; }
        public int? PaymentId { get; set; }
        public string? PaymentType { get; set; }
        public bool? DeleteFlag { get; set; }
    }

    public partial class InvoiceLineDTO
    {
        public int LineId { get; set; }
        public int? InvoiceId { get; set; }
        public int? ServiceId { get; set; }
        public string? ServiceName { get; set; }
        public int? MaterialId { get; set; }
        public string? MaterialName { get; set; }
        public int? Quantity { get; set; }
        public string? Comment { get; set; }
        public bool? DeleteFlag { get; set; }

    }

    public partial class PaymentDTO
    {
        public int PaymentId { get; set; }
        public string? PaymentName { get; set; }
    }
}
