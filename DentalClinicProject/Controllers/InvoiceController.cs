using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
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
        private readonly IInvoiceService invoiceService;

        public InvoiceController(IInvoiceService _invoiceService)
        {
            invoiceService = _invoiceService;
        }

        //Invoice Management
        //Get all users invoice

        [HttpGet("list")]
        public IActionResult GetInvoices(int pageNumber, int type) //type = 1: import , type 2 = export
        {
            try
            {
                var results = invoiceService.GetInvoices(pageNumber, type);
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
                var results = invoiceService.GetInvoicesByUser(pageNumber, PatientId);
                return Ok(results);
            }
            catch (Exception ex)
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
                var results = invoiceService.GetInvoicesByKeyword(pageNumber, keyword);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        //Get invoice include details by invoice id
        [HttpGet("{Id}")]
        public IActionResult GetInvoicesById(int Id, int type) //type 1: import , type 2:export
        {
            try
            {
                var result = invoiceService.GetInvoicesById(Id, type);
                return Ok(result);

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
            try
            {
                invoiceService.AddInvoice(o);
                return Ok("Thêm mới hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới hóa đơn thất bại");
            }
        }

        [HttpPost("import")]
        public IActionResult AddImportInvoice(InvoiceImportDTO o)
        {
            try
            {
                invoiceService.AddImportInvoice(o);
                return Ok("Thêm mới hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới hóa đơn thất bại");
            }
        }

        // Update Invoice
        [HttpPut("{id}")]
        public ActionResult UpdateInvoice(int id, InvoiceDTO invoiceDTO)
        {
            try
            {
                invoiceService.UpdateInvoice(id, invoiceDTO);
                return Ok("Cập nhật hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật hóa đơn thất bại");
            }
        }

        [HttpPut("import/{id}")]
        public ActionResult UpdateImportInvoice(int id, InvoiceImportDTO invoiceDTO)
        {
            try
            {
                invoiceService.UpdateImportInvoice(id, invoiceDTO);
                return Ok("Cập nhật hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật hóa đơn thất bại");
            }
        }

        //Delete Invoice
        [HttpDelete("{id}")]
        public ActionResult DeleteInvoice(int id)
        {
            try
            {
                invoiceService.DeleteInvoice(id);
                return Ok("Xóa hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa hóa đơn thất bại");
            }
        }

        //Invoice Details Management
        //List
        [HttpGet("InvoiceLines")]
        public IActionResult GetInvoiceLines(int pageNumber)
        {

            try
            {
                var result = invoiceService.GetInvoiceLines(pageNumber);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        // Create InvoiceLine
        [HttpPost("InvoiceLines")]
        public IActionResult AddInvoiceLine(InvoiceLineDTO o)
        {
            try
            {
                invoiceService.AddInvoiceLine(o);
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
            try
            {
                invoiceService.AddInvoiceLine(o);
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
            try
            {
                invoiceService.UpdateInvoiceLine(id, InvoiceLineDTO);
                return Ok("Cập nhật hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật hóa đơn thất bại");
            }
        }

        [HttpPut("import/InvoiceLines/{id}")]
        public ActionResult UpdateImportInvoiceLine(int id, InvoiceLineImportDTO InvoiceLineDTO)
        {
            try
            {
                invoiceService.UpdateImportInvoiceLine(id, InvoiceLineDTO);
                return Ok("Cập nhật hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật hóa đơn thất bại");
            }
        }
        //Delete InvoiceLine
        [HttpDelete("InvoiceLines/{id}")]
        public ActionResult DeleteInvoiceLine(int id)
        {
            try
            {
                invoiceService.DeleteInvoiceLine(id);
                return Ok("Xóa hóa đơn thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa hóa đơn thất bại");
            }
        }
        
        //Payment Management
        //List
        [HttpGet("Payments")]
        public IActionResult GetPayments(int pageNumber)
        {
            try
            {
                var payments = invoiceService.GetPayments(pageNumber);
                return Ok(payments);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        // Create Payment
        [HttpPost("Payments")]
        public IActionResult AddPayment(PaymentDTO o)
        {
            try
            {
                invoiceService.AddPayment(o);
                return Ok("Thêm mới phương thức thanh toán thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới phương thức thanh toán thất bại");
            }
        }
        // Update Payment
        [HttpPut("Payments/{id}")]
        public ActionResult UpdatePayment(int id, PaymentDTO PaymentDTO)
        {
            try
            {
                invoiceService.UpdatePayment(id, PaymentDTO);
                return Ok("Cập nhật phương thức thanh toán thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Cập nhật phương thức thanh toán thất bại");
            }
        }
        //Delete Payment
        [HttpDelete("Payments/{id}")]
        public ActionResult DeletePayment(int id)
        {
            try
            {
                invoiceService.DeletePayment(id);
                return Ok("Xóa phương thức thanh toán thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Xóa phương thức thanh toán thất bại");
            }
        }

     


}
}
