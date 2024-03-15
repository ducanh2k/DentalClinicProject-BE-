using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net.NetworkInformation;
using System.Xml.Linq;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InvoiceController : Controller
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public InvoiceController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        //Invoice Management
        //Get all users invoice

        [HttpGet("list")]
        public IActionResult GetInvoices(int pageNumber, int type) //type = 1: import , type 2 = export
        {
            try
            {
                List<Invoice> invoices = _context.Invoices.Include(o => o.Payment)
                    .Include(o => o.Customer)
                    .Include(o => o.Staff)
                    
                    .ToList();
                if(type == 1)
                {
                    invoices = invoices.Where(x => x.DeleteFlag == false
                            && x.StaffId == null
                    ).ToList();
                }else if(type == 2)
                {
                    invoices = invoices.Where(x => x.DeleteFlag == false
                            && x.StaffId != null
                    ).ToList();
                }
                if (invoices == null || invoices.Count == 0)
                {
                    return NotFound("Không có hóa đơn");
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
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //Get invoices by user
        [HttpGet("list/{PatientId}")]
        public IActionResult GetInvoicesByUser(int pageNumber, int PatientId)
        {
            try
            {
                List<Invoice> invoices = _context.Invoices.Include(o => o.Customer).Include(o => o.Staff).Include(o => o.Payment)
                    .Where(x => x.DeleteFlag == false && x.CustomerId == PatientId).ToList();
                if (invoices == null || invoices.Count == 0)
                {
                    return NotFound("Không có hóa đơn");
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
                return Ok(results);
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        //Get invoices by searching customerName and staffName
        [HttpGet("search")]
        public IActionResult GetInvoicesByKeyword(int pageNumber, string keyword)
        {
            try
            {
                // get list
                List<Invoice> invoices = _context.Invoices.Include(o => o.Customer).Include(o => o.Staff).Include(o => o.Payment)
                    .Where(x =>
                        x.Staff.Name.Contains(keyword)
                        || x.Customer.Name.Contains(keyword)
                        || x.Comment.Contains(keyword)
                        && x.DeleteFlag == false)
                    .ToList();
                if (invoices == null || invoices.Count == 0)
                {
                    return NotFound("Không có hóa đơn");
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
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.ToString());
            }
        }
        //Get invoice include details by invoice id
        [HttpGet("{Id}")]
        public IActionResult GetInvoicesById(int Id, int type) //type 1: import , type 2:export
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
                    return NotFound("Không có hóa đơn");
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
                    return Ok(results);
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
                    return Ok(results);
                }
                return BadRequest("Something wrong");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // Create Invoice: Customer and staff id are null mean import bill
        [HttpPost]
        public IActionResult AddInvoice(InvoiceDTO o)
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
            try
            {
                _context.Invoices.Add(Invoice);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPost("import")]
        public IActionResult AddImportInvoice(InvoiceImportDTO o)
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
            try
            {
                _context.Invoices.Add(Invoice);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        // Update Invoice
        [HttpPut("{id}")]
        public ActionResult UpdateInvoice(int id, InvoiceDTO invoiceDTO)
        {
            var Invoice = _context.Invoices.FirstOrDefault(o => o.InvoiceId == id);
            if (Invoice == null)
            {
                return NotFound();
            }
            Invoice.CustomerId = invoiceDTO.CustomerId;
            Invoice.StaffId = invoiceDTO.StaffId;
            Invoice.Status = invoiceDTO.Status;
            Invoice.Discount = invoiceDTO.Discount;
            Invoice.Comment = invoiceDTO.Comment;
            Invoice.PaymentId = invoiceDTO.PaymentId;
            Invoice.DeleteFlag = invoiceDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpPut("import/{id}")]
        public ActionResult UpdateImportInvoice(int id, InvoiceImportDTO invoiceDTO)
        {
            var Invoice = _context.Invoices.FirstOrDefault(o => o.InvoiceId == id);
            if (Invoice == null)
            {
                return NotFound();
            }
            Invoice.CustomerId = invoiceDTO.CustomerId;
            Invoice.Status = invoiceDTO.Status;
            Invoice.Discount = invoiceDTO.Discount;
            Invoice.Comment = invoiceDTO.Comment;
            Invoice.PaymentId = invoiceDTO.PaymentId;
            Invoice.DeleteFlag = invoiceDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        //Delete Invoice
        [HttpDelete("{id}")]
        public ActionResult DeleteInvoice(int id)
        {
            var Invoice = _context.Invoices.FirstOrDefault(o => o.InvoiceId == id);
            if (Invoice == null)
            {
                return NotFound();
            }
            Invoice.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }

        //Invoice Details Management
        //List
        [HttpGet("InvoiceLines")]
        public IActionResult GetInvoiceLines(int pageNumber)
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
            return Ok(results);
        }
        // Create InvoiceLine
        [HttpPost("InvoiceLines")]
        public IActionResult AddInvoiceLine(InvoiceLineDTO o)
        {
            var InvoiceLine = new InvoiceLine
            {
                InvoiceId = o.InvoiceId,
                ServiceId = o.ServiceId,
                Quantity = o.Quantity,
                Comment = o.Comment,
                DeleteFlag = false
            };
            try
            {
                _context.InvoiceLines.Add(InvoiceLine);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPost("import/InvoiceLines")]
        public IActionResult AddInvoiceLine(InvoiceLineImportDTO o)
        {
            var InvoiceLine = new InvoiceLine
            {
                InvoiceId = o.InvoiceId,
                MaterialId = o.MaterialId,
                Quantity = o.Quantity,
                Comment = o.Comment,
                DeleteFlag = false
            };
            try
            {
                _context.InvoiceLines.Add(InvoiceLine);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        // Update InvoiceLine
        [HttpPut("InvoiceLines/{id}")]
        public ActionResult UpdateInvoiceLine(int id, InvoiceLineDTO InvoiceLineDTO)
        {
            var InvoiceLine = _context.InvoiceLines.FirstOrDefault(o => o.LineId == id);
            if (InvoiceLine == null)
            {
                return NotFound();
            }
            try
            {
                InvoiceLine.ServiceId = InvoiceLineDTO.ServiceId;
                InvoiceLine.Comment = InvoiceLineDTO.Comment;
                InvoiceLine.Quantity = InvoiceLineDTO.Quantity;
                InvoiceLine.DeleteFlag = InvoiceLineDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            return NoContent();
        }

        [HttpPut("import/InvoiceLines/{id}")]
        public ActionResult UpdateImportInvoiceLine(int id, InvoiceLineImportDTO InvoiceLineDTO)
        {
            var InvoiceLine = _context.InvoiceLines.FirstOrDefault(o => o.LineId == id);
            if (InvoiceLine == null)
            {
                return NotFound();
            }
            try
            {
                InvoiceLine.MaterialId = InvoiceLineDTO.MaterialId;
                InvoiceLine.Comment = InvoiceLineDTO.Comment;
                InvoiceLine.Quantity = InvoiceLineDTO.Quantity;
                InvoiceLine.DeleteFlag = InvoiceLineDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            return NoContent();
        }
        //Delete InvoiceLine
        [HttpDelete("InvoiceLines/{id}")]
        public ActionResult DeleteInvoiceLine(int id)
        {
            var InvoiceLine = _context.InvoiceLines.FirstOrDefault(o => o.LineId == id);
            if (InvoiceLine == null)
            {
                return NotFound();
            }
            InvoiceLine.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
        








        //Payment Management
        //List
        [HttpGet("Payments")]
        public IActionResult GetPayments(int pageNumber)
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
                return NotFound("Không có hóa đơn");
            }
            
            return Ok(Payments);
        }
        // Create Payment
        [HttpPost("Payments")]
        public IActionResult AddPayment(PaymentDTO o)
        {
            var Payment = new Payment
            {
                PaymentName = o.PaymentName,
            };
            try
            {
                _context.Payments.Add(Payment);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }
        // Update Payment
        [HttpPut("Payments/{id}")]
        public ActionResult UpdatePayment(int id, PaymentDTO PaymentDTO)
        {
            var Payment = _context.Payments.FirstOrDefault(o => o.PaymentId == id);
            if (Payment == null)
            {
                return NotFound();
            }
            Payment.PaymentName = PaymentDTO.PaymentName;
            _context.SaveChanges();
            return NoContent();
        }
        //Delete Payment
        [HttpDelete("Payments/{id}")]
        public ActionResult DeletePayment(int id)
        {
            var Payment = _context.Payments.FirstOrDefault(o => o.PaymentId == id);
            if (Payment == null)
            {
                return NotFound();
            }
            _context.Payments.Remove(Payment);
            _context.SaveChanges();
            return NoContent();
        }

        //var invoiceLines = _context.InvoiceLines
    //.Where(line => line.InvoiceId == 2) // Lọc theo InvoiceId cụ thể
    //.Include(line => line.Invoice)
    //.Include(line => line.Service)
    //.Include(line => line.Material)
    //.Select(line => new
    //{
    //    line.InvoiceId,
    //    line.LineId,
    //    ServiceName = line.Service.ServiceName,
    //    MaterialName = line.Material.MaterialName,
    //    line.Quantity,
    //    line.Service.Price,
    //    line.Material.UnitPrice,
    //    TotalPay = line.Service.Price + (line.Material.UnitPrice* line.Quantity)
    //})
    //.ToList();


}
}
