using Microsoft.EntityFrameworkCore;

using Shared.src.Models;

namespace Data.src
{
    public class SqliteDbContext : DbContext
    {
        public DbSet<Issue> Issues { get; set; }
        public SqliteDbContext(DbContextOptions<SqliteDbContext> options) : base(options)
        {
        }
    }
}
