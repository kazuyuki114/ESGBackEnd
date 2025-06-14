using System.ComponentModel.DataAnnotations;

namespace ESGBackEnd.DTOs
{
    public class CreateESGScoreDTO
    {
        [Required(ErrorMessage = "AI Evaluation ID is required")]
        public Guid AIEvaluationId { get; set; }

        [Required(ErrorMessage = "Overall score is required")]
        [Range(0, 100, ErrorMessage = "Overall score must be between 0 and 100")]
        public decimal OverallScore { get; set; }

        [Required(ErrorMessage = "Environmental score is required")]
        [Range(0, 100, ErrorMessage = "Environmental score must be between 0 and 100")]
        public decimal EnvironmentalScore { get; set; }

        [Required(ErrorMessage = "Social score is required")]
        [Range(0, 100, ErrorMessage = "Social score must be between 0 and 100")]
        public decimal SocialScore { get; set; }

        [Required(ErrorMessage = "Governance score is required")]
        [Range(0, 100, ErrorMessage = "Governance score must be between 0 and 100")]
        public decimal GovernanceScore { get; set; }

        public bool IsVerified { get; set; } = false;

        [StringLength(255, ErrorMessage = "Verified by cannot exceed 255 characters")]
        public string? VerifiedBy { get; set; }

        public DateTime? VerificationDate { get; set; }
    }
}