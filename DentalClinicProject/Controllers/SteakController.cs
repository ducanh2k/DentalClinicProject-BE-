using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using WebApplication2.Models;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Reflection.Metadata;

namespace WebApplication2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SteakController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public SteakController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"SELECT 
      *
  FROM Users";
            DataTable dataTable = new DataTable();
            string sqlDataSource = _configuration.GetConnectionString("Steak_Shop");
            SqlDataReader myReader;
            using (SqlConnection sqlConnection = new SqlConnection(sqlDataSource))
            {
                sqlConnection.Open();
                using (SqlCommand mycmd = new SqlCommand(query, sqlConnection))
                {
                    myReader = mycmd.ExecuteReader();
                    dataTable.Load(myReader);
                    myReader.Close();
                    sqlConnection.Close();
                }
            }
            return new JsonResult(dataTable);
        }
        [HttpPost]
        public async Task<ActionResult<User>> Create(User u)
        {            
            try
            {

                User user = new User { 
                    Username = u.Username,
                    Password = u.Password,    
                    Role = u.Role,
                    Name = u.Name,
                    Email = u.Email,
                    Phone = u.Phone,
                    Address = u.Address,
                    NumberOfLogins = u.NumberOfLogins
                };
                Steak_ShopContext context = new Steak_ShopContext();
                context.Users.Add(user);
                context.SaveChanges();
                return Ok("Add user successful");
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError,
                   "Error retrieving data from the database");
            }
        }
        [HttpPut]
        public JsonResult Put(User u)
        {
            try
            {
                Steak_ShopContext context = new Steak_ShopContext();
                User user = context.Users.Find(u.Id);
                user.Username = u.Username;
                user.Password = u.Password;
                user.Role = u.Role;
                user.Name = u.Name;
                user.Email = u.Email;  
                user.Phone = u.Phone;
                user.Address = u.Address;
                user.NumberOfLogins = u.NumberOfLogins;
                context.SaveChanges();  
                return new JsonResult("Update successful");
            }
            catch (Exception e) {
                return new JsonResult(e);
            }
        }
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            Steak_ShopContext context = new Steak_ShopContext();
            User user = context.Users.Find(id);
            context.Users.Remove(user); 
            context.SaveChanges();
            return new JsonResult("Delete successful");
        }
    }
}



