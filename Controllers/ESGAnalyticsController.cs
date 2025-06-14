using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;
using Microsoft.AspNetCore.Mvc;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ESGAnalyticsController : ControllerBase
    {
        private readonly ICompanyRepository _companyRepository;
        private readonly IReportSubmissionRepository _reportSubmissionRepository;
        private readonly IAIEvaluationRepository _aiEvaluationRepository;
        private readonly IESGScoreRepository _esgScoreRepository;
        private readonly IEvaluationMetricRepository _evaluationMetricRepository;
        private readonly ILogger<ESGAnalyticsController> _logger;

        public ESGAnalyticsController(
            ICompanyRepository companyRepository,
            IReportSubmissionRepository reportSubmissionRepository,
            IAIEvaluationRepository aiEvaluationRepository,
            IESGScoreRepository esgScoreRepository,
            IEvaluationMetricRepository evaluationMetricRepository,
            ILogger<ESGAnalyticsController> logger)
        {
            _companyRepository = companyRepository;
            _reportSubmissionRepository = reportSubmissionRepository;
            _aiEvaluationRepository = aiEvaluationRepository;
            _esgScoreRepository = esgScoreRepository;
            _evaluationMetricRepository = evaluationMetricRepository;
            _logger = logger;
        }

        // GET: api/esganalytics/company/{companyId}/latest
        [HttpGet("company/{companyId}/latest")]
        public async Task<IActionResult> GetCompanyLatestESGData(Guid companyId)
        {
            try
            {
                // Get company info
                var company = await _companyRepository.GetCompanyByIdAsync(companyId);
                if (company == null)
                {
                    return NotFound($"Company with ID {companyId} not found");
                }

                // Get the most recent report submission for this company
                var reportSubmissions = await _reportSubmissionRepository.GetReportSubmissionsByCompanyIdAsync(companyId);
                var latestReport = reportSubmissions
                    .OrderByDescending(r => r.SubmittedAt)
                    .FirstOrDefault();

                if (latestReport == null)
                {
                    return NotFound($"No report submissions found for company {company.Name}");
                }

                // Get AI evaluations for the latest report
                var aiEvaluations = await _aiEvaluationRepository.GetAIEvaluationsBySubmissionIdAsync(latestReport.Id);
                var latestAIEvaluation = aiEvaluations
                    .OrderByDescending(ae => ae.EvaluatedAt)
                    .FirstOrDefault();

                if (latestAIEvaluation == null)
                {
                    return NotFound($"No AI evaluations found for the latest report of company {company.Name}");
                }

                // Get ESG score and evaluation metrics for the latest AI evaluation
                var esgScore = await _esgScoreRepository.GetESGScoreByIdAsync(latestAIEvaluation.Id);
                var evaluationMetric = await _evaluationMetricRepository.GetEvaluationMetricByIdAsync(latestAIEvaluation.Id);

                var result = new
                {
                    Company = new
                    {
                        company.Id,
                        company.Name,
                        company.Email,
                        company.Status,
                        company.IsVerified,
                        company.IndustryName,
                        company.IndustryCode
                    },
                    LatestReport = new
                    {
                        latestReport.Id,
                        latestReport.Title,
                        latestReport.Year,
                        latestReport.Status,
                        latestReport.SubmittedAt
                    },
                    AIEvaluation = new
                    {
                        latestAIEvaluation.Id,
                        latestAIEvaluation.Recommendations,
                        latestAIEvaluation.KeyFindings,
                        latestAIEvaluation.EvaluatedAt
                    },
                    ESGScore = esgScore != null ? new
                    {
                        esgScore.Id,
                        esgScore.OverallScore,
                        esgScore.EnvironmentalScore,
                        esgScore.SocialScore,
                        esgScore.GovernanceScore,
                        esgScore.IsVerified,
                        esgScore.VerifiedBy,
                        esgScore.VerificationDate
                    } : null,
                    EvaluationMetrics = evaluationMetric != null ? new
                    {
                        evaluationMetric.Id,
                        Environmental = new
                        {
                            evaluationMetric.EnvClimateAction,
                            evaluationMetric.EnvEnergyTransition,
                            evaluationMetric.EnvWaterStewardship,
                            evaluationMetric.EnvBiodiversityNature,
                            evaluationMetric.EnvPollutionPrevention,
                            evaluationMetric.EnvCircularEconomy,
                            evaluationMetric.EnvSustainablePractices
                        },
                        Social = new
                        {
                            evaluationMetric.SocialDiversityInclusion,
                            evaluationMetric.SocialWorkforceDevelopment,
                            evaluationMetric.SocialHealthSafety,
                            evaluationMetric.SocialHumanRights,
                            evaluationMetric.SocialCommunityEngagement,
                            evaluationMetric.SocialCustomerStakeholder,
                            evaluationMetric.SocialFinancialInclusion
                        },
                        Governance = new
                        {
                            evaluationMetric.GovCorporateGovernance,
                            evaluationMetric.GovEthicsIntegrity,
                            evaluationMetric.GovTransparencyDisclosure,
                            evaluationMetric.GovRiskManagement,
                            evaluationMetric.GovComplianceLegal,
                            evaluationMetric.GovStakeholderRelations,
                            evaluationMetric.GovInnovationTechnology,
                            evaluationMetric.GovCybersecurityData
                        }
                    } : null
                };

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error retrieving latest ESG data for company {companyId}");
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // GET: api/esganalytics/ranking
        [HttpGet("ranking")]
        public async Task<IActionResult> GetESGRanking(
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            try
            {
                if (page < 1) page = 1;
                if (pageSize < 1 || pageSize > 100) pageSize = 10;

                // Get all companies by fetching all pages
                var allCompanies = new List<CompanyDTO>();
                var currentPage = 1;
                var companiesPerPage = 100; // Use larger page size for internal fetching

                while (true)
                {
                    var paginationParams = new PaginationParameters
                    {
                        PageNumber = currentPage,
                        PageSize = companiesPerPage
                    };

                    var pagedCompanies = await _companyRepository.GetCompaniesAsync(paginationParams);
                    allCompanies.AddRange(pagedCompanies.Data);

                    // Break if we've fetched all companies
                    if (pagedCompanies.Data.Count < companiesPerPage)
                        break;

                    currentPage++;
                }

                var companyRankings = new List<object>();

                foreach (var company in allCompanies)
                {
                    try
                    {
                        // Get the most recent report submission for this company
                        var reportSubmissions = await _reportSubmissionRepository.GetReportSubmissionsByCompanyIdAsync(company.Id);
                        var latestReport = reportSubmissions
                            .OrderByDescending(r => r.SubmittedAt)
                            .FirstOrDefault();

                        if (latestReport == null) continue;

                        // Get AI evaluations for the latest report
                        var aiEvaluations = await _aiEvaluationRepository.GetAIEvaluationsBySubmissionIdAsync(latestReport.Id);
                        var latestAIEvaluation = aiEvaluations
                            .OrderByDescending(ae => ae.EvaluatedAt)
                            .FirstOrDefault();

                        if (latestAIEvaluation == null) continue;

                        // Get ESG score for the latest AI evaluation
                        var esgScore = await _esgScoreRepository.GetESGScoreByIdAsync(latestAIEvaluation.Id);

                        if (esgScore == null) continue;

                        companyRankings.Add(new
                        {
                            CompanyId = company.Id,
                            CompanyName = company.Name,
                            OverallScore = esgScore.OverallScore,
                            EnvironmentalScore = esgScore.EnvironmentalScore,
                            SocialScore = esgScore.SocialScore,
                            GovernanceScore = esgScore.GovernanceScore,
                            IsVerified = esgScore.IsVerified,
                            VerifiedBy = esgScore.VerifiedBy,
                            EvaluatedAt = latestAIEvaluation.EvaluatedAt,
                            ReportYear = latestReport.Year
                        });
                    }
                    catch (Exception ex)
                    {
                        _logger.LogWarning(ex, $"Error processing company {company.Id} for ranking");
                        continue;
                    }
                }

                // Order by ESG score descending
                var rankedCompanies = companyRankings
                    .OrderByDescending(c => ((dynamic)c).OverallScore)
                    .ToList();

                // Add ranking position
                var rankedWithPosition = rankedCompanies
                    .Select((company, index) => new
                    {
                        Rank = index + 1,
                        ((dynamic)company).CompanyId,
                        ((dynamic)company).CompanyName,
                        ((dynamic)company).OverallScore,
                        ((dynamic)company).EnvironmentalScore,
                        ((dynamic)company).SocialScore,
                        ((dynamic)company).GovernanceScore,
                        ((dynamic)company).IsVerified,
                        ((dynamic)company).VerifiedBy,
                        ((dynamic)company).EvaluatedAt,
                        ((dynamic)company).ReportYear
                    })
                    .ToList();

                // Apply pagination
                var totalCount = rankedWithPosition.Count;
                var totalPages = (int)Math.Ceiling((double)totalCount / pageSize);
                var skip = (page - 1) * pageSize;

                var pagedResults = rankedWithPosition
                    .Skip(skip)
                    .Take(pageSize)
                    .ToList();

                var result = new
                {
                    Data = pagedResults,
                    Pagination = new
                    {
                        CurrentPage = page,
                        PageSize = pageSize,
                        TotalCount = totalCount,
                        TotalPages = totalPages,
                        HasNextPage = page < totalPages,
                        HasPreviousPage = page > 1
                    }
                };

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving ESG ranking");
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}