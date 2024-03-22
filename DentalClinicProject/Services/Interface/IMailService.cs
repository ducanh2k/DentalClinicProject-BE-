using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.Extensions.Options;
using System.Net.Mail;

namespace DentalClinicProject.Services.Interface
{
    public interface IMailService
    {
        bool SendMail(UserLoginDTO user);
    }
}
