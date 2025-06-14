using ESGBackEnd.DTOs;
using ESGBackEnd.DTOs.Pagination;
using ESGBackEnd.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ESGBackEnd.Interfaces
{
    public interface IReportSubmissionRepository
    {
        // Create
        Task<ReportSubmission> CreateReportSubmissionAsync(ReportSubmission reportSubmission);
        
        // Read
        Task<PagedResponse<ReportSubmissionDTO>> GetReportSubmissionsAsync(PaginationParameters parameters);
        Task<ReportSubmissionDTO?> GetReportSubmissionByIdAsync(Guid id);
        Task<List<ReportSubmissionDTO>> GetReportSubmissionsByCompanyIdAsync(Guid companyId);
        Task<List<ReportSubmissionDTO>> GetReportSubmissionsByYearAsync(int year);
        
        // Update
        Task<ReportSubmission> UpdateReportSubmissionAsync(ReportSubmission reportSubmission);
        
        // Delete
        Task<bool> DeleteReportSubmissionAsync(Guid id);
        
        // Count
        Task<int> CountReportSubmissionsAsync();
    }
} 