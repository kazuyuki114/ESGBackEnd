using ESGBackEnd.DTOs;
using ESGBackEnd.DTOs.Pagination;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Mapper;
using ESGBackEnd.Models;

namespace ESGBackEnd.Repositories
{
    public class ReportSubmissionRepository : IReportSubmissionRepository
    {
        private readonly Supabase.Client _client;
        private readonly ILogger<ReportSubmissionRepository> _logger;
        private readonly ICompanyRepository _companyRepository;

        public ReportSubmissionRepository(
            Supabase.Client client,
            ILogger<ReportSubmissionRepository> logger,
            ICompanyRepository companyRepository)
        {
            _client = client ?? throw new ArgumentNullException(nameof(client));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _companyRepository = companyRepository ?? throw new ArgumentNullException(nameof(companyRepository));
        }

        // Create
        public async Task<ReportSubmission> CreateReportSubmissionAsync(ReportSubmission reportSubmission)
        {
            var response = await _client.From<ReportSubmission>().Insert(reportSubmission);
            return response.Models.FirstOrDefault() ?? throw new InvalidOperationException();
        }

        // Read
        public async Task<PagedResponse<ReportSubmissionDTO>> GetReportSubmissionsAsync(PaginationParameters parameters)
        {
            var totalCount = await CountReportSubmissionsAsync();

            var response = await _client.From<ReportSubmission>()
                .Range((parameters.PageNumber - 1) * parameters.PageSize,
                       (parameters.PageNumber * parameters.PageSize) - 1)
                .Get();

            var reportSubmissions = response.Models;

            // Convert to DTOs with company information
            var reportSubmissionDTOs = new List<ReportSubmissionDTO>();
            foreach (var submission in reportSubmissions)
            {
                // Get company information
                var companyResponse = await _client.From<Company>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, submission.CompanyId.ToString())
                    .Get();
                var company = companyResponse.Models.FirstOrDefault();

                reportSubmissionDTOs.Add(submission.ToReportSubmissionDto());
            }

            return new PagedResponse<ReportSubmissionDTO>(
                reportSubmissionDTOs,
                totalCount,
                parameters.PageNumber,
                parameters.PageSize
            );
        }

        public async Task<ReportSubmissionDTO?> GetReportSubmissionByIdAsync(Guid id)
        {
            try
            {
                var response = await _client.From<ReportSubmission>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Get();

                var submission = response.Models.FirstOrDefault();
                if (submission == null)
                    throw new InvalidOperationException($"Report submission with ID {id} not found");

                // Get company information
                var companyResponse = await _client.From<Company>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, submission.CompanyId.ToString())
                    .Get();
                var company = companyResponse.Models.FirstOrDefault();

                return submission.ToReportSubmissionDto();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting report submission with ID {id}");
                throw;
            }
        }

        public async Task<List<ReportSubmissionDTO>> GetReportSubmissionsByCompanyIdAsync(Guid companyId)
        {
            try
            {
                var response = await _client.From<ReportSubmission>()
                    .Filter("company_id", Supabase.Postgrest.Constants.Operator.Equals, companyId.ToString())
                    .Get();

                var submissions = response.Models;

                // Get company information
                var companyResponse = await _client.From<Company>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, companyId.ToString())
                    .Get();
                var company = companyResponse.Models.FirstOrDefault();

                return submissions.Select(s => s.ToReportSubmissionDto()).ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting report submissions for company ID {companyId}");
                throw;
            }
        }

        public async Task<List<ReportSubmissionDTO>> GetReportSubmissionsByYearAsync(int year)
        {
            try
            {
                var response = await _client.From<ReportSubmission>()
                    .Filter("year", Supabase.Postgrest.Constants.Operator.Equals, year.ToString())
                    .Get();

                var submissions = response.Models;

                // Convert to DTOs with company information
                var submissionDTOs = new List<ReportSubmissionDTO>();
                foreach (var submission in submissions)
                {
                    var companyResponse = await _client.From<Company>()
                        .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, submission.CompanyId.ToString())
                        .Get();
                    var company = companyResponse.Models.FirstOrDefault();

                    submissionDTOs.Add(submission.ToReportSubmissionDto());
                }

                return submissionDTOs;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting report submissions for year {year}");
                throw;
            }
        }

        // Update
        public async Task<ReportSubmission> UpdateReportSubmissionAsync(ReportSubmission reportSubmission)
        {
            try
            {
                var response = await _client.From<ReportSubmission>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, reportSubmission.Id.ToString())
                    .Update(reportSubmission);

                return response.Models.FirstOrDefault() ??
                    throw new InvalidOperationException($"Failed to update report submission with ID {reportSubmission.Id}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error updating report submission with ID {reportSubmission.Id}");
                throw;
            }
        }

        // Delete
        public async Task<bool> DeleteReportSubmissionAsync(Guid id)
        {
            try
            {
                await GetReportSubmissionByIdAsync(id);

                await _client.From<ReportSubmission>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Delete();

                return true;
            }
            catch (Exception)
            {
                _logger.LogError($"Failed to delete report submission with ID {id}");
                return false;
            }
        }

        // Count
        public async Task<int> CountReportSubmissionsAsync()
        {
            var response = await _client.From<ReportSubmission>().Count(Supabase.Postgrest.Constants.CountType.Exact);
            return response;
        }
    }
}