namespace ESGBackEnd.DTOs
{
    public class ReportSubmissionDTO
    {
        public Guid Id { get; set; }
        public Guid CompanyId { get; set; }
        public required string Title { get; set; }
        public int Year { get; set; }
        public required string FileUrl { get; set; }
        public long FileSize { get; set; }
        public required string Status { get; set; }
        public DateTime SubmittedAt { get; set; }
        public AIEvaluationDTO? aiEvaluation { get; set; }
    }
}