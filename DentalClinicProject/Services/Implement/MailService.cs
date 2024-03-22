using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Interface;
using MailKit.Net.Smtp;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using MimeKit;


namespace DentalClinicProject.Services.Implement
{
    public class MailService : IMailService
    {
        private readonly dentalContext _context;
        private readonly MailSettings _mailSettings;

        //injection MailSetting vào lớp này để dùng
        public MailService(IOptions<MailSettings> mailSettingsOptions, dentalContext context)
        {
            _mailSettings = mailSettingsOptions.Value;
            _context = context; 
        }
        // xử lý gửi mail
        public bool SendMail(UserLoginDTO request)
        {
            //Tạo 1 đối tượng MimeMessage dùng xong thì tự hủy
            using (MimeMessage emailMessage = new MimeMessage())
            {

                var user = _context.Users.Include(u => u.RoleNavigation)
                           .FirstOrDefault(o => o.Email == request.Email);
                if (user == null || user.Email != request.Email)
                {
                    return false;
                }

                string newPassword = user.GenerateRandomPassword();

                MailData mailData = new MailData();
                mailData.ReceiverEmail = user.Email;
                mailData.ReceiverName = user.Name != null ? user.Name : "Người dùng";
                mailData.Title = "Thay đổi mật khẩu";
                mailData.Body = $"Mật khẩu của bạn đã được đổi thành: {newPassword}";

                MailboxAddress emailFrom = new MailboxAddress(_mailSettings.SenderName, _mailSettings.SenderEmail);
               
                emailMessage.From.Add(emailFrom);
               
                MailboxAddress emailTo = new MailboxAddress(mailData.ReceiverName, mailData.ReceiverEmail);
               
                emailMessage.To.Add(emailTo);
                
                emailMessage.Subject = mailData.Title;
               
                BodyBuilder emailBodyBuilder = new BodyBuilder();
                emailBodyBuilder.TextBody = mailData.Body;
                
                emailMessage.Body = emailBodyBuilder.ToMessageBody();
              
                using (SmtpClient mailClient = new SmtpClient())
                {
                    //Kết nối tới server smtp.gmail
                    mailClient.Connect(_mailSettings.Server, _mailSettings.Port, MailKit.Security.SecureSocketOptions.StartTls);
                    //đăng nhập
                    mailClient.Authenticate(_mailSettings.SenderEmail, _mailSettings.Password);
                    //gửi mail
                    mailClient.Send(emailMessage);
                    //ngắt kết nối
                    mailClient.Disconnect(true);
                }
            }
            return true;
        }

       
    }
}
