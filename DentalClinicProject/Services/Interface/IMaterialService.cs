using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using System;

namespace DentalClinicProject.Services.Interface
{
    public interface IMaterialService
    {
        List<Material> GetMaterials(int pageNumber);
        Material GetMaterialById(int id);
        List<Material> GetMaterialsByName(string keyword, int pageNumber);
        void AddMaterial(Material mat);
        void UpdateMaterial(int id, Material mat);
        void DeleteMaterial(int id);
    }
}
