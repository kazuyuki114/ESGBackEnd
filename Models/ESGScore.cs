using System;
using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace ESGBackEnd.Models;

[Table("esg_scores")]
public class ESGScore : BaseModel
{
    [PrimaryKey("id", false)]
    [Column("id")]
    public Guid Id { get; set; }

    [Column("overall_score")]
    public decimal OverallScore { get; set; }

    [Column("environmental_score")]
    public decimal EnvironmentalScore { get; set; }

    [Column("social_score")]
    public decimal SocialScore { get; set; }

    [Column("governance_score")]
    public decimal GovernanceScore { get; set; }

    [Column("is_verified")]
    public bool IsVerified { get; set; }

    [Column("verified_by")]
    public string? VerifiedBy { get; set; }

    [Column("verification_date")]
    public DateTime? VerificationDate { get; set; }
}