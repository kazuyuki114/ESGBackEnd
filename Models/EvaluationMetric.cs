using System;
using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace ESGBackEnd.Models;

[Table("evaluation_metrics")]
public class EvaluationMetric : BaseModel
{
    [PrimaryKey("id", false)]
    [Column("id")]
    public Guid Id { get; set; }

    // Environmental metrics
    [Column("env_climate_action")]
    public double EnvClimateAction { get; set; }

    [Column("env_energy_transition")]
    public double EnvEnergyTransition { get; set; }

    [Column("env_water_stewardship")]
    public double EnvWaterStewardship { get; set; }

    [Column("env_biodiversity_nature")]
    public double EnvBiodiversityNature { get; set; }

    [Column("env_pollution_prevention")]
    public double EnvPollutionPrevention { get; set; }

    [Column("env_circular_economy")]
    public double EnvCircularEconomy { get; set; }

    [Column("env_sustainable_practices")]
    public double EnvSustainablePractices { get; set; }

    // Social metrics
    [Column("social_diversity_inclusion")]
    public double SocialDiversityInclusion { get; set; }

    [Column("social_workforce_development")]
    public double SocialWorkforceDevelopment { get; set; }

    [Column("social_health_safety")]
    public double SocialHealthSafety { get; set; }

    [Column("social_human_rights")]
    public double SocialHumanRights { get; set; }

    [Column("social_community_engagement")]
    public double SocialCommunityEngagement { get; set; }

    [Column("social_customer_stakeholder")]
    public double SocialCustomerStakeholder { get; set; }

    [Column("social_financial_inclusion")]
    public double SocialFinancialInclusion { get; set; }

    // Governance metrics
    [Column("gov_corporate_governance")]
    public double GovCorporateGovernance { get; set; }

    [Column("gov_ethics_integrity")]
    public double GovEthicsIntegrity { get; set; }

    [Column("gov_transparency_disclosure")]
    public double GovTransparencyDisclosure { get; set; }

    [Column("gov_risk_management")]
    public double GovRiskManagement { get; set; }

    [Column("gov_compliance_legal")]
    public double GovComplianceLegal { get; set; }

    [Column("gov_stakeholder_relations")]
    public double GovStakeholderRelations { get; set; }

    [Column("gov_innovation_technology")]
    public double GovInnovationTechnology { get; set; }

    [Column("gov_cybersecurity_data")]
    public double GovCybersecurityData { get; set; }
}