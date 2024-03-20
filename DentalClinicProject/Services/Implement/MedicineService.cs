using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;

namespace DentalClinicProject.Services.Implement
{
    public class MedicineService : IMedicineService
    {
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;
        public MedicineService(dentalContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }
        public void AddMedicine(MedicineDTO med)
        {
            try
            {
                var medicine = new Medicine
                {
                    Name = med.Name,
                    Manufacturer = med.Manufacturer,
                    ExpiryDate = med.ExpiryDate,
                    InputDay = med.InputDay,
                    Price = med.Price,
                    QuantityInStock = med.QuantityInStock,
                    Dosage = med.Dosage,
                    Description = med.Description,
                    DeleteFlag = med.DeleteFlag,
                };
                _context.Medicines.Add(medicine);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteMedicine(int id)
        {
            try
            {
                var medicine = _context.Medicines.FirstOrDefault(o => o.Id == id);
                if (medicine == null)
                {
                    throw new Exception("Thuốc này không tồn tại");
                }
                medicine.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Medicine GetMedicine(int id)
        {
            try
            {
                Medicine ser = _context.Medicines
                .FirstOrDefault(x => x.Id == id);
                return ser;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Medicine> GetMedicines(int pageNumber)
        {
            try
            {
                var totalMeds = _context.Medicines
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalMeds / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                var medicines = _context.Medicines
                            .Where(s => s.DeleteFlag == false)
                            .Skip((pageNumber - 1) * PageSize)
                            .Take(PageSize)
                            .ToList();
                if (medicines == null || medicines.Count == 0)
                {
                    throw new Exception("Không có thuốc");
                }
                return medicines;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Medicine> GetMedicinesByName(string keyword, int pageNumber)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    throw new Exception("Từ khóa tìm kiếm không được để trống");
                }

                var medicines = _context.Medicines
                    .Where(s => s.Name.Contains(keyword)
                    || s.Dosage.Contains(keyword)
                    || s.Manufacturer.Contains(keyword)
                    || s.Description.Contains(keyword)
                    && s.DeleteFlag == false)
                    .ToList();

                if (medicines == null || medicines.Count == 0)
                {
                    throw new Exception("Không có thuốc nào phù hợp");
                }

                var totalMeds = medicines.Count();

                var totalPages = (int)Math.Ceiling((double)totalMeds / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;

                medicines = medicines
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                return medicines;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateMedicine(int id, MedicineDTO medDTO)
        {
            try
            {
                var medicine = _context.Medicines.FirstOrDefault(o => o.Id == id);
                if (medicine == null)
                {
                    throw new Exception("Thuốc này không tồn tại");
                }
                medicine.Name = medDTO.Name;
                medicine.Manufacturer = medDTO.Manufacturer;
                medicine.ExpiryDate = medDTO.ExpiryDate;
                medicine.InputDay = medDTO.InputDay;
                medicine.Price = medDTO.Price;
                medicine.QuantityInStock = medDTO.QuantityInStock;
                medicine.Dosage = medDTO.Dosage;
                medicine.Description = medDTO.Description;
                medicine.DeleteFlag = medDTO.DeleteFlag;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
