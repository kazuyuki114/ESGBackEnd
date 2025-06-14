using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;

namespace ESGBackEnd.Repositories
{
    public class ESGScoreRepository : IESGScoreRepository
    {
        private readonly Supabase.Client _client;
        private readonly ILogger<ESGScoreRepository> _logger;

        public ESGScoreRepository(
            Supabase.Client client,
            ILogger<ESGScoreRepository> logger)
        {
            _client = client ?? throw new ArgumentNullException(nameof(client));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<ESGScore> CreateESGScoreAsync(ESGScore esgScore)
        {
            try
            {
                var response = await _client.From<ESGScore>().Insert(esgScore);
                return response.Models.FirstOrDefault() ?? throw new InvalidOperationException("Failed to create ESG score");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error creating ESG score with ID {esgScore.Id}");
                throw;
            }
        }

        public async Task<ESGScore?> GetESGScoreByIdAsync(Guid id)
        {
            try
            {
                var response = await _client.From<ESGScore>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Get();

                return response.Models.FirstOrDefault();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting ESG score with ID {id}");
                throw;
            }
        }

        public async Task<List<ESGScore>> GetAllESGScoresAsync()
        {
            try
            {
                var response = await _client.From<ESGScore>().Get();
                return response.Models;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting all ESG scores");
                throw;
            }
        }

        public async Task<ESGScore> UpdateESGScoreAsync(ESGScore esgScore)
        {
            try
            {
                var response = await _client.From<ESGScore>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, esgScore.Id.ToString())
                    .Update(esgScore);

                return response.Models.FirstOrDefault() ??
                    throw new InvalidOperationException($"Failed to update ESG score with ID {esgScore.Id}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error updating ESG score with ID {esgScore.Id}");
                throw;
            }
        }

        public async Task<bool> DeleteESGScoreAsync(Guid id)
        {
            try
            {
                await _client.From<ESGScore>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Delete();

                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Failed to delete ESG score with ID {id}");
                return false;
            }
        }
    }
}