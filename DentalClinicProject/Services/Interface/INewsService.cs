using DentalClinicProject.DTO;
using DentalClinicProject.Models;

namespace DentalClinicProject.Services.Interface
{
    public interface INewsService
    {
        List<NewsDTO> GetNews(int pageNumber);
        List<NewsDTO> GetNewsByName(string keyword, int pageNumber);
        NewsDTO GetNew(int id);
        void AddNew(NewsDTO newsDTO);
        void UpdateNew(int id, NewsDTO newsDTO);
        void DeleteNew(int id);    
    }
}
