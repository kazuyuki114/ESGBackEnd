using ESGBackEnd.DTOs;
using ESGBackEnd.Models;

namespace ESGBackEnd.Mapper
{
    public static class CompanyMapper
    {
        public static CompanyDTO ToCompanyDto(this Company company, Industry? industry)
        {
            if (industry == null)
            {
                throw new ArgumentNullException(nameof(industry));
            }
            return new CompanyDTO
            {
                Id = company.Id,
                Name = company.Name,
                Slug = company.Slug,
                IndustryId = company.IndustryId,
                IsVerified = company.IsVerified,
                Status = company.Status,
                CreatedAt = company.CreatedAt,
                UpdatedAt = company.UpdatedAt,
                Email = company.Email,
                Phone = company.Phone,
                IndustryName = industry?.Name,
                IndustryCode = industry?.Code

            };
        }
    }
}