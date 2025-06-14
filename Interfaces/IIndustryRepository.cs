using ESGBackEnd.DTOs;
using ESGBackEnd.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ESGBackEnd.DTOs.Pagination;

namespace ESGBackEnd.Interfaces
{
    public interface IIndustryRepository
    {
        // Create
        Task<Industry> CreateIndustryAsync(Industry industry);
        
        // Read
        Task<PagedResponse<Industry>> GetIndustriesAsync(PaginationParameters parameters);
        Task<Industry> GetIndustryByIdAsync(Guid id);
        Task<Industry> GetIndustryByCodeAsync(string code);
        
        // Update
        Task<Industry> UpdateIndustryAsync(Industry industry);
        
        // Delete
        Task<bool> DeleteIndustryAsync(Guid id);
        
        // Count
        Task<int> CountIndustriesAsync();
    }
}