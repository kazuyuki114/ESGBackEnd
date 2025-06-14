using ESGBackEnd.DTOs;
using ESGBackEnd.DTOs.Pagination;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Mapper;
using Microsoft.AspNetCore.Mvc;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReportSubmissionController : ControllerBase
    {
        private readonly IReportSubmissionRepository _reportSubmissionRepository;

        public ReportSubmissionController(IReportSubmissionRepository reportSubmissionRepository)
        {
            _reportSubmissionRepository = reportSubmissionRepository;
        }

        // GET: api/reportsubmission
        [HttpGet]
        public async Task<IActionResult> GetReportSubmissions([FromQuery] PaginationParameters parameters)
        {
            try
            {
                var pagedReportSubmissions = await _reportSubmissionRepository.GetReportSubmissionsAsync(parameters);
                return Ok(pagedReportSubmissions);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // GET: api/reportsubmission/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetReportSubmissionById(Guid id)
        {
            try
            {
                var reportSubmission = await _reportSubmissionRepository.GetReportSubmissionByIdAsync(id);
                return Ok(reportSubmission);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // GET: api/reportsubmission/company/{companyId}
        [HttpGet("company/{companyId}")]
        public async Task<IActionResult> GetReportSubmissionsByCompanyId(Guid companyId)
        {
            try
            {
                var reportSubmissions = await _reportSubmissionRepository.GetReportSubmissionsByCompanyIdAsync(companyId);
                return Ok(reportSubmissions);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // GET: api/reportsubmission/year/{year}
        [HttpGet("year/{year}")]
        public async Task<IActionResult> GetReportSubmissionsByYear(int year)
        {
            try
            {
                var reportSubmissions = await _reportSubmissionRepository.GetReportSubmissionsByYearAsync(year);
                return Ok(reportSubmissions);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // POST: api/reportsubmission
        [HttpPost]
        public async Task<IActionResult> CreateReportSubmission([FromBody] CreateReportSubmissionDTO createDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                var reportSubmission = createDto.ToModel();

                var createdReportSubmission = await _reportSubmissionRepository.CreateReportSubmissionAsync(reportSubmission);

                // Get the created report submission as DTO
                var createdReportSubmissionDto = await _reportSubmissionRepository.GetReportSubmissionByIdAsync(createdReportSubmission.Id);

                return CreatedAtAction(nameof(GetReportSubmissionById),
                    new { id = createdReportSubmission.Id },
                    createdReportSubmissionDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // PUT: api/reportsubmission/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateReportSubmission(Guid id, [FromBody] UpdateReportSubmissionDTO updateDto)
        {
            if (id != updateDto.Id)
                return BadRequest("ID in URL does not match ID in request body");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                // Create a ReportSubmission model from the DTO for updating
                var reportSubmissionToUpdate = updateDto.ToModel();

                var updatedReportSubmission = await _reportSubmissionRepository.UpdateReportSubmissionAsync(reportSubmissionToUpdate);

                // Get the updated report submission as DTO
                var updatedReportSubmissionDto = await _reportSubmissionRepository.GetReportSubmissionByIdAsync(updatedReportSubmission.Id);

                return Ok(updatedReportSubmissionDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // DELETE: api/reportsubmission/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReportSubmission(Guid id)
        {
            try
            {
                var result = await _reportSubmissionRepository.DeleteReportSubmissionAsync(id);

                if (result)
                    return NoContent();
                else
                    return StatusCode(500, "Failed to delete the report submission");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}