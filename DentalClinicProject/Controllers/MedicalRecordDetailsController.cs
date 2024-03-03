using Microsoft.AspNetCore.Mvc;

namespace DentalClinicProject.Controllers
{
    public class MedicalRecordDetailsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
