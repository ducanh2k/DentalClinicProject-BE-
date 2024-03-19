using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class InvoiceService : IInvoiceService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public InvoiceService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        public void AddImportInvoice(InvoiceImportDTO o)
        {
            try
            {
                var Invoice = new Invoice
                {
                    CustomerId = o.CustomerId,
                    Date = DateTime.Now,
                    Discount = o.Discount,
                    Status = 2,
                    Comment = o.Comment,
                    PaymentId = o.PaymentId,
                    DeleteFlag = false
                };
                _context.Invoices.Add(Invoice);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void AddInvoice(InvoiceDTO o)
        {
            try
            {
                var Invoice = new Invoice
                {
                    CustomerId = o.CustomerId,
                    StaffId = o.StaffId,
                    Date = DateTime.Now,
                    Discount = o.Discount,
                    Status = 1,
                    Comment = o.Comment,
                    PaymentId = o.PaymentId,
                    DeleteFlag = false
                };
                _context.Invoices.Add(Invoice);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void AddInvoiceLine(InvoiceLineDTO o)
        {
            try
            {
                var InvoiceLine = new InvoiceLine
                {
                    InvoiceId = o.InvoiceId,
                    ServiceId = o.ServiceId,
                    Comment = o.Comment,
                    DeleteFlag = false
                };
                _context.InvoiceLines.Add(InvoiceLine);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void AddInvoiceLine(InvoiceLineImportDTO o)
        {
            try
            {
                var InvoiceLine = new InvoiceLine
                {
                    InvoiceId = o.InvoiceId,
                    MaterialId = o.MaterialId,
                    Quantity = o.Quantity,
                    Comment = o.Comment,
                    DeleteFlag = false
                };
                _context.InvoiceLines.Add(InvoiceLine);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void DeleteInvoice(int id)
        {
            try
            {
                var Invoice = _context.Invoices.FirstOrDefault(o => o.InvoiceId == id);
                if (Invoice == null)
                {
                    throw new Exception("Hóa đơn không tồn tại");
                }
                Invoice.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void DeleteInvoiceLine(int id)
        {
            try
            {
                var InvoiceLine = _context.InvoiceLines.FirstOrDefault(o => o.LineId == id);
                if (InvoiceLine == null)
                {
                    throw new Exception("Hóa đơn không tồn tại");
                }
                InvoiceLine.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetInvoiceLines(int pageNumber)
        {
            try
            {
                List<InvoiceLine> InvoiceLines = _context.InvoiceLines
                .Include(o => o.Material)
                .Include(o => o.Service)
                .Where(x => x.DeleteFlag == false)
                .ToList();
                var totalInvoiceLines = InvoiceLines.Count();
                var totalPages = (int)Math.Ceiling((double)totalInvoiceLines / PageSize);
                var getPageNumber = pageNumber;
                if (pageNumber <= 0) getPageNumber += 1;
                if (pageNumber > totalPages) getPageNumber = totalPages;
                InvoiceLines = InvoiceLines
                    .Skip((getPageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                //map
                List<InvoiceLineDTO> results = new List<InvoiceLineDTO>();
                results = InvoiceLines.Select(_mapper.Map<InvoiceLine, InvoiceLineDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetInvoices(int pageNumber, int type)
        {
            try
            {
                List<Invoice> invoices = _context.Invoices.Include(o => o.Payment)
                    .Include(o => o.Customer)
                    .Include(o => o.Staff)

                    .ToList();
                if (type == 1)
                {
                    invoices = invoices.Where(x => x.DeleteFlag == false
                            && x.StaffId == null
                    ).ToList();
                }
                else if (type == 2)
                {
                    invoices = invoices.Where(x => x.DeleteFlag == false
                            && x.StaffId != null
                    ).ToList();
                }
                if (invoices == null || invoices.Count == 0)
                {
                    throw new Exception("Không có hóa đơn");
                }
                var totalInvoices = invoices.Count();

                var totalPages = (int)Math.Ceiling((double)totalInvoices / PageSize);
                var getPageNumber = pageNumber;
                if (pageNumber <= 0) getPageNumber += 1;
                if (pageNumber > totalPages) getPageNumber = totalPages;
                invoices = invoices.Skip((getPageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                //map
                List<InvoiceDTO> results = new List<InvoiceDTO>();
                results = invoices.Select(_mapper.Map<Invoice, InvoiceDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetInvoicesById(int Id, int type)
        {
            try
            {
                var invoices = _context.Invoices
                                .Include(o => o.Customer)
                                .Include(o => o.Staff)
                                .Include(o => o.Payment)
                                .Include(o => o.InvoiceLines)
                                    .ThenInclude(o => o.Material)
                                .Include(o => o.InvoiceLines)
                                    .ThenInclude(o => o.Service)
                                .Where(x => x.InvoiceId == Id && x.DeleteFlag == false)
                                .ToList();

                if (invoices == null || invoices.Count == 0)
                {
                    throw new Exception("Không có hóa đơn");
                }

                if (type == 1)
                {
                    var results = invoices.Select(invoice => new
                    {
                        invoice.InvoiceId,
                        invoice.CustomerId,
                        CustomerName = invoice.Customer != null ? invoice.Customer.Name : null,
                        invoice.Date,
                        invoice.Status,
                        invoice.Comment,
                        invoice.PaymentId,
                        PaymentType = invoice.Payment != null ? invoice.Payment.PaymentName : null,
                        InvoiceLines = invoice.InvoiceLines.Select(line => new
                        {
                            line.LineId,
                            line.MaterialId,
                            MaterialName = line.Material != null ? line.Material.MaterialName : null,
                            line.Quantity,
                            line.Comment
                        }).ToList()
                    }).ToList();
                    return results;
                }
                else if (type == 2)
                {
                    var results = invoices.Select(invoice => new
                    {
                        invoice.InvoiceId,
                        invoice.CustomerId,
                        CustomerName = invoice.Customer != null ? invoice.Customer.Name : null,
                        invoice.StaffId,
                        StaffName = invoice.Staff != null ? invoice.Staff.Name : null,
                        invoice.Date,
                        invoice.Discount,
                        invoice.Status,
                        invoice.Comment,
                        invoice.PaymentId,
                        PaymentType = invoice.Payment != null ? invoice.Payment.PaymentName : null,
                        InvoiceLines = invoice.InvoiceLines.Select(line => new
                        {
                            line.LineId,
                            line.ServiceId,
                            ServiceName = line.Service != null ? line.Service.ServiceName : null,
                            line.Quantity,
                            line.Comment
                        }).ToList()
                    }).ToList();
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            return 0;
        }

        public object GetInvoicesByKeyword(int pageNumber, string keyword)
        {
            try
            {
                List<Invoice> invoices = _context.Invoices.Include(o => o.Customer).Include(o => o.Staff).Include(o => o.Payment)
                    .Where(x =>
                        x.Staff.Name.Contains(keyword)
                        || x.Customer.Name.Contains(keyword)
                        || x.Comment.Contains(keyword)
                        && x.DeleteFlag == false)
                    .ToList();
                if (invoices == null || invoices.Count == 0)
                {
                    throw new Exception("Không có hóa đơn");
                }

                // pagination
                var totalInvoices = invoices.Count();

                var totalPages = (int)Math.Ceiling((double)totalInvoices / PageSize);
                var getPageNumber = pageNumber;
                if (pageNumber <= 0) getPageNumber += 1;
                if (pageNumber > totalPages) getPageNumber = totalPages;
                // take elements by pagesize
                invoices = invoices.Skip((getPageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();
                //map
                List<InvoiceDTO> results = new List<InvoiceDTO>();
                results = invoices.Select(_mapper.Map<Invoice, InvoiceDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetInvoicesByUser(int pageNumber, int PatientId)
        {
            try
            {
                List<Invoice> invoices = _context.Invoices.Include(o => o.Customer).Include(o => o.Staff).Include(o => o.Payment)
                    .Where(x => x.DeleteFlag == false && x.CustomerId == PatientId).ToList();
                if (invoices == null || invoices.Count == 0)
                {
                    throw new Exception("Không có hóa đơn");
                }
                var totalInvoices = invoices.Count();

                var totalPages = (int)Math.Ceiling((double)totalInvoices / PageSize);
                var getPageNumber = pageNumber;
                if (pageNumber <= 0) getPageNumber += 1;
                if (pageNumber > totalPages) getPageNumber = totalPages;
                invoices = invoices
                    .Skip((getPageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                //map
                List<InvoiceDTO> results = new List<InvoiceDTO>();
                results = invoices.Select(_mapper.Map<Invoice, InvoiceDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void UpdateImportInvoice(int id, InvoiceImportDTO invoiceDTO)
        {
            try
            {
                var Invoice = _context.Invoices.FirstOrDefault(o => o.InvoiceId == id);
                if (Invoice == null)
                {
                    throw new Exception("Không có hóa đơn");
                }
                Invoice.CustomerId = invoiceDTO.CustomerId;
                Invoice.Status = invoiceDTO.Status;
                Invoice.Discount = invoiceDTO.Discount;
                Invoice.Comment = invoiceDTO.Comment;
                Invoice.PaymentId = invoiceDTO.PaymentId;
                Invoice.DeleteFlag = invoiceDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void UpdateImportInvoiceLine(int id, InvoiceLineImportDTO InvoiceLineDTO)
        {
            try
            {
                var InvoiceLine = _context.InvoiceLines.FirstOrDefault(o => o.LineId == id);
                if (InvoiceLine == null)
                {
                    throw new Exception("Không có hóa đơn");
                }
              
                    InvoiceLine.MaterialId = InvoiceLineDTO.MaterialId;
                    InvoiceLine.Comment = InvoiceLineDTO.Comment;
                    InvoiceLine.Quantity = InvoiceLineDTO.Quantity;
                    InvoiceLine.DeleteFlag = InvoiceLineDTO.DeleteFlag;
                    _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void UpdateInvoice(int id, InvoiceDTO invoiceDTO)
        {
            try
            {
                var Invoice = _context.Invoices.FirstOrDefault(o => o.InvoiceId == id);
                if (Invoice == null)
                {
                    throw new Exception("Không có hóa đơn");
                }
                Invoice.CustomerId = invoiceDTO.CustomerId;
                Invoice.StaffId = invoiceDTO.StaffId;
                Invoice.Status = invoiceDTO.Status;
                Invoice.Discount = invoiceDTO.Discount;
                Invoice.Comment = invoiceDTO.Comment;
                Invoice.PaymentId = invoiceDTO.PaymentId;
                Invoice.DeleteFlag = invoiceDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void UpdateInvoiceLine(int id, InvoiceLineDTO InvoiceLineDTO)
        {
            try
            {
                var InvoiceLine = _context.InvoiceLines.FirstOrDefault(o => o.LineId == id);
                if (InvoiceLine == null)
                {
                    throw new Exception("Không có hóa đơn");
                }
                InvoiceLine.ServiceId = InvoiceLineDTO.ServiceId;
                InvoiceLine.Comment = InvoiceLineDTO.Comment;
                InvoiceLine.DeleteFlag = InvoiceLineDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetPayments(int pageNumber)
        {
            try
            {
                var totalPayments = _context.Payments.Count();

                var totalPages = (int)Math.Ceiling((double)totalPayments / PageSize);
                var getPageNumber = pageNumber;
                if (pageNumber <= 0) getPageNumber += 1;
                if (pageNumber > totalPages) getPageNumber = totalPages;
                List<Payment> Payments = _context.Payments
                .Select(o => new Payment { PaymentId = o.PaymentId, PaymentName = o.PaymentName })
                .Skip((getPageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();

                if (Payments == null || Payments.Count == 0)
                {
                    throw new Exception("Không có phương thức thanh toán");
                }

                return Payments;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void AddPayment(PaymentDTO o)
        {
            try
            {
                var Payment = new Payment
                {
                    PaymentName = o.PaymentName,
                };
                _context.Payments.Add(Payment);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void UpdatePayment(int id, PaymentDTO PaymentDTO)
        {
            try
            {
                var Payment = _context.Payments.FirstOrDefault(o => o.PaymentId == id);
                if (Payment == null)
                {
                    throw new Exception("Không có phương thức thanh toán");
                }
                Payment.PaymentName = PaymentDTO.PaymentName;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void DeletePayment(int id)
        {
            try
            {
                var Payment = _context.Payments.FirstOrDefault(o => o.PaymentId == id);
                if (Payment == null)
                {
                    throw new Exception("Không có phương thức thanh toán");
                }
                _context.Payments.Remove(Payment);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }
}
