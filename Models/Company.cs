using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace ESGBackEnd.Models;

[Table("companies")]
public class Company : BaseModel
{
    [PrimaryKey("id", false)]
    public Guid Id { get; set; }

    [Column("name")]
    public string Name { get; set; } = string.Empty;

    [Column("slug")]
    public string Slug { get; set; } = string.Empty;

    [Column("industry_id")]
    public Guid IndustryId { get; set; }

    [Column("is_verified")]
    public bool IsVerified { get; set; }

    [Column("status")]
    public string Status { get; set; } = string.Empty;

    [Column("created_at")]
    public DateTime CreatedAt { get; set; }

    [Column("updated_at")]
    public DateTime UpdatedAt { get; set; }

    [Column("email")]
    public string Email { get; set; } = string.Empty;

    [Column("phone")]
    public string Phone { get; set; } = string.Empty;
}