using System.Security.Claims;
using System.Security.Cryptography;
using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace DentalClinicProject.Services.Implement
{
    public class UserService : IUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        IMapper _mapper;
        private readonly dentalContext _context;
        private readonly IConfiguration _configuration;
        public readonly int PageSize;
        public UserService(IHttpContextAccessor httpContextAccessor, dentalContext context, IMapper mapper, IConfiguration configuration)
        {
            _httpContextAccessor = httpContextAccessor;
            _context = context;
            _mapper = mapper;
            _configuration = configuration;
            PageSize = Convert.ToInt32(_configuration.GetValue<string>("AppSettings:PageSize"));
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return computedHash.SequenceEqual(passwordHash);
            }
        }

        public string GetMyName()
        {
            var result = string.Empty;
            if (_httpContextAccessor.HttpContext != null)
            {
                result = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.Name);
            }
            return result;
        }

        public void AddAreaOfExpertise(AreasOfExpertiseDTO areaOfExpertiseDTO)
        {
            try
            {
                var areaOfExpertise = new AreasOfExpertise
                {
                    EmployeeId = areaOfExpertiseDTO.EmployeeId,
                    Detail = areaOfExpertiseDTO.Detail
                };
                var user = _context.Users.FirstOrDefault(r => r.UserId == areaOfExpertise.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                _context.AreasOfExpertises.Add(areaOfExpertise);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void AddDegree(DegreeDTO degreeDTO)
        {
            try
            {
                var degree = new Degree
                {
                    EmployeeId = degreeDTO.EmployeeId,
                    Detail = degreeDTO.Detail
                };

                var user = _context.Users.FirstOrDefault(x => x.UserId == degree.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }

                _context.Degrees.Add(degree);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void AddForeignLanguage(ForeignLanguageDTO foreignLanguageDTO)
        {
            try
            {
                var foreignLanguage = new ForeignLanguage
                {
                    EmployeeId = foreignLanguageDTO.EmployeeId,
                    Detail = foreignLanguageDTO.Detail
                };
                var user = _context.Users.FirstOrDefault(r => r.UserId == foreignLanguage.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                _context.ForeignLanguages.Add(foreignLanguage);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void AddParticipatingTrainingCourse(ParticipatingTrainingCourseDTO participatingTrainingCourseDTO)
        {
            try
            {
                var participatingTrainingCourse = new ParticipatingTrainingCourse
                {
                    EmployeeId = participatingTrainingCourseDTO.EmployeeId,
                    Detail = participatingTrainingCourseDTO.Detail
                };
                var user = _context.Users.FirstOrDefault(r => r.UserId == participatingTrainingCourse.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                _context.ParticipatingTrainingCourses.Add(participatingTrainingCourse);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void AddUser(UserRegisterDTO userDTO)
        {
            try
            {
                CreatePasswordHash(userDTO.password, out byte[] passwordHash, out byte[] passwordSalt);

                var user = new User
                {
                    Name = userDTO.Name,
                    DateCreated = DateTime.Now,
                    Phone = userDTO.Phone,
                    Email = userDTO.Email,
                    Img = userDTO.Img,
                    Description = userDTO.Description,
                    Role = userDTO.RoleId,
                    PasswordHash = passwordHash,
                    PasswordSalt = passwordSalt,
                    DeleteFlag = false
                };
                _context.Users.Add(user);
                _context.SaveChanges();

                if(user.Role == 4) // role = 4 mean patient
                {
                    try
                    {
                        // add medical record when create account
                        var record = new MedicalRecord
                        {
                            PatientId = user.UserId,
                            DeleteFlag = false
                        };
                        _context.MedicalRecords.Add(record);
                        _context.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Thêm mới hồ sơ thất bại");
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void ChangeUserPassword(int id, string Oldpassword, string Newpassword)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(o => o.UserId == id);
                if (user == null)
                {
                    throw new Exception("Người dùng không tồn tại");
                }

               
                    if (!VerifyPasswordHash(Oldpassword, user.PasswordHash, user.PasswordSalt))
                    {
                        throw new Exception("Sai mật khẩu");
                    }
                    CreatePasswordHash(Newpassword, out byte[] passwordHash, out byte[] passwordSalt);
                    user.PasswordHash = passwordHash;
                    user.PasswordSalt = passwordSalt;
               
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteAreaOfExpertise(int id)
        {
            try
            {
                var areaOfExpertise = _context.AreasOfExpertises.FirstOrDefault(a => a.Id == id);
                if (areaOfExpertise == null)
                {
                    throw new Exception("Không tìm thấy kỹ năng chuyên môn");
                }

                _context.AreasOfExpertises.Remove(areaOfExpertise);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteDegree(int id)
        {
            try
            {
                var degree = _context.Degrees.FirstOrDefault(d => d.Id == id);
                if (degree == null)
                {
                    throw new Exception("Không tìm thấy degree");
                }

                _context.Degrees.Remove(degree);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteForeignLanguage(int id)
        {
            try
            {
                var foreignLanguage = _context.ForeignLanguages.FirstOrDefault(f => f.Id == id);
                if (foreignLanguage == null)
                {
                    throw new Exception("Không tìm thấy ngoại ngữ");
                }

                _context.ForeignLanguages.Remove(foreignLanguage);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteParticipatingTrainingCourse(int id)
        {
            try
            {
                var participatingTrainingCourse = _context.ParticipatingTrainingCourses.FirstOrDefault(p => p.Id == id);
                if (participatingTrainingCourse == null)
                {
                    throw new Exception("Không tìm thấy khóa đào tạo");
                }

                _context.ParticipatingTrainingCourses.Remove(participatingTrainingCourse);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void DeleteUser(int id)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(o => o.UserId == id);
                if (user == null)
                {
                    throw new Exception("Người dùng không tồn tại");
                }
                user.DeleteFlag = true;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public AreasOfExpertise GetAreasOfExpertise(int Id)
        {
            try
            {
                var AreasOfExpertises = _context.AreasOfExpertises
                        .FirstOrDefault(d => d.Id == Id);

                var user = _context.Users.FirstOrDefault(r => r.UserId == AreasOfExpertises.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }

                if (AreasOfExpertises == null)
                {
                    throw new Exception("Không có gi");
                }
                return AreasOfExpertises;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<AreasOfExpertise> GetAreasOfExpertisesByUserId(int userId)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(r => r.UserId == userId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                var AreasOfExpertises = _context.AreasOfExpertises
                        .Where(d => d.EmployeeId == userId)
                        .ToList();

                if (AreasOfExpertises == null || AreasOfExpertises.Count == 0)
                {
                    throw new Exception("Không có gi");
                }
                return AreasOfExpertises;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Degree GetDegree(int Id)
        {
            try
            {
                var degrees = _context.Degrees
                    .FirstOrDefault(x => x.Id == Id);

                return degrees;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<Degree> GetDegreesByUserId(int userId)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(x => x.UserId == userId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }

                var degrees = _context.Degrees
                    .Where(d => d.EmployeeId == userId)
                    .ToList();

                if (degrees == null || degrees.Count == 0)
                {
                    throw new Exception("Không có gi");
                }
                return degrees;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ForeignLanguage GetForeignLanguage(int Id)
        {
            try
            {
                var ForeignLanguages = _context.ForeignLanguages
                        .FirstOrDefault(d => d.Id == Id);
                var user = _context.Users.FirstOrDefault(r => r.UserId == ForeignLanguages.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                if (ForeignLanguages == null)
                {
                    throw new Exception("Không có gi");
                }
                return ForeignLanguages;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<ForeignLanguage> GetForeignLanguagesByUserId(int userId)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(r => r.UserId == userId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                var ForeignLanguages = _context.ForeignLanguages
                        .Where(d => d.EmployeeId == userId)
                        .ToList();

                if (ForeignLanguages == null || ForeignLanguages.Count == 0)
                {
                    throw new Exception("Không có gi");
                }
                return ForeignLanguages;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ParticipatingTrainingCourse GetParticipatingTrainingCourse(int Id)
        {
            try
            {
                var ParticipatingTrainingCourses = _context.ParticipatingTrainingCourses
                        .FirstOrDefault(d => d.Id == Id);
                var user = _context.Users.FirstOrDefault(r => r.UserId == ParticipatingTrainingCourses.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                if (ParticipatingTrainingCourses == null)
                {
                    throw new Exception("Không có gi");
                }
                return ParticipatingTrainingCourses;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<ParticipatingTrainingCourse> GetParticipatingTrainingCoursesByUserId(int userId)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(r => r.UserId == userId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }

                var ParticipatingTrainingCourses = _context.ParticipatingTrainingCourses
                        .Where(d => d.EmployeeId == userId)
                        .ToList();

                if (ParticipatingTrainingCourses == null || ParticipatingTrainingCourses.Count == 0)
                {
                    throw new Exception("Không có gi");
                }
                return ParticipatingTrainingCourses;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public object GetUser(int id)
        {
            try
            {
                var user = _context.Users
                   .Where(u => u.UserId == id)
                   .Select(u => new
                   {
                       User = new
                       {
                           u.UserId,
                           u.DateCreated,
                           u.Name,
                           u.Phone,
                           u.Email,
                           u.Img,
                           u.Description,
                           u.Salary,
                           u.Gender,
                           u.Dob,
                           u.Address,
                           u.DeleteFlag,
                           u.Role,
                           RoleName = u.RoleNavigation.Name
                       },
                       Degrees = u.Degrees.Select(d => new { d.Id, d.Detail }),
                       AreasOfExpertises = u.AreasOfExpertises.Select(a => new { a.Id, a.Detail }),
                       ForeignLanguages = u.ForeignLanguages.Select(f => new { f.Id, f.Detail }),
                       ParticipatingTrainingCourses = u.ParticipatingTrainingCourses.Select(p => new { p.Id, p.Detail })
                   })
                   .FirstOrDefault();
                if (user == null)
                {
                    throw new Exception("Không có gi");
                }
                return user;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<UserDTO> GetUsers(int pageNumber)
        {
            try
            {
                var totalUsers = _context.Users
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalUsers / PageSize);
                var getPageNumber = pageNumber;
                if (pageNumber <= 0) getPageNumber += 1;
                if (pageNumber > totalPages) getPageNumber = totalPages;

                List<User> users = _context.Users
                    .Include(r => r.RoleNavigation)
                    .Where(x => x.DeleteFlag == false)
                    .Skip((getPageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();
                if (users == null || users.Count == 0)
                {
                    throw new Exception("Không có dịch vụ");
                }
                //map
                List<UserDTO> results = new List<UserDTO>();
                results = users.Select(_mapper.Map<User, UserDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<UserDTO> GetUsersByName(string keyword, int pageNumber)
        {
            try
            {
                var totalUsers = _context.Users
                              .Count(s => s.DeleteFlag == false);

                var totalPages = (int)Math.Ceiling((double)totalUsers / PageSize);

                if (pageNumber <= 0) pageNumber = 1;
                if (pageNumber > totalPages) pageNumber = totalPages;

                var users = _context.Users
                    .Include(r => r.RoleNavigation)
                    .Where(s => s.Name.Contains(keyword) || s.Email.Contains(keyword) || s.Phone.Contains(keyword) && s.DeleteFlag == false)
                    .Skip((pageNumber - 1) * PageSize)
                    .Take(PageSize)
                    .ToList();

                if (users == null || users.Count == 0)
                {
                    throw new Exception("Không có dịch vụ nào phù hợp");
                }

                //map
                List<UserDTO> results = new List<UserDTO>();
                results = users.Select(_mapper.Map<User, UserDTO>).ToList();
                return results;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateAreaOfExpertise(int id, AreasOfExpertiseDTO updatedAreaOfExpertiseDTO)
        {
            try
            {
                var areaOfExpertise = _context.AreasOfExpertises.FirstOrDefault(a => a.Id == id);
                if (areaOfExpertise == null)
                {
                    throw new Exception("Không tìm thấy kỹ năng chuyên môn");
                }

                // Cập nhật thông tin kỹ năng chuyên môn
                areaOfExpertise.EmployeeId = updatedAreaOfExpertiseDTO.EmployeeId;
                areaOfExpertise.Detail = updatedAreaOfExpertiseDTO.Detail;
                var user = _context.Users.FirstOrDefault(r => r.UserId == areaOfExpertise.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateDegree(int id, DegreeDTO degreeDTO)
        {
            try
            {
                var degree = _context.Degrees.FirstOrDefault(d => d.Id == id);

                if (degree == null)
                {
                    throw new Exception("Không tìm thấy degree");
                }

                // Cập nhật thông tin degree
                degree.EmployeeId = degreeDTO.EmployeeId;
                degree.Detail = degreeDTO.Detail;
                var user = _context.Users.FirstOrDefault(x => x.UserId == degree.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateForeignLanguage(int id, ForeignLanguageDTO updatedForeignLanguageDTO)
        {
            try
            {
                var foreignLanguage = _context.ForeignLanguages.FirstOrDefault(f => f.Id == id);
                if (foreignLanguage == null)
                {
                    throw new Exception("Không tìm thấy ngoại ngữ");
                }

                // Cập nhật thông tin ngoại ngữ
                foreignLanguage.EmployeeId = updatedForeignLanguageDTO.EmployeeId;
                foreignLanguage.Detail = updatedForeignLanguageDTO.Detail;
                var user = _context.Users.FirstOrDefault(r => r.UserId == foreignLanguage.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateParticipatingTrainingCourse(int id, ParticipatingTrainingCourseDTO updatedParticipatingTrainingCourseDTO)
        {
            try
            {
                var participatingTrainingCourse = _context.ParticipatingTrainingCourses.FirstOrDefault(p => p.Id == id);
                if (participatingTrainingCourse == null)
                {
                    throw new Exception("Không tìm thấy khóa đào tạo");
                }
                var user = _context.Users.FirstOrDefault(r => r.UserId == participatingTrainingCourse.EmployeeId);
                if (user.Role != 3)
                {
                    throw new Exception("Người dùng không phải là bác sĩ");
                }
                // Cập nhật thông tin khóa đào tạo
                participatingTrainingCourse.EmployeeId = updatedParticipatingTrainingCourseDTO.EmployeeId;
                participatingTrainingCourse.Detail = updatedParticipatingTrainingCourseDTO.Detail;

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void UpdateUser(int id, UserDTO userDTO)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(o => o.UserId == id);
                if (user == null)
                {
                    throw new Exception("Không tìm thấy người dùng");
                }
                    user.Name = userDTO.Name;
                    user.Phone = userDTO.Phone;
                    user.Email = userDTO.Email;
                    user.Img = userDTO.Img;
                    user.Description = userDTO.Description;
                    user.Salary = userDTO.Salary;
                    user.Role = userDTO.RoleId;
                    user.DeleteFlag = userDTO.DeleteFlag;

                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
