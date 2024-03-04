﻿using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        private readonly int PageSize;

        public CommentController(dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        [HttpGet("list")]
        public IActionResult GetComments(int pageNumber)
        {
            var totalComment = _context.Comments
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalComment / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var Comments = _context.Comments
                        .Include(a => a.Patient)
                        .Where(s => s.DeleteFlag == false)
                        .OrderByDescending(a => a.CreatedAt)
                        .Skip((pageNumber - 1) * PageSize)
                        .Take(PageSize)
                        .ToList();

            if (Comments == null || Comments.Count == 0)
            {
                return NotFound("Không có");
            }

            var results = Comments.Select(_mapper.Map<Comment, CommentDTO>).ToList();

            return Ok(results);
        }

        [HttpGet("search")]
        public IActionResult GetCommentsByName(string keyword, int pageNumber)
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return BadRequest("Từ khóa tìm kiếm không được để trống");
            }

            var totalComment = _context.Comments
                              .Count(s => s.DeleteFlag == false);

            var totalPages = (int)Math.Ceiling((double)totalComment / PageSize);

            if (pageNumber <= 0) pageNumber = 1;
            if (pageNumber > totalPages) pageNumber = totalPages;
            var Comments = _context.Comments
                        .Include(a => a.Patient)
                        .Where(s =>
                        s.CommentDetail.Contains(keyword) ||
                        s.Patient.Name.Contains(keyword) 
                        && s.DeleteFlag == false)
                        .OrderByDescending(a => a.CreatedAt)
                        .Skip((pageNumber - 1) * PageSize)
                        .Take(PageSize)
                        .ToList();

            if (Comments == null || Comments.Count == 0)
            {
                return NotFound("Không có ");
            }

            var results = Comments.Select(_mapper.Map<Comment, CommentDTO>).ToList();

            return Ok(results);
        }


        [HttpGet("{id}")]
        public IActionResult GetComment(int id)
        {
            var ser = _context.Comments
                .Where(x => x.Id == id)
                .Include(a => a.Patient)
                .FirstOrDefault();

            if (ser == null)
            {
                return NotFound("Không có");
            }
            var serDTO = _mapper.Map<CommentDTO>(ser);

            return Ok(serDTO);
        }


        [HttpPost]
        public IActionResult AddComment(CommentDTO CommentDTO)
        {
            var cmt = new Comment
            {
                CommentDetail = CommentDTO.CommentDetail,
                PatientId = CommentDTO.PatientId,
                CreatedAt = DateTime.Now,
                DeleteFlag = false,
            };
            try
            {
                _context.Comments.Add(cmt);
                _context.SaveChanges();
                return Ok("Thêm mới thành công");
            }
            catch (Exception ex)
            {
                return BadRequest("Thêm mới thất bại");
            }
        }

        [HttpPut("{id}")]
        public ActionResult UpdateComment(int id, CommentDTO CommentDTO)
        {
            var Comment = _context.Comments.FirstOrDefault(o => o.Id == id);
            if (Comment == null)
            {
                return NotFound();
            }
            try
            {
                Comment.CommentDetail = CommentDTO.CommentDetail;
                Comment.PatientId = CommentDTO.PatientId;
                Comment.DeleteFlag = CommentDTO.DeleteFlag;
            }
            catch (Exception ex)
            {
                return BadRequest(" Cập nhật thất bại");
            }

            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteComment(int id)
        {
            var Comment = _context.Comments.FirstOrDefault(o => o.Id == id);
            if (Comment == null)
            {
                return NotFound();
            }
            Comment.DeleteFlag = true;
            _context.SaveChanges();
            return NoContent();
        }
    }
}
