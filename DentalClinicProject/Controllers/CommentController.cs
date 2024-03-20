using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Xml.Linq;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {
        private readonly ICommentService commentService;

        public CommentController(ICommentService _commentService)
        {
            commentService = _commentService;
        }

        [HttpGet("list")]
        public IActionResult GetAllComments(int pageNumber, int type) //type: 1= all,2= dental,3= doctor feedback
        {
            try
            {
                var results = commentService.GetAllComments(pageNumber,type);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }


        [HttpGet("search")]
        public IActionResult GetCommentsByName(string keyword, int pageNumber)
        {
            try
            {
                var results = commentService.GetCommentsByName(keyword,pageNumber);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("list/{doctorId}")]
        public IActionResult GetCommentsByDoctor(int pageNumber, int doctorId)
        {
            try
            {
                var results = commentService.GetCommentsByDoctor(pageNumber, doctorId);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpGet("{id}")]
        public IActionResult GetComment(int id)
        {
            try
            {
                var results = commentService.GetCommentById(id);
                return Ok(results);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public IActionResult AddComment(CommentDTO CommentDTO)
        {
            try
            {
                commentService.AddComment(CommentDTO);
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
            try
            {
                commentService.UpdateComment(id, CommentDTO);
            }
            catch (Exception ex)
            {
                return BadRequest(" Cập nhật thất bại");
            }

            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteComment(int id)
        {
            try
            {
                commentService.DeleteComment(id);
            }
            catch (Exception ex)
            {
                return BadRequest(" Cập nhật thất bại");
            }

            return NoContent();
        }
    }
}
