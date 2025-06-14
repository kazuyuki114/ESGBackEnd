using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;
using Microsoft.AspNetCore.Mvc;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AIEvaluationController : ControllerBase
    {
        private readonly IAIEvaluationRepository _aiEvaluationRepository;
        private readonly IESGScoreRepository _esgScoreRepository;
        private readonly IEvaluationMetricRepository _evaluationMetricRepository;

        public AIEvaluationController(
            IAIEvaluationRepository aiEvaluationRepository,
            IESGScoreRepository esgScoreRepository,
            IEvaluationMetricRepository evaluationMetricRepository)
        {
            _aiEvaluationRepository = aiEvaluationRepository;
            _esgScoreRepository = esgScoreRepository;
            _evaluationMetricRepository = evaluationMetricRepository;
        }
        
        // POST: api/aievaluation - Create AI evaluation only
        [HttpPost]
        public async Task<IActionResult> CreateAIEvaluation([FromBody] CreateAIEvaluationDTO dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                var aiEvaluation = new AIEvaluation
                {
                    SubmissionId = dto.SubmissionId,
                    Recommendations = dto.Recommendations,
                    KeyFindings = dto.KeyFindings,
                    EvaluatedAt = DateTime.UtcNow
                };

                var createdEvaluation = await _aiEvaluationRepository.CreateAIEvaluationAsync(aiEvaluation);

                return Ok(new
                {
                    message = "AI evaluation created successfully",
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // PUT: api/aievaluation/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAIEvaluation(Guid id, [FromBody] UpdateAIEvaluationDTO dto)
        {
            if (id != dto.Id)
                return BadRequest("ID in URL does not match ID in request body");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                var aiEvaluation = new AIEvaluation
                {
                    Id = dto.Id,
                    SubmissionId = dto.SubmissionId,
                    Recommendations = dto.Recommendations,
                    KeyFindings = dto.KeyFindings,
                    EvaluatedAt = dto.EvaluatedAt
                };

                var updatedEvaluation = await _aiEvaluationRepository.UpdateAIEvaluationAsync(aiEvaluation);

                return Ok(updatedEvaluation);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // DELETE: api/aievaluation/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAIEvaluation(Guid id)
        {
            try
            {
                // Delete related records first (due to foreign key constraints)
                await _evaluationMetricRepository.DeleteEvaluationMetricAsync(id);
                await _esgScoreRepository.DeleteESGScoreAsync(id);

                // Then delete the AI evaluation
                var result = await _aiEvaluationRepository.DeleteAIEvaluationAsync(id);

                if (result)
                    return NoContent();
                else
                    return StatusCode(500, "Failed to delete the AI evaluation");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}