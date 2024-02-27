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

        }
    }
}
