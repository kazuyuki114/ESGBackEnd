using System.ComponentModel.DataAnnotations;

namespace ESGBackEnd.DTOs
{
    public class CreateReportSubmissionDTO
    {
        [Required(ErrorMessage = "Company ID is required")]
        public Guid CompanyId { get; set; }

        [Required(ErrorMessage = "Title is required")]
        [StringLength(255, ErrorMessage = "Title cannot exceed 255 characters")]
        [Display(Name = "Report Title")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "Year is required")]
        [Range(1900, 2100, ErrorMessage = "Year must be between 1900 and 2100")]
        [Display(Name = "Report Year")]
        public int Year { get; set; }

        [Required(ErrorMessage = "File URL is required")]
        [StringLength(500, ErrorMessage = "File URL cannot exceed 500 characters")]
        [Display(Name = "File URL")]
        public string FileUrl { get; set; } = string.Empty;

        [Required(ErrorMessage = "File size is required")]
        [Range(1, long.MaxValue, ErrorMessage = "File size must be greater than 0")]
        [Display(Name = "File Size (bytes)")]
        public long FileSize { get; set; }

        [StringLength(50, ErrorMessage = "Status cannot exceed 50 characters")]
        [Display(Name = "Status")]
        public string Status { get; set; } = "submitted";
    }
}