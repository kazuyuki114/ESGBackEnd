using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;

namespace ESGBackEnd.Repositories
{
    public class EvaluationMetricRepository : IEvaluationMetricRepository
    {
        private readonly Supabase.Client _client;
        private readonly ILogger<EvaluationMetricRepository> _logger;

        public EvaluationMetricRepository(
            Supabase.Client client,
            ILogger<EvaluationMetricRepository> logger)
        {
            _client = client ?? throw new ArgumentNullException(nameof(client));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<EvaluationMetric> CreateEvaluationMetricAsync(EvaluationMetric evaluationMetric)
        {
            try
            {
                var response = await _client.From<EvaluationMetric>().Insert(evaluationMetric);
                return response.Models.FirstOrDefault() ?? throw new InvalidOperationException("Failed to create evaluation metric");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error creating evaluation metric with ID {evaluationMetric.Id}");
                throw;
            }
        }

        public async Task<EvaluationMetric?> GetEvaluationMetricByIdAsync(Guid id)
        {
            try
            {
                var response = await _client.From<EvaluationMetric>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Get();

                return response.Models.FirstOrDefault();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting evaluation metric with ID {id}");
                throw;
            }
        }

        public async Task<List<EvaluationMetric>> GetAllEvaluationMetricsAsync()
        {
            try
            {
                var response = await _client.From<EvaluationMetric>().Get();
                return response.Models;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting all evaluation metrics");
                throw;
            }
        }

        public async Task<EvaluationMetric> UpdateEvaluationMetricAsync(EvaluationMetric evaluationMetric)
        {
            try
            {
                var response = await _client.From<EvaluationMetric>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, evaluationMetric.Id.ToString())
                    .Update(evaluationMetric);

                return response.Models.FirstOrDefault() ??
                    throw new InvalidOperationException($"Failed to update evaluation metric with ID {evaluationMetric.Id}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error updating evaluation metric with ID {evaluationMetric.Id}");
                throw;
            }
        }

        public async Task<bool> DeleteEvaluationMetricAsync(Guid id)
        {
            try
            {
                await _client.From<EvaluationMetric>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Delete();

                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to delete evaluation metric with ID {id}");
                return false;
            }
        }
    }
}