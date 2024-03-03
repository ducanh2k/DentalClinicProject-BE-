using Microsoft.AspNetCore.Mvc;

namespace DentalClinicProject.Controllers
{
    public class MedicalRecordController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
