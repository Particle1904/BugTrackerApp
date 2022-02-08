using Shared.src.Models;

namespace Data.src.Interfaces
{
    public interface IIssuesRepository
    {
        public Task<Issue> CreateAsync(Issue issue);
        public Task<IEnumerable<Issue>> GetPaginated(int skip = 0, int take = 25);
        public Task<int> GetIssuesCount();
        public Task<Issue?> GetByIdAsync(int id);
        public Task<Issue?> UpdateAsync(int id, Issue issue);
        public void Delete(int id);
    }
}
