using System.ComponentModel.DataAnnotations;

namespace ESGBackEnd.DTOs
{
    public class EvaluationMetricDTO
    {
        [Required(ErrorMessage = "Evaluation ID is required")]
        public Guid Id { get; set; }

        // Environmental metrics (7)
        [Required(ErrorMessage = "Climate Action score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Climate Action score must be between 0 and 100")]
        [Display(Name = "Climate Action")]
        public double EnvClimateAction { get; set; }

        [Required(ErrorMessage = "Energy Transition score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Energy Transition score must be between 0 and 100")]
        [Display(Name = "Energy Transition")]
        public double EnvEnergyTransition { get; set; }

        [Required(ErrorMessage = "Water Stewardship score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Water Stewardship score must be between 0 and 100")]
        [Display(Name = "Water Stewardship")]
        public double EnvWaterStewardship { get; set; }

        [Required(ErrorMessage = "Biodiversity & Nature score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Biodiversity & Nature score must be between 0 and 100")]
        [Display(Name = "Biodiversity & Nature")]
        public double EnvBiodiversityNature { get; set; }

        [Required(ErrorMessage = "Pollution Prevention score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Pollution Prevention score must be between 0 and 100")]
        [Display(Name = "Pollution Prevention")]
        public double EnvPollutionPrevention { get; set; }

        [Required(ErrorMessage = "Circular Economy score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Circular Economy score must be between 0 and 100")]
        [Display(Name = "Circular Economy")]
        public double EnvCircularEconomy { get; set; }

        [Required(ErrorMessage = "Sustainable Practices score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Sustainable Practices score must be between 0 and 100")]
        [Display(Name = "Sustainable Practices")]
        public double EnvSustainablePractices { get; set; }

        // Social metrics (7)
        [Required(ErrorMessage = "Diversity & Inclusion score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Diversity & Inclusion score must be between 0 and 100")]
        [Display(Name = "Diversity & Inclusion")]
        public double SocialDiversityInclusion { get; set; }

        [Required(ErrorMessage = "Workforce Development score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Workforce Development score must be between 0 and 100")]
        [Display(Name = "Workforce Development")]
        public double SocialWorkforceDevelopment { get; set; }

        [Required(ErrorMessage = "Health & Safety score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Health & Safety score must be between 0 and 100")]
        [Display(Name = "Health & Safety")]
        public double SocialHealthSafety { get; set; }

        [Required(ErrorMessage = "Human Rights score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Human Rights score must be between 0 and 100")]
        [Display(Name = "Human Rights")]
        public double SocialHumanRights { get; set; }

        [Required(ErrorMessage = "Community Engagement score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Community Engagement score must be between 0 and 100")]
        [Display(Name = "Community Engagement")]
        public double SocialCommunityEngagement { get; set; }

        [Required(ErrorMessage = "Customer & Stakeholder Relations score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Customer & Stakeholder Relations score must be between 0 and 100")]
        [Display(Name = "Customer & Stakeholder Relations")]
        public double SocialCustomerStakeholder { get; set; }

        [Required(ErrorMessage = "Financial Inclusion score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Financial Inclusion score must be between 0 and 100")]
        [Display(Name = "Financial Inclusion")]
        public double SocialFinancialInclusion { get; set; }

        // Governance metrics (8)
        [Required(ErrorMessage = "Corporate Governance score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Corporate Governance score must be between 0 and 100")]
        [Display(Name = "Corporate Governance")]
        public double GovCorporateGovernance { get; set; }

        [Required(ErrorMessage = "Ethics & Integrity score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Ethics & Integrity score must be between 0 and 100")]
        [Display(Name = "Ethics & Integrity")]
        public double GovEthicsIntegrity { get; set; }

        [Required(ErrorMessage = "Transparency & Disclosure score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Transparency & Disclosure score must be between 0 and 100")]
        [Display(Name = "Transparency & Disclosure")]
        public double GovTransparencyDisclosure { get; set; }

        [Required(ErrorMessage = "Risk Management score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Risk Management score must be between 0 and 100")]
        [Display(Name = "Risk Management")]
        public double GovRiskManagement { get; set; }

        [Required(ErrorMessage = "Compliance & Legal score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Compliance & Legal score must be between 0 and 100")]
        [Display(Name = "Compliance & Legal")]
        public double GovComplianceLegal { get; set; }

        [Required(ErrorMessage = "Stakeholder Relations score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Stakeholder Relations score must be between 0 and 100")]
        [Display(Name = "Stakeholder Relations")]
        public double GovStakeholderRelations { get; set; }

        [Required(ErrorMessage = "Innovation & Technology score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Innovation & Technology score must be between 0 and 100")]
        [Display(Name = "Innovation & Technology")]
        public double GovInnovationTechnology { get; set; }

        [Required(ErrorMessage = "Cybersecurity & Data Protection score is required")]
        [Range(0.0, 100.0, ErrorMessage = "Cybersecurity & Data Protection score must be between 0 and 100")]
        [Display(Name = "Cybersecurity & Data Protection")]
        public double GovCybersecurityData { get; set; }
    }
}