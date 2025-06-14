using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;

namespace ESGBackEnd.Repositories
{
    public class AIEvaluationRepository : IAIEvaluationRepository
    {
        private readonly Supabase.Client _client;
        private readonly ILogger<AIEvaluationRepository> _logger;
        private readonly IReportSubmissionRepository _reportSubmissionRepository;
        public AIEvaluationRepository(
            Supabase.Client client,
            ILogger<AIEvaluationRepository> logger,
            IReportSubmissionRepository reportSubmissionRepository)
        {
            _client = client ?? throw new ArgumentNullException(nameof(client));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _reportSubmissionRepository = reportSubmissionRepository ?? throw new ArgumentNullException(nameof(reportSubmissionRepository));
        }

        public async Task<AIEvaluation> CreateAIEvaluationAsync(AIEvaluation aiEvaluation)
        {
            try
            {
                var response = await _client.From<AIEvaluation>().Insert(aiEvaluation);
                return response.Models.FirstOrDefault() ?? throw new InvalidOperationException("Failed to create AI evaluation");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error creating AI evaluation with ID {aiEvaluation.Id}");
                throw;
            }
        }

        public async Task<AIEvaluation?> GetAIEvaluationByIdAsync(Guid id)
        {
            try
            {
                var response = await _client.From<AIEvaluation>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Get();

                return response.Models.FirstOrDefault();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting AI evaluation with ID {id}");
                throw;
            }
        }

        public async Task<List<AIEvaluation>> GetAIEvaluationsBySubmissionIdAsync(Guid submissionId)
        {
            try
            {
                var response = await _client.From<AIEvaluation>()
                    .Filter("submission_id", Supabase.Postgrest.Constants.Operator.Equals, submissionId.ToString())
                    .Get();

                return response.Models;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting AI evaluations for submission ID {submissionId}");
                throw;
            }
        }

        public async Task<List<AIEvaluation>> GetAllAIEvaluationsAsync()
        {
            try
            {
                var response = await _client.From<AIEvaluation>().Get();
                return response.Models;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting all AI evaluations");
                throw;
            }
        }

        public async Task<AIEvaluation> UpdateAIEvaluationAsync(AIEvaluation aiEvaluation)
        {
            try
            {
                var response = await _client.From<AIEvaluation>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, aiEvaluation.Id.ToString())
                    .Update(aiEvaluation);

                return response.Models.FirstOrDefault() ??
                    throw new InvalidOperationException($"Failed to update AI evaluation with ID {aiEvaluation.Id}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error updating AI evaluation with ID {aiEvaluation.Id}");
                throw;
            }
        }

        public async Task<bool> DeleteAIEvaluationAsync(Guid id)
        {
            try
            {
                await _client.From<AIEvaluation>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Delete();

                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to delete AI evaluation with ID {id}");
                return false;
            }
        }
    }
}