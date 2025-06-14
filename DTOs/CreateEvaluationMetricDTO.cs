using System.ComponentModel.DataAnnotations;

namespace ESGBackEnd.DTOs
{
    public class CreateEvaluationMetricDTO
    {
        [Required(ErrorMessage = "AI Evaluation ID is required")]
        public Guid AIEvaluationId { get; set; }
        // Environmental metrics
        [Required(ErrorMessage = "Climate action score is required")]
        [Range(0, 100, ErrorMessage = "Climate action score must be between 0 and 100")]
        public double EnvClimateAction { get; set; }

        [Required(ErrorMessage = "Energy transition score is required")]
        [Range(0, 100, ErrorMessage = "Energy transition score must be between 0 and 100")]
        public double EnvEnergyTransition { get; set; }

        [Required(ErrorMessage = "Water stewardship score is required")]
        [Range(0, 100, ErrorMessage = "Water stewardship score must be between 0 and 100")]
        public double EnvWaterStewardship { get; set; }

        [Required(ErrorMessage = "Biodiversity nature score is required")]
        [Range(0, 100, ErrorMessage = "Biodiversity nature score must be between 0 and 100")]
        public double EnvBiodiversityNature { get; set; }

        [Required(ErrorMessage = "Pollution prevention score is required")]
        [Range(0, 100, ErrorMessage = "Pollution prevention score must be between 0 and 100")]
        public double EnvPollutionPrevention { get; set; }

        [Required(ErrorMessage = "Circular economy score is required")]
        [Range(0, 100, ErrorMessage = "Circular economy score must be between 0 and 100")]
        public double EnvCircularEconomy { get; set; }

        [Required(ErrorMessage = "Sustainable practices score is required")]
        [Range(0, 100, ErrorMessage = "Sustainable practices score must be between 0 and 100")]
        public double EnvSustainablePractices { get; set; }

        // Social metrics
        [Required(ErrorMessage = "Diversity inclusion score is required")]
        [Range(0, 100, ErrorMessage = "Diversity inclusion score must be between 0 and 100")]
        public double SocialDiversityInclusion { get; set; }

        [Required(ErrorMessage = "Workforce development score is required")]
        [Range(0, 100, ErrorMessage = "Workforce development score must be between 0 and 100")]
        public double SocialWorkforceDevelopment { get; set; }

        [Required(ErrorMessage = "Health safety score is required")]
        [Range(0, 100, ErrorMessage = "Health safety score must be between 0 and 100")]
        public double SocialHealthSafety { get; set; }

        [Required(ErrorMessage = "Human rights score is required")]
        [Range(0, 100, ErrorMessage = "Human rights score must be between 0 and 100")]
        public double SocialHumanRights { get; set; }

        [Required(ErrorMessage = "Community engagement score is required")]
        [Range(0, 100, ErrorMessage = "Community engagement score must be between 0 and 100")]
        public double SocialCommunityEngagement { get; set; }

        [Required(ErrorMessage = "Customer stakeholder score is required")]
        [Range(0, 100, ErrorMessage = "Customer stakeholder score must be between 0 and 100")]
        public double SocialCustomerStakeholder { get; set; }

        [Required(ErrorMessage = "Financial inclusion score is required")]
        [Range(0, 100, ErrorMessage = "Financial inclusion score must be between 0 and 100")]
        public double SocialFinancialInclusion { get; set; }

        // Governance metrics
        [Required(ErrorMessage = "Corporate governance score is required")]
        [Range(0, 100, ErrorMessage = "Corporate governance score must be between 0 and 100")]
        public double GovCorporateGovernance { get; set; }

        [Required(ErrorMessage = "Ethics integrity score is required")]
        [Range(0, 100, ErrorMessage = "Ethics integrity score must be between 0 and 100")]
        public double GovEthicsIntegrity { get; set; }

        [Required(ErrorMessage = "Transparency disclosure score is required")]
        [Range(0, 100, ErrorMessage = "Transparency disclosure score must be between 0 and 100")]
        public double GovTransparencyDisclosure { get; set; }

        [Required(ErrorMessage = "Risk management score is required")]
        [Range(0, 100, ErrorMessage = "Risk management score must be between 0 and 100")]
        public double GovRiskManagement { get; set; }

        [Required(ErrorMessage = "Compliance legal score is required")]
        [Range(0, 100, ErrorMessage = "Compliance legal score must be between 0 and 100")]
        public double GovComplianceLegal { get; set; }

        [Required(ErrorMessage = "Stakeholder relations score is required")]
        [Range(0, 100, ErrorMessage = "Stakeholder relations score must be between 0 and 100")]
        public double GovStakeholderRelations { get; set; }

        [Required(ErrorMessage = "Innovation technology score is required")]
        [Range(0, 100, ErrorMessage = "Innovation technology score must be between 0 and 100")]
        public double GovInnovationTechnology { get; set; }

        [Required(ErrorMessage = "Cybersecurity data score is required")]
        [Range(0, 100, ErrorMessage = "Cybersecurity data score must be between 0 and 100")]
        public double GovCybersecurityData { get; set; }
    }
}