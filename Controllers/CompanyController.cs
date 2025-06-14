using ESGBackEnd.DTOs;
using ESGBackEnd.DTOs.Pagination;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Mapper;
using Microsoft.AspNetCore.Mvc;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CompanyController : ControllerBase
    {
        private readonly ICompanyRepository _companyRepository;
        
        public CompanyController(ICompanyRepository companyRepository)
        {
            _companyRepository = companyRepository;
        }
        
        // GET: api/company
        [HttpGet]
        public async Task<IActionResult> GetCompanies([FromQuery] PaginationParameters parameters)
        {
            try
            {
                var pagedCompanies = await _companyRepository.GetCompaniesAsync(parameters);
                return Ok(pagedCompanies);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // GET: api/company/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetCompanyById(Guid id)
        {
            try
            {
                var company = await _companyRepository.GetCompanyByIdAsync(id);
                return Ok(company);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // GET: api/company/industry/{industryId}
        [HttpGet("industry/{industryId}")]
        public async Task<IActionResult> GetCompaniesByIndustryId(Guid industryId)
        {
            try
            {
                var companies = await _companyRepository.GetCompaniesByIndustryIdAsync(industryId);
                return Ok(companies);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // POST: api/company
        [HttpPost]
        public async Task<IActionResult> CreateCompany([FromBody] CompanyDTO companyDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
                
            try
            {
                var company = new Models.Company
                {
                    Name = companyDto.Name,
                    Slug = companyDto.Slug,
                    IndustryId = companyDto.IndustryId,
                    IsVerified = companyDto.IsVerified,
                    Status = companyDto.Status,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow,
                    Email = companyDto.Email,
                    Phone = companyDto.Phone
                };
                
                var createdCompany = await _companyRepository.CreateCompanyAsync(company);
                
                // Get the created company as DTO
                var createdCompanyDto = await _companyRepository.GetCompanyByIdAsync(createdCompany.Id);
                
                return CreatedAtAction(nameof(GetCompanyById), 
                    new { id = createdCompany.Id }, 
                    createdCompanyDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // PUT: api/company/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCompany(Guid id, [FromBody] CompanyDTO companyDto)
        {
            if (id != companyDto.Id)
                return BadRequest("ID in URL does not match ID in request body");
                
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
                
            try
            {
                // Create a Company model from the DTO for updating
                var companyToUpdate = new Models.Company
                {
                    Id = companyDto.Id,
                    Name = companyDto.Name,
                    Slug = companyDto.Slug,
                    IndustryId = companyDto.IndustryId,
                    IsVerified = companyDto.IsVerified,
                    Status = companyDto.Status,
                    UpdatedAt = DateTime.UtcNow,
                    Email = companyDto.Email,
                    Phone = companyDto.Phone,
                    CreatedAt = companyDto.CreatedAt
                };
                
                var updatedCompany = await _companyRepository.UpdateCompanyAsync(companyToUpdate);
                
                // Get the updated company as DTO
                var updatedCompanyDto = await _companyRepository.GetCompanyByIdAsync(updatedCompany.Id);
                
                return Ok(updatedCompanyDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // DELETE: api/company/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCompany(Guid id)
        {
            try
            {
                var result = await _companyRepository.DeleteCompanyAsync(id);
                
                if (result)
                    return NoContent();
                else
                    return StatusCode(500, "Failed to delete the company");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}