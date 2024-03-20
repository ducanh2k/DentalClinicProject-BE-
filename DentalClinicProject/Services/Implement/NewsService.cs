using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class NewsService : INewsService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;

        public NewsService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        public void AddNew(NewsDTO newsDTO)
        {
            try
            {
                var New = new News
                {
                    Tittle = newsDTO.Tittle,
                    Img = newsDTO.Img,
                    BriefInfo = newsDTO.BriefInfo,
                    Description = newsDTO.Description,
                    Author = newsDTO.Author,
                    CreatedAt = DateTime.Now,
                    DeleteFlag = false,
                    Featured = newsDTO.Featured,
                };
                _context.News.Add(New);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteNew(int id)
        {
            try
            {
                var New = _context.News.FirstOrDefault(o => o.Id == id);
                if (New == null)
                {
                    throw new Exception("Tin tức này không tồn tại");
                }
                New.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public NewsDTO GetNew(int id)
        {
            try
            {
                var ser = _context.News
                                .Where(x => x.Id == id)
                                .Include(a => a.AuthorNavigation)
                                .FirstOrDefault();

                if (ser == null)
                {
                    throw new Exception("Tin tức này không tồn tại");
                }
                var serDTO = _mapper.Map<NewsDTO>(ser);

                return serDTO;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<NewsDTO> GetNews(int pageNumber)
        {
            try
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
                    throw new Exception("Không có tin tức");
                }

                var results = News.Select(_mapper.Map<News, NewsDTO>).ToList();

                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<NewsDTO> GetNewsByName(string keyword, int pageNumber)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    throw new Exception("Từ khóa tìm kiếm không được để trống");
                }

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
                .ToList();

                if (News == null || News.Count == 0)
                {
                    throw new Exception("Không có tin tức");
                }

                var totalNews = News.Count();

                var totalPages = (int)Math.Ceiling((double)totalNews / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                News = News
                .Skip((pageNumber - 1) * PageSize)
                .Take(PageSize)
                .ToList();

                var results = News.Select(_mapper.Map<News, NewsDTO>).ToList();

                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateNew(int id, NewsDTO newsDTO)
        {
            try
            {
                var New = _context.News.FirstOrDefault(o => o.Id == id);
                if (New == null)
                {
                    throw new Exception("Tin tức này không tồn tại");
                }
                try
                {
                    New.Tittle = newsDTO.Tittle;
                    New.Img = newsDTO.Img;
                    New.BriefInfo = newsDTO.BriefInfo;
                    New.Description = newsDTO.Description;
                    New.Author = newsDTO.Author;
                    New.DeleteFlag = newsDTO.DeleteFlag;
                    New.Featured = newsDTO.Featured;
                }
                catch (Exception ex)
                {
                    throw new Exception(" Cập nhật thất bại");
                }

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
