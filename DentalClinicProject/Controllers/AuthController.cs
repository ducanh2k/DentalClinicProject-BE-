using Microsoft.AspNetCore.Mvc;

namespace DentalClinicProject.Controllers
{
    public class AuthController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
