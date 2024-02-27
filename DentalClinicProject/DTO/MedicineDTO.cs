namespace DentalClinicProject.DTO
{
    public class MedicineDTO
    {
        public string? Name { get; set; }
        public string? Manufacturer { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public DateTime? InputDay { get; set; }
        public double? Price { get; set; }
        public int? QuantityInStock { get; set; }
        public string? Dosage { get; set; }
        public string? Description { get; set; }
    }
}
