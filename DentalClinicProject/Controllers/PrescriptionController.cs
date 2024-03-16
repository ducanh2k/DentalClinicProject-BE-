﻿using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrescriptionController : Controller
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public PrescriptionController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetPrescriptions(int pageNumber)
        {
            var totalPrescriptions = _context.Prescriptions
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalPrescriptions / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            List<Prescription> prescriptions = _context.Prescriptions
                .Include(d => d.Doctor)
                .Where(x => x.DeleteFlag == false)
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();
            if (prescriptions == null || prescriptions.Count == 0)
            {
                return NotFound("Không có đơn thuốc");
            }

            //map
            List<PrescriptionDTO> results = new List<PrescriptionDTO>();
            results = prescriptions.Select(_mapper.Map<Prescription, PrescriptionDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("search")]
        public IActionResult GetPrescriptionsBySearch(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            List<Prescription> prescriptions = _context.Prescriptions
                .Include(d => d.Doctor)
                .Where(x =>
                x.Note.Contains(keyword)
                && x.PrescriptionId.Equals(keyword)
                && x.Doctor.Name.Contains(keyword)
                && x.DeleteFlag == false)
                .ToList();

            if (prescriptions == null || prescriptions.Count == 0)
            {
                return NotFound("Không có đơn thuốc");
            }

            var totalPrescriptions = prescriptions.Count();

            var totalPages = (int)Math.Ceiling((double)totalPrescriptions / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            prescriptions = prescriptions
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();

            //map
            List<PrescriptionDTO> results = new List<PrescriptionDTO>();
            results = prescriptions.Select(_mapper.Map<Prescription, PrescriptionDTO>).ToList();
            return Ok(results);
        }

        [HttpGet("{id}")]
        public IActionResult GetPrescription(int id)
        {
            try
            {
                var prescription = _context.Prescriptions
                .Include(p => p.PrescriptionDetails)
                    .ThenInclude(pd => pd.Medicine)
                .FirstOrDefault(x => x.PrescriptionId == id);

                if (prescription == null)
                {
                    return NotFound("Không có đơn thuốc");
                }

                var medicines = prescription.PrescriptionDetails
                    .Select(pd => new
                    {
                        pd.Medicine.Name,
                        pd.Quantity,
                        pd.Medicine.Dosage
                    })
                    .ToList();

                var result = new
                {
                    Medicines = medicines,
                    DoctorNote = prescription.Note
                };

                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.ToString());
            }
        }

        [HttpPost]
        public IActionResult AddPrescription(PrescriptionDTO PrescriptionDTO)
        {
            var prescription = new Prescription
            {
                CreatedDate = DateTime.Now,
                DoctorId = PrescriptionDTO.DoctorId,
                Note = PrescriptionDTO.Note,
                DeleteFlag = false


            };
            try
            {
                _context.Prescriptions.Add(prescription);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdatePrescriptions(int id, PrescriptionDTO PrescriptionDTO)
        {
            var prescription = _context.Prescriptions.FirstOrDefault(o => o.PrescriptionId == id);
            if (prescription == null)
            {
                return NotFound();
            }
            prescription.DoctorId = PrescriptionDTO.DoctorId;
            prescription.Note = PrescriptionDTO.Note;
            prescription.DeleteFlag = PrescriptionDTO.DeleteFlag;
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeletePrescription(int id)
        {
            var prescription = _context.Prescriptions.FirstOrDefault(o => o.PrescriptionId == id);
            if (prescription == null)
            {
                return NotFound();
            }
            prescription.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }

    }
}
