using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class MedicalRecordDetailService : IMedicalRecordDetailService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public MedicalRecordDetailService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        public void AddMedicalRecordDetail(MedicalRecordDetailDTO MedicalRecordDetailDTO)
        {
            try
            {
                var MedicalRecordDetail = new MedicalRecordDetail
                {
                    MedicalRecordId = MedicalRecordDetailDTO.MedicalRecordId,
                    ServiceId = MedicalRecordDetailDTO.ServiceId,
                    PrescriptionId = MedicalRecordDetailDTO.PrescriptionId,
                    Diagnosis = MedicalRecordDetailDTO.Diagnosis,
                    DeleteFlag = false
                };
                _context.MedicalRecordDetails.Add(MedicalRecordDetail);
                _context.SaveChanges();
            }
            catch (Exception ex) {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteMedicalRecordDetail(int id)
        {
            try
            {
                var MedicalRecordDetail = _context.MedicalRecordDetails.FirstOrDefault(o => o.MrDetailId == id);
                if (MedicalRecordDetail == null)
                {
                    throw new Exception("Đơn thuốc không tồn tại");
                }
                MedicalRecordDetail.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public MedicalRecordDetailDTO GetMedicalRecordDetail(int id)
        {
            try
            {
                var MedicalRecordDetails = _context.MedicalRecordDetails
                .Include(d => d.Service)
                .FirstOrDefault(x => x.MrDetailId == id);
                if (MedicalRecordDetails == null)
                {
                    throw new Exception("Không có đơn thuốc");
                }

                //map
                var results = _mapper.Map<MedicalRecordDetailDTO>(MedicalRecordDetails);
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<MedicalRecordDetailDTO> GetMedicalRecordDetails(int pageNumber)
        {
            try
            {
                var totalMR = _context.MedicalRecordDetails
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalMR / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                List<MedicalRecordDetail> list = _context.MedicalRecordDetails
                    .Include(d => d.Service)
                    .Where(x => x.DeleteFlag == false)
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();
                if (list == null || list.Count == 0)
                {
                    throw new Exception("Không có lịch sử khám");
                }

                //map
                List<MedicalRecordDetailDTO> results = new List<MedicalRecordDetailDTO>();
                results = list.Select(_mapper.Map<MedicalRecordDetail, MedicalRecordDetailDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateMedicalRecordDetails(int id, MedicalRecordDetailDTO MedicalRecordDetailDTO, bool type)
        {
            try
            {
                var MedicalRecordDetail = _context.MedicalRecordDetails.Include(m => m.MedicalRecord).FirstOrDefault(o => o.MrDetailId == id);
                if (MedicalRecordDetail == null)
                {
                    throw new Exception("Đơn thuốc này không tồn tại");
                }
                MedicalRecordDetail.MedicalRecordId = MedicalRecordDetailDTO.MedicalRecordId;
                MedicalRecordDetail.ServiceId = MedicalRecordDetailDTO.ServiceId;
                MedicalRecordDetail.PrescriptionId = MedicalRecordDetailDTO.PrescriptionId;
                MedicalRecordDetail.Diagnosis = MedicalRecordDetailDTO.Diagnosis;
                MedicalRecordDetail.DeleteFlag = MedicalRecordDetailDTO.DeleteFlag;
                _context.SaveChanges();
                // Create invoice

                try
                {
                    var Invoice = new Invoice
                    {
                        CustomerId = MedicalRecordDetail.MedicalRecord.PatientId,
                        Date = DateTime.Now,
                        Status = 1,
                        DeleteFlag = false
                    };
                    _context.Invoices.Add(Invoice);
                    _context.SaveChanges();

                    try
                    {
                        var line = new InvoiceLine
                        {
                            InvoiceId = Invoice.InvoiceId,
                            ServiceId = MedicalRecordDetailDTO.ServiceId,
                            DeleteFlag = false
                        };
                        _context.InvoiceLines.Add(line);
                        _context.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Thêm mới dòng hóa đơn thất bại");
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Thêm mới hóa đơn thất bại");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
