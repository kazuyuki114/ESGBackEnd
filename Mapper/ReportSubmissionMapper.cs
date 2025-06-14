using ESGBackEnd.DTOs;
using ESGBackEnd.Models;

namespace ESGBackEnd.Mapper
{
    public static class ReportSubmissionMapper
    {
        public static ReportSubmission ToModel(this CreateReportSubmissionDTO createDto)
        {
            return new ReportSubmission
            {
                Id = Guid.NewGuid(),
                CompanyId = createDto.CompanyId,
                Title = createDto.Title,
                Year = createDto.Year,
                FileUrl = createDto.FileUrl,
                FileSize = createDto.FileSize,
                Status = createDto.Status,
                SubmittedAt = DateTime.UtcNow
            };
        }

        public static ReportSubmission ToModel(this UpdateReportSubmissionDTO updateDto)
        {
            return new ReportSubmission
            {
                Id = updateDto.Id,
                CompanyId = updateDto.CompanyId,
                Title = updateDto.Title,
                Year = updateDto.Year,
                FileUrl = updateDto.FileUrl,
                FileSize = updateDto.FileSize,
                Status = updateDto.Status,
                SubmittedAt = updateDto.SubmittedAt
            };
        }

        public static ReportSubmissionDTO ToReportSubmissionDto(this ReportSubmission reportSubmission)
        {
            return new ReportSubmissionDTO
            {
                Id = reportSubmission.Id,
                CompanyId = reportSubmission.CompanyId,
                Title = reportSubmission.Title,
                Year = reportSubmission.Year,
                FileUrl = reportSubmission.FileUrl,
                FileSize = reportSubmission.FileSize,
                Status = reportSubmission.Status,
                SubmittedAt = reportSubmission.SubmittedAt,
            };
        }

        public static ReportSubmissionDTO ToDto(this ReportSubmission reportSubmission)
        {
            return reportSubmission.ToReportSubmissionDto();
        }
    }
}