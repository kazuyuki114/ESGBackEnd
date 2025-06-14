using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Mapper;
using Microsoft.AspNetCore.Mvc;
using ESGBackEnd.DTOs.Pagination;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class IndustryController : ControllerBase
    {
        private readonly IIndustryRepository _industryRepository;
        
        public IndustryController(IIndustryRepository industryRepository)
        {
            _industryRepository = industryRepository;
        }
        
        // GET: api/industry
        [HttpGet]
        public async Task<IActionResult> GetIndustries([FromQuery] PaginationParameters parameters)
        {
            try
            {
                var pagedIndustries = await _industryRepository.GetIndustriesAsync(parameters);
                
                // Map to DTOs
                var industryDTOs = pagedIndustries.Data.Select(i => i.ToIndustryDto()).ToList();
                
                var pagedResponse = new PagedResponse<IndustryDTO>(
                    industryDTOs,
                    pagedIndustries.TotalCount,
                    pagedIndustries.PageNumber,
                    pagedIndustries.PageSize
                );
                
                return Ok(pagedResponse);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // GET: api/industry/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetIndustryById(Guid id)
        {
            try
            {
                var industry = await _industryRepository.GetIndustryByIdAsync(id);

                return Ok(industry.ToIndustryDto());
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // POST: api/industry
        [HttpPost]
        public async Task<IActionResult> CreateIndustry([FromBody] IndustryDTO industryDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
                
            try
            {
                var industry = new Models.Industry
                {
                    Name = industryDto.Name,
                    Code = industryDto.Code
                };
                
                var createdIndustry = await _industryRepository.CreateIndustryAsync(industry);
                
                return CreatedAtAction(nameof(GetIndustryById), 
                    new { id = createdIndustry.Id }, 
                    createdIndustry.ToIndustryDto());
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // PUT: api/industry/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateIndustry(Guid id, [FromBody] IndustryDTO industryDto)
        {
            if (id != industryDto.Id)
                return BadRequest("ID in URL does not match ID in request body");
                
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
                
            try
            {
                var existingIndustry = await _industryRepository.GetIndustryByIdAsync(id);

                existingIndustry.Name = industryDto.Name;
                existingIndustry.Code = industryDto.Code;
                
                var updatedIndustry = await _industryRepository.UpdateIndustryAsync(existingIndustry);
                
                return Ok(updatedIndustry.ToIndustryDto());
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        // DELETE: api/industry/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteIndustry(Guid id)
        {
            try
            {
                var result = await _industryRepository.DeleteIndustryAsync(id);
                
                if (result)
                    return NoContent();
                else
                    return StatusCode(500, "Failed to delete the industry");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}