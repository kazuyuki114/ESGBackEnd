using ESGBackEnd.DTOs;
using ESGBackEnd.DTOs.Pagination;
using ESGBackEnd.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ESGBackEnd.Interfaces
{
    public interface ICompanyRepository
    {
        // Create
        Task<Company> CreateCompanyAsync(Company company);
        
        // Read
        Task<PagedResponse<CompanyDTO>> GetCompaniesAsync(PaginationParameters parameters);
        Task<CompanyDTO?> GetCompanyByIdAsync(Guid id);
        Task<List<CompanyDTO>> GetCompaniesByIndustryIdAsync(Guid industryId);
        
        // Update
        Task<Company> UpdateCompanyAsync(Company company);
        
        // Delete
        Task<bool> DeleteCompanyAsync(Guid id);
        
        // Count
        Task<int> CountCompaniesAsync();
    }
}