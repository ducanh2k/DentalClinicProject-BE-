using DentalClinicProject.DTO;

namespace DentalClinicProject.Services.Interface
{
    public interface ICommentService
    {
        List<CommentDTO> GetAllComments(int pageNumber, int type);//type: 1= all,2= dental,3= doctor feedback
        List<CommentDTO> GetCommentsByDoctor(int pageNumber, int doctorId);
        CommentDTO GetCommentById(int id);
        List<CommentDTO> GetCommentsByName(string keyword, int pageNumber);
        void AddComment(CommentDTO CommentDTO);

        void UpdateComment(int id, CommentDTO CommentDTO);
        void DeleteComment(int id);
    }
}
