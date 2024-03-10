using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
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
        public IActionResult GetInvoices(int pageNumber)
        {
            var totalInvoices = _context.Invoices
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalInvoices / PageSize);
            var getPageNumber = pageNumber;
            if (pageNumber <= 0) getPageNumber += 1;
            if (pageNumber > totalPages) getPageNumber = totalPages;
            List<Invoice> invoices = _context.Invoices.Include(o => o.Payment)
                .Include(o => o.Customer)
                .Include(o => o.Staff)
                .Where(x => x.DeleteFlag == false)
                .Skip((getPageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            if (invoices == null || invoices.Count == 0)
            {
                return NotFound("Không có hóa đơn");
            }
            //map
            List<InvoiceDTO> results = new List<InvoiceDTO>();
            results = invoices.Select(_mapper.Map<Invoice, InvoiceDTO>).ToList();
            return Ok(results);
        }
        //Get invoices by user
        [HttpGet("list/{PatientId}")]
        public IActionResult GetInvoicesByUser(int pageNumber, int PatientId)
        {
            var totalInvoices = _context.Invoices
                              .Where(x => x.DeleteFlag == false && x.CustomerId == PatientId)
                              .Count();

            var totalPages = (int)Math.Ceiling((double)totalInvoices / PageSize);
            var getPageNumber = pageNumber;
            if (pageNumber <= 0) getPageNumber += 1;
            if (pageNumber > totalPages) getPageNumber = totalPages;
            List<Invoice> invoices = _context.Invoices.Include(o => o.Customer).Include(o => o.Staff).Include(o => o.Payment)
                .Where(x => x.DeleteFlag == false && x.CustomerId == PatientId)
                .Skip((getPageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            if (invoices == null || invoices.Count == 0)
            {
                return NotFound("Không có hóa đơn");
            }
            //map
            List<InvoiceDTO> results = new List<InvoiceDTO>();
            results = invoices.Select(_mapper.Map<Invoice, InvoiceDTO>).ToList();
            return Ok(results);
        }
        //Get invoices by searching customerName and staffName
        [HttpGet("search")]
        public IActionResult GetInvoicesByKeyword(int pageNumber, string keyword)
        {
            // get list
            List<Invoice> invoices = _context.Invoices.Include(o => o.Customer).Include(o => o.Staff).Include(o => o.Payment)
                .Where(x =>
                    x.Staff.Name.Contains(keyword)
                    || x.Customer.Name.Contains(keyword)
                    || x.Comment.Contains(keyword)
                    && x.DeleteFlag == false )
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
        //Get invoice include details by invoice id
        [HttpGet("{Id}")]
        public IActionResult GetInvoicesById(int Id)
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
                    line.MaterialId,
                    MaterialName = line.Material != null ? line.Material.MaterialName : null,
                    line.Quantity,
                    line.Comment
                }).ToList()
            }).ToList();


            return Ok(results);
        }

        // Create Invoice
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

        //Payment Management

    }
}
