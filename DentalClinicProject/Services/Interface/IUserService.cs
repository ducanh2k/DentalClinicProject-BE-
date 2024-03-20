using DentalClinicProject.DTO;
using DentalClinicProject.Models;

namespace DentalClinicProject.Services.Interface
{
    public interface IUserService
    {
        string GetMyName();
        List<UserDTO> GetUsers(int pageNumber);
        List<UserDTO> GetUsersByName(string keyword, int pageNumber);
        object GetUser(int id);
        void AddUser(UserRegisterDTO userDTO);
        void UpdateUser(int id, UserDTO userDTO);
        void ChangeUserPassword(int id, string Oldpassword, string Newpassword);
        void DeleteUser(int id);
        List<Degree> GetDegreesByUserId(int userId);
        Degree GetDegree(int Id);
        void AddDegree(DegreeDTO degreeDTO);
        void UpdateDegree(int id, DegreeDTO degreeDTO);
        void DeleteDegree(int id);
        List<AreasOfExpertise> GetAreasOfExpertisesByUserId(int userId);
        AreasOfExpertise GetAreasOfExpertise(int Id);
        void AddAreaOfExpertise(AreasOfExpertiseDTO areaOfExpertiseDTO);
        void UpdateAreaOfExpertise(int id, AreasOfExpertiseDTO updatedAreaOfExpertiseDTO);
        void DeleteAreaOfExpertise(int id);
        List<ForeignLanguage> GetForeignLanguagesByUserId(int userId);
        ForeignLanguage GetForeignLanguage(int Id);
        void AddForeignLanguage(ForeignLanguageDTO foreignLanguageDTO);
        void UpdateForeignLanguage(int id, ForeignLanguageDTO updatedForeignLanguageDTO);
        void DeleteForeignLanguage(int id);
        List<ParticipatingTrainingCourse> GetParticipatingTrainingCoursesByUserId(int userId);
        ParticipatingTrainingCourse GetParticipatingTrainingCourse(int Id);
        void AddParticipatingTrainingCourse(ParticipatingTrainingCourseDTO participatingTrainingCourseDTO);
        void UpdateParticipatingTrainingCourse(int id, ParticipatingTrainingCourseDTO updatedParticipatingTrainingCourseDTO);
        void DeleteParticipatingTrainingCourse(int id);
    }
}
