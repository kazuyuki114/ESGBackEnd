using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;
using ESGBackEnd.DTOs.Pagination;

namespace ESGBackEnd.Repositories
{
    public class IndustryRepository : IIndustryRepository
    {
        private readonly Supabase.Client _client;
        private readonly ILogger<IndustryRepository> _logger;
        public IndustryRepository(Supabase.Client client, ILogger<IndustryRepository> logger)
        {
            _client = client ?? throw new ArgumentNullException(nameof(client));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }
        
        // Create
        public async Task<Industry> CreateIndustryAsync(Industry industry)
        {
            var response = await _client.From<Industry>().Insert(industry);
            return response.Models.FirstOrDefault() ?? throw new InvalidOperationException();
        }
        
        // Read
        public async Task<PagedResponse<Industry>> GetIndustriesAsync(PaginationParameters parameters)
        {
            var totalCount = await CountIndustriesAsync();
            
            var response = await _client.From<Industry>()
                .Range((parameters.PageNumber - 1) * parameters.PageSize, 
                      (parameters.PageNumber * parameters.PageSize) - 1)
                .Get();
            
            var industries = response.Models;
            
            return new PagedResponse<Industry>(
                industries.ToList(),
                totalCount,
                parameters.PageNumber,
                parameters.PageSize
            );
        }
        
        public async Task<Industry> GetIndustryByIdAsync(Guid id)
        {
            try
            {
                // Convert the Guid to string to ensure proper formatting
                var response = await _client.From<Industry>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Get();
            
                return response.Models.FirstOrDefault() ?? throw new InvalidOperationException($"Industry with ID {id} not found");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting industry with ID {id}");
                throw;
            }
        }
        
        public async Task<Industry> GetIndustryByCodeAsync(string code)
        {
            var response = await _client.From<Industry>()
                .Filter("code", Supabase.Postgrest.Constants.Operator.Equals, code)
                .Single();
                
            return response ?? throw new InvalidOperationException();
        }
        
        // Update
        public async Task<Industry> UpdateIndustryAsync(Industry industry)
        {
            try
            {
                // Clone the industry object to avoid modifying the original
                var industryToUpdate = new Industry
                {
                    Id = industry.Id,
                    Name = industry.Name,
                    Code = industry.Code
                };
                
                // Use a different approach - get the existing record first without filtering
                var response = await _client.From<Industry>()
                    .Where(i => i.Id == industry.Id)
                    .Update(industryToUpdate);
                    
                return response.Models.FirstOrDefault() ?? throw new InvalidOperationException($"Failed to update industry with ID {industry.Id}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error updating industry with ID {industry.Id}");
                throw;
            }
        }
        
        // Delete
        public async Task<bool> DeleteIndustryAsync(Guid id)
        {
            try
            {
                await _client.From<Industry>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Delete();
                return true;
            }
            catch (Exception)
            {
                _logger.LogError($"Failed to delete industry with ID {id}");
                return false;
            }
        }
        
        // Count
        public async Task<int> CountIndustriesAsync()
        {
            var response = await _client.From<Industry>().Count(Supabase.Postgrest.Constants.CountType.Exact);
            return response;
        }
    }
}