using DentalClinicProject.DTO;

namespace DentalClinicProject.Services.Interface
{
    public interface IInvoiceService
    {
        object GetInvoices(int pageNumber, int type);
        object GetInvoicesByUser(int pageNumber, int PatientId);
        object GetInvoicesByKeyword(int pageNumber, string keyword);
        object GetInvoicesById(int Id, int type);
        void AddInvoice(InvoiceDTO o);
        void AddImportInvoice(InvoiceImportDTO o);
        void UpdateInvoice(int id, InvoiceDTO invoiceDTO);
        void UpdateImportInvoice(int id, InvoiceImportDTO invoiceDTO);
        void DeleteInvoice(int id);
        object GetInvoiceLines(int pageNumber);
        void AddInvoiceLine(InvoiceLineDTO o);
        void AddInvoiceLine(InvoiceLineImportDTO o);
        void UpdateInvoiceLine(int id, InvoiceLineDTO InvoiceLineDTO);
        void UpdateImportInvoiceLine(int id, InvoiceLineImportDTO InvoiceLineDTO);
        void DeleteInvoiceLine(int id);
        object GetPayments(int pageNumber);
        void AddPayment(PaymentDTO o);
        void UpdatePayment(int id, PaymentDTO PaymentDTO);
        void DeletePayment(int id);
    }
}
