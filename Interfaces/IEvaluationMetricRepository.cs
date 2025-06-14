using ESGBackEnd.Models;

namespace ESGBackEnd.Interfaces
{
    public interface IEvaluationMetricRepository
    {
        Task<EvaluationMetric> CreateEvaluationMetricAsync(EvaluationMetric evaluationMetric);
        Task<EvaluationMetric?> GetEvaluationMetricByIdAsync(Guid id);
        Task<List<EvaluationMetric>> GetAllEvaluationMetricsAsync();
        Task<EvaluationMetric> UpdateEvaluationMetricAsync(EvaluationMetric evaluationMetric);
        Task<bool> DeleteEvaluationMetricAsync(Guid id);
    }
}