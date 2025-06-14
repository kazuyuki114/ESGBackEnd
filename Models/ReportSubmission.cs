using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace ESGBackEnd.Models;

[Table("report_submissions")]
public class ReportSubmission : BaseModel
{
    [PrimaryKey("id", false)]
    public Guid Id { get; set; }

    [Column("company_id")]
    public Guid CompanyId { get; set; }

    [Column("title")]
    public string Title { get; set; } = string.Empty;

    [Column("year")]
    public int Year { get; set; }

    [Column("file_url")]
    public string FileUrl { get; set; } = string.Empty;

    [Column("file_size")]
    public long FileSize { get; set; }

    [Column("status")]
    public string Status { get; set; } = string.Empty;

    [Column("submitted_at")]
    public DateTime SubmittedAt { get; set; }
}