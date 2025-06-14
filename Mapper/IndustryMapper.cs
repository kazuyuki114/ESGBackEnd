using ESGBackEnd.DTOs;
using ESGBackEnd.Models;

namespace ESGBackEnd.Mapper;

public static class IndustryMapper
{
    public static IndustryDTO ToIndustryDto(this Industry industry)
    {
        return new IndustryDTO
        {
            Id = industry.Id,
            Name = industry.Name,
            Code = industry.Code
        };
    }
}