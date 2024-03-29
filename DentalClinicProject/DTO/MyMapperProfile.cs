﻿using AutoMapper;
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
                .ForMember(dest => dest.Gender, opt => opt.MapFrom(src => src.Gender.Value ? "Nam" : "Nữ"));
            ;
            CreateMap<Appointment, AppointmentDTO>()
                .ForMember(dest => dest.EmployeeName, opt => opt.MapFrom(source => source.Employee.Name))
                .ForMember(dest => dest.PatientName, opt => opt.MapFrom(source => source.Patient.Name))
                .ForMember(dest => dest.DoctorName, opt => opt.MapFrom(source => source.Doctor.Name))
                .ForMember(dest => dest.ServicePay, opt => opt.MapFrom(source => source.MedicalRecordDetail.Service.Price))
                .ForMember(dest => dest.ServiceName, opt => opt.MapFrom(source => source.MedicalRecordDetail.Service.ServiceName))
                .ForMember(dest => dest.PrescriptionId, opt => opt.MapFrom(source => source.MedicalRecordDetail.PrescriptionId))
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
            CreateMap<News, NewsDTO>()
                .ForMember(dest => dest.AuthorName, opt => opt.MapFrom(source => source.AuthorNavigation.Name))
                ;
            CreateMap<Comment, CommentDTO>()
                .ForMember(dest => dest.PatientName, opt => opt.MapFrom(source => source.Patient.Name))
                .ForMember(dest => dest.DoctorName, opt => opt.MapFrom(source => source.Doctor.Name))
                ;
            CreateMap<Invoice, InvoiceDTO>()
                .ForMember(dest => dest.CustomerName, opt => opt.MapFrom(source => source.Customer.Name))
                .ForMember(dest => dest.StaffName, opt => opt.MapFrom(source => source.Staff.Name))
                .ForMember(dest => dest.PaymentType, opt => opt.MapFrom(source => source.Payment.PaymentName))
                ;
            CreateMap<Invoice, InvoiceImportDTO>()
                .ForMember(dest => dest.CustomerName, opt => opt.MapFrom(source => source.Customer.Name))
                .ForMember(dest => dest.PaymentType, opt => opt.MapFrom(source => source.Payment.PaymentName))
                ;
            CreateMap<InvoiceLine, InvoiceLineDTO>()
                .ForMember(dest => dest.ServiceName, opt => opt.MapFrom(source => source.Service.ServiceName))
                ;
            CreateMap<InvoiceLine, InvoiceLineImportDTO>()
                .ForMember(dest => dest.MaterialName, opt => opt.MapFrom(source => source.Material.MaterialName))
                ;
        }
    }
}
