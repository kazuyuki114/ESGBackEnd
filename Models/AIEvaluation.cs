using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace ESGBackEnd.Models
{
    [Table("ai_evaluations")]
    public class AIEvaluation : BaseModel
    {
        [PrimaryKey("id")]
        public Guid Id { get; set; }

        [Column("submission_id")]
        public Guid SubmissionId { get; set; }

        [Column("recommendations")]
        public string? Recommendations { get; set; }

        [Column("key_findings")]
        public string? KeyFindings { get; set; }

        [Column("evaluated_at")]
        public DateTime EvaluatedAt { get; set; }
    }
}