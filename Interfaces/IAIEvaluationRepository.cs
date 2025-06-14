using ESGBackEnd.DTOs;
using ESGBackEnd.Models;

namespace ESGBackEnd.Interfaces
{
    public interface IAIEvaluationRepository
    {
        Task<AIEvaluation> CreateAIEvaluationAsync(AIEvaluation aiEvaluation);
        Task<AIEvaluation?> GetAIEvaluationByIdAsync(Guid id);
        Task<List<AIEvaluation>> GetAIEvaluationsBySubmissionIdAsync(Guid submissionId);
        Task<List<AIEvaluation>> GetAllAIEvaluationsAsync();
        Task<AIEvaluation> UpdateAIEvaluationAsync(AIEvaluation aiEvaluation);
        Task<bool> DeleteAIEvaluationAsync(Guid id);
    }
}