namespace ESGBackEnd.DTOs
{
    public class CompanyDTO
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Slug { get; set; }
        public Guid IndustryId { get; set; }
        public bool IsVerified { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

        // Industry details
        public string? IndustryName { get; set; }
        public string? IndustryCode { get; set; }

    }
}