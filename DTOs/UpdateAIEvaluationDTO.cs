using System.ComponentModel.DataAnnotations;

namespace ESGBackEnd.DTOs
{
    public class UpdateAIEvaluationDTO
    {
        [Required(ErrorMessage = "ID is required")]
        public Guid Id { get; set; }

        [Required(ErrorMessage = "Submission ID is required")]
        public Guid SubmissionId { get; set; }

        [StringLength(5000, ErrorMessage = "Recommendations cannot exceed 5000 characters")]
        public string? Recommendations { get; set; }

        [StringLength(5000, ErrorMessage = "Key findings cannot exceed 5000 characters")]
        public string? KeyFindings { get; set; }

        [Required(ErrorMessage = "Evaluated at date is required")]
        public DateTime EvaluatedAt { get; set; }
    }
}