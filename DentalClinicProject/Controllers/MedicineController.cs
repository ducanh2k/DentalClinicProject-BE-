using Microsoft.AspNetCore.Mvc;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicineController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
