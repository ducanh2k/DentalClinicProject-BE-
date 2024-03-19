using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using System;

namespace DentalClinicProject.Services.Implement
{
    public class MaterialService : IMaterialService
    {
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;
        public MaterialService(dentalContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        public void AddMaterial(Material mat)
        {
            try
            {
                _context.Materials.Add(mat);
                _context.SaveChanges();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteMaterial(int id)
        {
            try
            {
                var material = _context.Materials.FirstOrDefault(o => o.MaterialId == id);
                if (material == null)
                {
                    throw new Exception("Vật liệu không tồn tại");
                }
                material.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Material GetMaterialById(int id)
        {
            try
            {
                var ser = _context.Materials
                .FirstOrDefault(x => x.MaterialId == id);

                if (ser == null)
                {
                    throw new Exception("Vật liệu không tồn tại");
                }
                return ser;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Material> GetMaterials(int pageNumber)
        {
            try
            {
                var totalMats = _context.Materials
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalMats / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                var Materials = _context.Materials
                    .Where(s => s.DeleteFlag == false)
                            .Skip((pageNumber - 1) * PageSize)
                            .Take(PageSize)
                    .ToList();
                if (Materials == null || Materials.Count == 0)
                {
                    throw new Exception("Không có dịch vụ");
                }
                return Materials;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Material> GetMaterialsByName(string keyword, int pageNumber)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    throw new Exception("Từ khóa tìm kiếm không được để trống");
                }
                var Materials = _context.Materials
                   .Where(s => s.MaterialName.Contains(keyword)
                   || s.Supplier.Contains(keyword)
                   && s.DeleteFlag == false
                   )
                   .ToList();

                var totalMats = Materials.Count();

                var totalPages = (int)Math.Ceiling((double)totalMats / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                Materials = Materials
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize).ToList();

                if (Materials == null || Materials.Count == 0)
                {
                    throw new Exception("Không có dịch vụ nào phù hợp");
                }

                return Materials;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateMaterial(int id, Material mat )
        {
            try
            {
                var material = _context.Materials.FirstOrDefault(o => o.MaterialId == id);
                if (material == null)
                {
                    throw new Exception("Vật liệu không tồn tại");
                }
                material.MaterialName = mat.MaterialName;
                material.Supplier = mat.Supplier;
                material.UnitPrice = mat.UnitPrice;
                material.QuantityInStock = mat.QuantityInStock;
                material.Type = mat.Type;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
