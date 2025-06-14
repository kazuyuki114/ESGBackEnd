using ESGBackEnd.Models;

namespace ESGBackEnd.Interfaces
{
    public interface IESGScoreRepository
    {
        Task<ESGScore> CreateESGScoreAsync(ESGScore esgScore);
        Task<ESGScore?> GetESGScoreByIdAsync(Guid id);
        Task<List<ESGScore>> GetAllESGScoresAsync();
        Task<ESGScore> UpdateESGScoreAsync(ESGScore esgScore);
        Task<bool> DeleteESGScoreAsync(Guid id);
    }
}