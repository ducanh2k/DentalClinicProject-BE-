using AutoMapper;
using AutoMapper.Features;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;

        public NewsController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetNews(int pageNumber)
        {
            var totalNews = _context.News
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalNews / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var News = _context.News
                        .Include(a => a.AuthorNavigation)
                        .Where(s => s.DeleteFlag == false)
                        .OrderByDescending(a => a.CreatedAt)
                        .Skip((pageNumber - 1) * PageSize)
                        .Take(PageSize)
                        .ToList();

            if (News == null || News.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }

            var results = News.Select(_mapper.Map<News, NewsDTO>).ToList();

            return Ok(results);
        }

        [HttpGet("search")]
        public IActionResult GetNewsByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var totalNews = _context.News
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalNews / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var News = _context.News
            .Include(a => a.AuthorNavigation)
            .Where(s =>
                (EF.Functions.Like(s.Tittle, $"%{keyword}%") ||
                EF.Functions.Like(s.BriefInfo, $"%{keyword}%") ||
                EF.Functions.Like(s.Description, $"%{keyword}%")) ||
                 EF.Functions.Like(s.AuthorNavigation.Name, $"%{keyword}%")
                && s.DeleteFlag == false
            )
            .OrderByDescending(a => a.CreatedAt)
            .Skip((pageNumber - 1) * PageSize)
            .Take(PageSize)
            .ToList();



            if (News == null || News.Count == 0)
            {
                return NotFound("Không có dịch vụ");
            }

            var results = News.Select(_mapper.Map<News, NewsDTO>).ToList();

            return Ok(results);
        }


        [HttpGet("{id}")]
        public IActionResult GetNew(int id)
        {
            var ser = _context.News
                .Where(x => x.Id == id)
                .Include(a => a.AuthorNavigation)
                .FirstOrDefault();

            if (ser == null)
            {
                return NotFound("Không có");
            }
            var serDTO = _mapper.Map<NewsDTO>(ser);

            return Ok(serDTO);
        }


        [HttpPost]
        public IActionResult AddNew(NewsDTO newsDTO)
        {
            var New = new News
            {
                Tittle = newsDTO.Tittle,
                BriefInfo = newsDTO.BriefInfo,
                Description = newsDTO.Description,
                Author = newsDTO.Author,
                CreatedAt = DateTime.Now,
                DeleteFlag = false,
                Featured = newsDTO.Featured,
            };
            try
            {
                _context.News.Add(New);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateNew(int id, NewsDTO newsDTO)
        {
            var New = _context.News.FirstOrDefault(o => o.Id == id);
            if (New == null)
            {
                return NotFound();
            }
            try
            {
                New.Tittle = newsDTO.Tittle;
                New.BriefInfo = newsDTO.BriefInfo;
                New.Description = newsDTO.Description;
                New.Author = newsDTO.Author;
                New.DeleteFlag = newsDTO.DeleteFlag;
                New.Featured = newsDTO.Featured;
            }
            catch (Exception ex)
            {
                return BadRequest(" Cập nhật thất bại");
            }

            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteNew(int id)
        {
            var New = _context.News.FirstOrDefault(o => o.Id == id);
            if (New == null)
            {
                return NotFound();
            }
            New.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}

