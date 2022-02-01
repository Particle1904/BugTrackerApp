using System.ComponentModel.DataAnnotations;

namespace Shared.src.DTOs
{
    public class IssueDto
    {
        public int Id { get; set; }
        [Required]
        [StringLength(128)]
        public string Title { get; set; }
        [Required]
        [StringLength(2000)]
        public string Description { get; set; }
        public bool IsFixed { get; set; }
        public DateTime CreationDate { get; set; } = DateTime.UtcNow;
        public DateTime ModifiedDate { get; set; }
    }
}
