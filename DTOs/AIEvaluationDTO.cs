using System.ComponentModel.DataAnnotations;

namespace ESGBackEnd.DTOs
{
    public class AIEvaluationDTO
    {
        public Guid Id { get; set; }

        public Guid SubmissionId { get; set; }

        public string? Recommendations { get; set; }

        public string? KeyFindings { get; set; }

        public DateTime EvaluatedAt { get; set; }
        public EvaluationMetricDTO? evaluationMetric { get; set; }
        public ESGScoreDTO? esgScore { get; set; }
    }
}