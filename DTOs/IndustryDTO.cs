namespace ESGBackEnd.DTOs
{
    public class IndustryDTO
    {
        public Guid Id { get; set; }
        public required string Name { get; set; }
        public required string Code { get; set; }
    }
}