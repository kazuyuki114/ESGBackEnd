using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;
using Microsoft.AspNetCore.Mvc;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ESGScoreController : ControllerBase
    {
        private readonly IESGScoreRepository _esgScoreRepository;
        private readonly IAIEvaluationRepository _aiEvaluationRepository;

        public ESGScoreController(
            IESGScoreRepository esgScoreRepository,
            IAIEvaluationRepository aiEvaluationRepository)
        {
            _esgScoreRepository = esgScoreRepository;
            _aiEvaluationRepository = aiEvaluationRepository;
        }

        // POST: api/esgscore
        [HttpPost]
        public async Task<IActionResult> CreateESGScore([FromBody] CreateESGScoreDTO dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                // Validate that the AI evaluation exists
                var aiEvaluation = await _aiEvaluationRepository.GetAIEvaluationByIdAsync(dto.AIEvaluationId);
                if (aiEvaluation == null)
                {
                    return BadRequest($"AI evaluation with ID {dto.AIEvaluationId} does not exist. Please create the AI evaluation first.");
                }

                var esgScore = new ESGScore
                {
                    Id = dto.AIEvaluationId,
                    OverallScore = dto.OverallScore,
                    EnvironmentalScore = dto.EnvironmentalScore,
                    SocialScore = dto.SocialScore,
                    GovernanceScore = dto.GovernanceScore,
                    IsVerified = dto.IsVerified,
                    VerifiedBy = dto.VerifiedBy,
                    VerificationDate = dto.VerificationDate
                };

                var createdESGScore = await _esgScoreRepository.CreateESGScoreAsync(esgScore);

                return Ok(new
                {
                    message = "ESG score created successfully",
                    id = createdESGScore.Id
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // PUT: api/esgscore/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateESGScore(Guid id, [FromBody] UpdateESGScoreDTO dto)
        {
            if (id != dto.Id)
                return BadRequest("ID in URL does not match ID in request body");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                // Check if the ESG score exists
                var existingScore = await _esgScoreRepository.GetESGScoreByIdAsync(id);
                if (existingScore == null)
                {
                    return NotFound($"ESG score with ID {id} not found");
                }

                var esgScore = new ESGScore
                {
                    Id = dto.Id,
                    OverallScore = dto.OverallScore,
                    EnvironmentalScore = dto.EnvironmentalScore,
                    SocialScore = dto.SocialScore,
                    GovernanceScore = dto.GovernanceScore,
                    IsVerified = dto.IsVerified,
                    VerifiedBy = dto.VerifiedBy,
                    VerificationDate = dto.VerificationDate
                };

                var updatedESGScore = await _esgScoreRepository.UpdateESGScoreAsync(esgScore);

                return Ok(updatedESGScore);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // DELETE: api/esgscore/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteESGScore(Guid id)
        {
            try
            {
                // Check if the ESG score exists
                var existingScore = await _esgScoreRepository.GetESGScoreByIdAsync(id);
                if (existingScore == null)
                {
                    return NotFound($"ESG score with ID {id} not found");
                }

                var result = await _esgScoreRepository.DeleteESGScoreAsync(id);

                if (result)
                    return NoContent();
                else
                    return StatusCode(500, "Failed to delete the ESG score");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}