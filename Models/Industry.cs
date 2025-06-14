using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace ESGBackEnd.Models;

[Table("industries")]
public class Industry : BaseModel
{
    [PrimaryKey("id", false)]
    public Guid Id { get; set; }
    [Column("name")]
    public string Name { get; set; } = string.Empty;
    [Column("code")]
    public string Code { get; set; } = string.Empty;
}