using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class PrescriptionDetailService : IPrescriptionDetailService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public PrescriptionDetailService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        public void AddPrescription(PrescriptionDetailDTO PrescriptionDetaiDTO)
        {
            try
            {
                var prescription = new PrescriptionDetail
                {
                    PrescriptionId = PrescriptionDetaiDTO.PrescriptionId,
                    MedicineId = PrescriptionDetaiDTO.MedicineId,
                    Quantity = PrescriptionDetaiDTO.Quantity,
                    DosageInstruction = PrescriptionDetaiDTO.DosageInstruction,
                    DeleteFlag = false
                };
                _context.PrescriptionDetails.Add(prescription);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeletePrescriptionDetail(int id)
        {
            try
            {
                var prescription = _context.PrescriptionDetails.FirstOrDefault(o => o.PrescriptionId == id);
                if (prescription == null)
                {
                    throw new Exception("Không thấy nội dung đơn thuốc");
                }
                prescription.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public PrescriptionDetailDTO GetPrescriptionDetail(int id)
        {
            try
            {
                var prescriptions = _context.PrescriptionDetails
                .Include(d => d.Medicine)
                .FirstOrDefault(x => x.PrescriptionId == id);
                if (prescriptions == null)
                {
                    throw new Exception("Không có đơn thuốc");
                }

                //map
                var results = _mapper.Map<PrescriptionDetailDTO>(prescriptions);
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<PrescriptionDetailDTO> GetPrescriptionDetails(int prescriptionId)
        {
            try
            {
                // Tìm đơn thuốc dựa trên prescriptionId
                var prescription = _context.Prescriptions
                    .Include(p => p.PrescriptionDetails)
                        .ThenInclude(pd => pd.Medicine)
                    .FirstOrDefault(p => p.PrescriptionId == prescriptionId);

                // Kiểm tra xem đơn thuốc có tồn tại không
                if (prescription == null)
                {
                    throw new Exception("Không tìm thấy đơn thuốc");
                }

                // Lấy tất cả các chi tiết đơn thuốc của đơn thuốc này
                var prescriptionDetails = prescription.PrescriptionDetails;

                // Kiểm tra xem có chi tiết đơn thuốc nào không
                if (prescriptionDetails == null || prescriptionDetails.Count == 0)
                {
                    throw new Exception("Đơn thuốc này không có chi tiết");
                }

                // Map prescriptionDetails sang DTO nếu cần
                var prescriptionDetailsDTO = prescriptionDetails.Select(pd =>
                    new PrescriptionDetailDTO
                    {
                        PrescriptionDetailId = pd.PrescriptionDetailId,
                        PrescriptionId = pd.PrescriptionId,
                        MedicineId = pd.MedicineId,
                        MedicineName = pd.Medicine != null ? pd.Medicine.Name : null,
                        Quantity = pd.Quantity,
                        DosageInstruction = pd.DosageInstruction,
                        DeleteFlag = pd.DeleteFlag
                    }).ToList();

                return prescriptionDetailsDTO;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<PrescriptionDetailDTO> GetPrescriptionDetailss(int pageNumber)
        {
            try
            {
                var totalPrescriptionDetails = _context.PrescriptionDetails
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalPrescriptionDetails / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                List<PrescriptionDetail> prescriptionDetails = _context.PrescriptionDetails
                    .Include(d => d.Medicine)
                    .Where(x => x.DeleteFlag == false)
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();
                if (prescriptionDetails == null || prescriptionDetails.Count == 0)
                {
                    throw new Exception("Không có đơn thuốc");
                }

                //map
                List<PrescriptionDetailDTO> results = new List<PrescriptionDetailDTO>();
                results = prescriptionDetails.Select(_mapper.Map<PrescriptionDetail, PrescriptionDetailDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<PrescriptionDetailDTO> GetPrescriptionsBySearch(string keyword, int pageNumber)
        {
            try
            {
                List<PrescriptionDetail> prescriptionDetails = _context.PrescriptionDetails
                .Include(d => d.Medicine)
                .Where(x =>
                x.Medicine.Name.Contains(keyword)
                || x.DosageInstruction.Contains(keyword)
                && x.DeleteFlag == false)
                .ToList();

                if (prescriptionDetails == null || prescriptionDetails.Count == 0)
                {
                    throw new Exception("Không có đơn thuốc");
                }

                var totalPrescriptionDetails = prescriptionDetails.Count();

                var totalPages = (int)Math.Ceiling((double)totalPrescriptionDetails / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                prescriptionDetails = prescriptionDetails
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                //map
                List<PrescriptionDetailDTO> results = new List<PrescriptionDetailDTO>();
                results = prescriptionDetails.Select(_mapper.Map<PrescriptionDetail, PrescriptionDetailDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdatePrescriptions(int id, PrescriptionDetailDTO PrescriptionDetaiDTO)
        {
            try
            {
                var prescription = _context.PrescriptionDetails.FirstOrDefault(o => o.PrescriptionDetailId == id);
                if (prescription == null)
                {
                    throw new Exception("Dòng đơn thuốc không tồn tại");
                }
                prescription.PrescriptionId = PrescriptionDetaiDTO.PrescriptionId;
                prescription.MedicineId = PrescriptionDetaiDTO.MedicineId;
                prescription.Quantity = PrescriptionDetaiDTO.Quantity;
                prescription.DosageInstruction = PrescriptionDetaiDTO.DosageInstruction;
                prescription.DeleteFlag = PrescriptionDetaiDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
