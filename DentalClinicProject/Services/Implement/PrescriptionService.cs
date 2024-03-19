using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class PrescriptionService : IPrescriptionService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public PrescriptionService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        public void AddPrescription(PrescriptionDTO PrescriptionDTO)
        {
            try
            {
                var prescription = new Prescription
                {
                    CreatedDate = DateTime.Now,
                    DoctorId = PrescriptionDTO.DoctorId,
                    Note = PrescriptionDTO.Note,
                    DeleteFlag = false
                };
                _context.Prescriptions.Add(prescription);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void DeletePrescription(int id)
        {
            try
            {
                var prescription = _context.Prescriptions.FirstOrDefault(o => o.PrescriptionId == id);
                if (prescription == null)
                {
                    throw new Exception("Không có đơn thuốc");
                }
                prescription.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetPrescription(int id)
        {
            try
            {
                var prescription = _context.Prescriptions
                .Include(p => p.PrescriptionDetails)
                    .ThenInclude(pd => pd.Medicine)
                .FirstOrDefault(x => x.PrescriptionId == id);

                if (prescription == null)
                {
                    throw new Exception("Không có đơn thuốc");
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

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetPrescriptions(int pageNumber)
        {
            try
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
                    throw new Exception("Không có đơn thuốc");
                }

                //map
                List<PrescriptionDTO> results = new List<PrescriptionDTO>();
                results = prescriptions.Select(_mapper.Map<Prescription, PrescriptionDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public object GetPrescriptionsBySearch(string keyword, int pageNumber)
        {
            try
            {
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
                    throw new Exception("Không có đơn thuốc");
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
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public void UpdatePrescriptions(int id, PrescriptionDTO PrescriptionDTO)
        {
            try
            {
                var prescription = _context.Prescriptions.FirstOrDefault(o => o.PrescriptionId == id);
                if (prescription == null)
                {
                    throw new Exception("Không có đơn thuốc");
                }
                prescription.DoctorId = PrescriptionDTO.DoctorId;
                prescription.Note = PrescriptionDTO.Note;
                prescription.DeleteFlag = PrescriptionDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }
}
