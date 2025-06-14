using ESGBackEnd.DTOs.Pagination;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;
using ESGBackEnd.DTOs;
using ESGBackEnd.Mapper;

namespace ESGBackEnd.Repositories
{
    public class CompanyRepository : ICompanyRepository
    {
        private readonly Supabase.Client _client;
        private readonly ILogger<CompanyRepository> _logger;
        private readonly IIndustryRepository _industryRepository;

        public CompanyRepository(
            Supabase.Client client, 
            ILogger<CompanyRepository> logger,
            IIndustryRepository industryRepository)
        {
            _client = client ?? throw new ArgumentNullException(nameof(client));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _industryRepository = industryRepository ?? throw new ArgumentNullException(nameof(industryRepository));
        }
        
        // Create
        public async Task<Company> CreateCompanyAsync(Company company)
        {
            var response = await _client.From<Company>().Insert(company);
            return response.Models.FirstOrDefault() ?? throw new InvalidOperationException();
        }
        
        // Read
        public async Task<PagedResponse<CompanyDTO>> GetCompaniesAsync(PaginationParameters parameters)
        {
            var totalCount = await CountCompaniesAsync();
            
            var response = await _client.From<Company>()
                .Range((parameters.PageNumber - 1) * parameters.PageSize, 
                       (parameters.PageNumber * parameters.PageSize) - 1)
                .Get();
            
            var companies = response.Models;
            
            // Convert companies to DTOs with industry information
            var companiesDto = new List<CompanyDTO>();
            foreach (var company in companies)
            {
                var industry = await _industryRepository.GetIndustryByIdAsync(company.IndustryId);
                if (industry != null)
                {
                    companiesDto.Add(company.ToCompanyDto(industry));
                }
            }
            
            return new PagedResponse<CompanyDTO>(
                companiesDto,
                totalCount,
                parameters.PageNumber,
                parameters.PageSize
            );
        }
        
        // Updated method to fix the GUID issue
        public async Task<Company> UpdateCompanyAsync(Company company)
        {
            try
            {
                // First, get all companies
                var allCompanies = await _client.From<Company>().Get();
                
                // Find the company we want to update
                var existingCompany = allCompanies.Models.FirstOrDefault(c => c.Id == company.Id);
                
                if (existingCompany == null)
                    throw new InvalidOperationException($"Company with ID {company.Id} not found");
                
                // Important: Using string filter instead of GUID
                var response = await _client.From<Company>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, company.Id.ToString())
                    .Update(company);
                
                return response.Models.FirstOrDefault() ?? 
                    throw new InvalidOperationException($"Failed to update company with ID {company.Id}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error updating company with ID {company.Id}");
                throw;
            }
        }
        
        // Get by ID method should also use string conversion
        public async Task<CompanyDTO?> GetCompanyByIdAsync(Guid id)
        {
            try
            {
                var response = await _client.From<Company>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Get();
                
                var company = response.Models.FirstOrDefault();
                if (company == null)
                    throw new InvalidOperationException($"Company with ID {id} not found");
                
                // Get industry information for mapping
                var industry = await _industryRepository.GetIndustryByIdAsync(company.IndustryId);
                if (industry == null)
                    throw new InvalidOperationException($"Industry with ID {company.IndustryId} not found");
                
                return company.ToCompanyDto(industry);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting company with ID {id}");
                throw;
            }
        }
        
        public async Task<List<CompanyDTO>> GetCompaniesByIndustryIdAsync(Guid industryId)
        {
            try
            {
                // Convert the industryId to string for proper filtering
                var response = await _client.From<Company>()
                    .Filter("industry_id", Supabase.Postgrest.Constants.Operator.Equals, industryId.ToString())
                    .Get();
                
                var companies = response.Models;
                
                // Get industry information for mapping
                var industry = await _industryRepository.GetIndustryByIdAsync(industryId);
                if (industry == null)
                    throw new InvalidOperationException($"Industry with ID {industryId} not found");
                
                // Convert to DTOs
                var companiesDto = companies.Select(company => company.ToCompanyDto(industry)).ToList();
                
                return companiesDto;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error getting companies for industry ID {industryId}");
                throw;
            }
        }
        
        // Delete
        public async Task<bool> DeleteCompanyAsync(Guid id)
        {
            try
            {
                // Check if company exists (will throw exception if not found)
                await GetCompanyByIdAsync(id);
                
                await _client.From<Company>()
                    .Filter("id", Supabase.Postgrest.Constants.Operator.Equals, id.ToString())
                    .Delete();
                
                return true;
            }
            catch (Exception)
            {
                _logger.LogError($"Failed to delete company with ID {id}");
                return false;
            }
        }
        
        // Count
        public async Task<int> CountCompaniesAsync()
        {
            var response = await _client.From<Company>().Count(Supabase.Postgrest.Constants.CountType.Exact);
            return response;
        }
    }
}