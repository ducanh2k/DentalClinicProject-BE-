using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;
using System.Xml.Linq;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace DentalClinicProject.Services.Implement
{
    public class CommentService : ICommentService
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;

        public CommentService(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        public void AddComment(CommentDTO CommentDTO)
        {
            try
            {
                var cmt = new Comment
                {
                    CommentDetail = CommentDTO.CommentDetail,
                    PatientId = CommentDTO.PatientId,
                    DoctorId = CommentDTO.DoctorId,
                    RatingStar = CommentDTO.RatingStar,
                    CreatedAt = DateTime.Now,
                    DeleteFlag = false,
                };
                _context.Comments.Add(cmt);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteComment(int id)
        {
            try
            {
                var Comment = _context.Comments.FirstOrDefault(o => o.Id == id);
                if (Comment == null)
                {
                    throw new Exception("Phản hồi không tồn tại");
                }
                Comment.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<CommentDTO> GetAllComments(int pageNumber, int type) //type: 1= all,2= dental,3= doctor feedback
        {
            try
            {
                IQueryable<Comment> query = _context.Comments
                .Include(a => a.Patient)
                .Include(a => a.Doctor)
                .Where(s => s.DeleteFlag == false)
                .OrderByDescending(a => a.CreatedAt);

                switch (type)
                {
                    case 2:
                        query = query.Where(c => c.DoctorId == null);
                        break;
                    case 3:
                        query = query.Where(c => c.DoctorId != null);
                        break;
                    case 1:
                        // All comments are included by default, so no filtering needed.
                        break;
                }

                var Comments = query.ToList();

                if (Comments == null || Comments.Count == 0)
                {
                    throw new Exception("Không có phản hồi nào");
                }

                var totalComment = Comments.Count();
                var totalPages = (int)Math.Ceiling((double)totalComment / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;

                Comments = query
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                var results = Comments.Select(_mapper.Map<Comment, CommentDTO>).ToList();

                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public CommentDTO GetCommentById(int id)
        {
            try
            {
                var ser = _context.Comments
                .Where(x => x.Id == id)
                .Include(a => a.Patient)
                .Include(d => d.Doctor)
                .FirstOrDefault();

                if (ser == null)
                {
                    throw new Exception("Phản hồi không tồn tại");
                }
                var serDTO = _mapper.Map<CommentDTO>(ser);
                return serDTO;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<CommentDTO> GetCommentsByDoctor(int pageNumber, int doctorId)
        {
            try
            {
                var Comments = _context.Comments
                .Include(a => a.Patient)
                            .Where(s =>
                            s.DoctorId == doctorId
                            && s.DeleteFlag == false)
                            .OrderByDescending(a => a.CreatedAt).ToList();

                if (Comments == null || Comments.Count == 0)
                {
                    throw new Exception("Không có phản hồi nào");
                }

                var totalComment = Comments.Count();

                var totalPages = (int)Math.Ceiling((double)totalComment / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                Comments = Comments.Skip((pageNumber - 1) * PageSize)
                            .Take(PageSize)
                            .ToList();

                var results = Comments.Select(_mapper.Map<Comment, CommentDTO>).ToList();

                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<CommentDTO> GetCommentsByName(string keyword, int pageNumber)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    throw new Exception("Từ khóa tìm kiếm không được để trống");
                }

                var Comments = _context.Comments
                            .Include(a => a.Patient)
                            .Where(s =>
                            s.CommentDetail.Contains(keyword) ||
                            s.Patient.Name.Contains(keyword) ||
                            s.Doctor.Name.Contains(keyword)
                            && s.DeleteFlag == false)
                            .OrderByDescending(a => a.CreatedAt).ToList();

                if (Comments == null || Comments.Count == 0)
                {
                    throw new Exception("Không có phản hồi nào");
                }

                var totalComment = Comments.Count();

                var totalPages = (int)Math.Ceiling((double)totalComment / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;
                Comments = Comments.Skip((pageNumber - 1) * PageSize)
                            .Take(PageSize)
                            .ToList();

                var results = Comments.Select(_mapper.Map<Comment, CommentDTO>).ToList();

                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateComment(int id, CommentDTO CommentDTO)
        {
            try
            {
                var Comment = _context.Comments.FirstOrDefault(o => o.Id == id);
                if (Comment == null)
                {
                    throw new Exception("Phản hồi không tồn tại");
                }
                Comment.CommentDetail = CommentDTO.CommentDetail;
                Comment.PatientId = CommentDTO.PatientId;
                Comment.DeleteFlag = CommentDTO.DeleteFlag;
                Comment.DoctorId = CommentDTO.DoctorId;
                Comment.RatingStar = CommentDTO.RatingStar;

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
