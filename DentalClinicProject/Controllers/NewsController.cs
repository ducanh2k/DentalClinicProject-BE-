using Microsoft.AspNetCore.Mvc;

namespace DentalClinicProject.Controllers
{
    public class NewsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
