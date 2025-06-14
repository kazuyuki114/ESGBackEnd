namespace ESGBackEnd.DTOs
{
    public class ESGScoreDTO
    {
        public Guid Id { get; set; }
        public decimal OverallScore { get; set; }
        public decimal EnvironmentalScore { get; set; }
        public decimal SocialScore { get; set; }
        public decimal GovernanceScore { get; set; }
        public bool IsVerified { get; set; }
        public string VerifiedBy { get; set; }
        public DateTime? VerificationDate { get; set; }
    }
}