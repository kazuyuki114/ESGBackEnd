using ESGBackEnd.DTOs;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Models;
using Microsoft.AspNetCore.Mvc;

namespace ESGBackEnd.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EvaluationMetricController : ControllerBase
    {
        private readonly IEvaluationMetricRepository _evaluationMetricRepository;
        private readonly IAIEvaluationRepository _aiEvaluationRepository;

        public EvaluationMetricController(
            IEvaluationMetricRepository evaluationMetricRepository,
            IAIEvaluationRepository aiEvaluationRepository)
        {
            _evaluationMetricRepository = evaluationMetricRepository;
            _aiEvaluationRepository = aiEvaluationRepository;
        }

        // POST: api/evaluationmetric
        [HttpPost]
        public async Task<IActionResult> CreateEvaluationMetric([FromBody] CreateEvaluationMetricDTO dto)
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

                var evaluationMetric = new EvaluationMetric
                {
                    Id = dto.AIEvaluationId,
                    EnvClimateAction = dto.EnvClimateAction,
                    EnvEnergyTransition = dto.EnvEnergyTransition,
                    EnvWaterStewardship = dto.EnvWaterStewardship,
                    EnvBiodiversityNature = dto.EnvBiodiversityNature,
                    EnvPollutionPrevention = dto.EnvPollutionPrevention,
                    EnvCircularEconomy = dto.EnvCircularEconomy,
                    EnvSustainablePractices = dto.EnvSustainablePractices,
                    SocialDiversityInclusion = dto.SocialDiversityInclusion,
                    SocialWorkforceDevelopment = dto.SocialWorkforceDevelopment,
                    SocialHealthSafety = dto.SocialHealthSafety,
                    SocialHumanRights = dto.SocialHumanRights,
                    SocialCommunityEngagement = dto.SocialCommunityEngagement,
                    SocialCustomerStakeholder = dto.SocialCustomerStakeholder,
                    SocialFinancialInclusion = dto.SocialFinancialInclusion,
                    GovCorporateGovernance = dto.GovCorporateGovernance,
                    GovEthicsIntegrity = dto.GovEthicsIntegrity,
                    GovTransparencyDisclosure = dto.GovTransparencyDisclosure,
                    GovRiskManagement = dto.GovRiskManagement,
                    GovComplianceLegal = dto.GovComplianceLegal,
                    GovStakeholderRelations = dto.GovStakeholderRelations,
                    GovInnovationTechnology = dto.GovInnovationTechnology,
                    GovCybersecurityData = dto.GovCybersecurityData
                };

                var createdEvaluationMetric = await _evaluationMetricRepository.CreateEvaluationMetricAsync(evaluationMetric);

                return Ok(new
                {
                    message = "Evaluation metric created successfully",
                    id = createdEvaluationMetric.Id
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // PUT: api/evaluationmetric/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateEvaluationMetric(Guid id, [FromBody] UpdateEvaluationMetricDTO dto)
        {
            if (id != dto.Id)
                return BadRequest("ID in URL does not match ID in request body");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                // Check if the evaluation metric exists
                var existingMetric = await _evaluationMetricRepository.GetEvaluationMetricByIdAsync(id);
                if (existingMetric == null)
                {
                    return NotFound($"Evaluation metric with ID {id} not found");
                }

                var evaluationMetric = new EvaluationMetric
                {
                    Id = dto.Id,
                    EnvClimateAction = dto.EnvClimateAction,
                    EnvEnergyTransition = dto.EnvEnergyTransition,
                    EnvWaterStewardship = dto.EnvWaterStewardship,
                    EnvBiodiversityNature = dto.EnvBiodiversityNature,
                    EnvPollutionPrevention = dto.EnvPollutionPrevention,
                    EnvCircularEconomy = dto.EnvCircularEconomy,
                    EnvSustainablePractices = dto.EnvSustainablePractices,
                    SocialDiversityInclusion = dto.SocialDiversityInclusion,
                    SocialWorkforceDevelopment = dto.SocialWorkforceDevelopment,
                    SocialHealthSafety = dto.SocialHealthSafety,
                    SocialHumanRights = dto.SocialHumanRights,
                    SocialCommunityEngagement = dto.SocialCommunityEngagement,
                    SocialCustomerStakeholder = dto.SocialCustomerStakeholder,
                    SocialFinancialInclusion = dto.SocialFinancialInclusion,
                    GovCorporateGovernance = dto.GovCorporateGovernance,
                    GovEthicsIntegrity = dto.GovEthicsIntegrity,
                    GovTransparencyDisclosure = dto.GovTransparencyDisclosure,
                    GovRiskManagement = dto.GovRiskManagement,
                    GovComplianceLegal = dto.GovComplianceLegal,
                    GovStakeholderRelations = dto.GovStakeholderRelations,
                    GovInnovationTechnology = dto.GovInnovationTechnology,
                    GovCybersecurityData = dto.GovCybersecurityData
                };

                var updatedEvaluationMetric = await _evaluationMetricRepository.UpdateEvaluationMetricAsync(evaluationMetric);

                return Ok(updatedEvaluationMetric);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // DELETE: api/evaluationmetric/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEvaluationMetric(Guid id)
        {
            try
            {
                // Check if the evaluation metric exists
                var existingMetric = await _evaluationMetricRepository.GetEvaluationMetricByIdAsync(id);
                if (existingMetric == null)
                {
                    return NotFound($"Evaluation metric with ID {id} not found");
                }

                var result = await _evaluationMetricRepository.DeleteEvaluationMetricAsync(id);

                if (result)
                    return NoContent();
                else
                    return StatusCode(500, "Failed to delete the evaluation metric");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}