using AutoMapper;
using DentalClinicProject.Models;

namespace DentalClinicProject.DTO
{
    public class MyMapperProfile : Profile
    {
        public MyMapperProfile()
        {
            CreateMap<User, UserDTO>()
                .ForMember(dest => dest.RoleId, opt => opt.MapFrom(source => source.Role))
                .ForMember(dest => dest.RoleName, opt => opt.MapFrom(source => source.RoleNavigation.Name))
                ;
            CreateMap<Appointment, AppointmentDTO>()
                .ForMember(dest => dest.EmployeeName, opt => opt.MapFrom(source => source.Employee.Name))
                .ForMember(dest => dest.PatientName, opt => opt.MapFrom(source => source.Patient.Name))
                ;
            CreateMap<Prescription, PrescriptionDTO>()
                .ForMember(dest => dest.DoctorName, opt => opt.MapFrom(source => source.Doctor.Name))
                ;
            CreateMap<PrescriptionDetail, PrescriptionDetailDTO>()
                .ForMember(dest => dest.MedicineName, opt => opt.MapFrom(source => source.Medicine.Name))
                ;
            CreateMap<MedicalRecord, MedicalRecordDTO>()
                .ForMember(dest => dest.PatientName, opt => opt.MapFrom(source => source.Patient.Name))
                ;
            CreateMap<MedicalRecordDetail, MedicalRecordDetailDTO>()
                .ForMember(dest => dest.ServiceName, opt => opt.MapFrom(source => source.Service.ServiceName))
                ;
        }
    }
}
