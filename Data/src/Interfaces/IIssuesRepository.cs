using Shared.src.Models;

namespace Data.src.Interfaces
{
    public interface IIssuesRepository
    {
        public Task<Issue> CreateAsync(Issue issue);
        public Task<IEnumerable<Issue>> GetAllAsync();
        public Task<Issue> GetByIdAsync(int id);        
        public Task<Issue> UpdateAsync(int id, Issue issue);
        public void Delete(int id);
    }
}
