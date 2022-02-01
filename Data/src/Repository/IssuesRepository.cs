﻿using System.Linq;
using Microsoft.EntityFrameworkCore;

using Shared.src.Models;
using Data.src.Services;
using Data.src.Interfaces;

namespace Data.src.Repository
{
    public class IssuesRepository : IIssuesRepository
    {
        private readonly SqliteDbContext _dbContext;
        public IssuesRepository(SqliteDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        /// <summary>
        /// Create a new Issue in the DataBase.
        /// </summary>
        /// <param name="issue"> The Issue Model to create. </param>
        /// <returns></returns>
        public async Task<Issue> CreateAsync(Issue issue)
        {           
            await _dbContext.Issues.AddAsync(issue);
            await _dbContext.SaveChangesAsync();

            return issue;
        }
        /// <summary>
        /// Get a list of all Issues in the DataBase.
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Issue>> GetAllAsync()
        {
            return await _dbContext.Issues.ToListAsync();
        }
        /// <summary>
        /// Get an existing Issue by its Id.
        /// </summary>
        /// <param name="id"> The Issue Id. </param>
        /// <returns></returns>
        public async Task<Issue> GetByIdAsync(int id)
        {
            return await _dbContext.Issues.FirstOrDefaultAsync(x => x.Id == id);
        }
        /// <summary>
        /// Update an existing Issue in the DataBase.
        /// </summary>
        /// <param name="id"> The Issue Id. </param>
        /// <param name="issue"> The updated Issue Model. </param>
        /// <returns></returns>
        public async Task<Issue> UpdateAsync(int id, Issue issue)
        {
            Issue issueFromDb = await _dbContext.Issues.FirstOrDefaultAsync(issue => issue.Id == id);
            if (issueFromDb != null)
            {
                issueFromDb.Title = issue.Title;
                issueFromDb.Description = issue.Description;
                issueFromDb.IsFixed = issue.IsFixed;
                issueFromDb.ModifiedDate = issue.ModifiedDate;
                await _dbContext.SaveChangesAsync();
            }

            return issueFromDb;
        }
        /// <summary>
        /// Delete and existing Issue in the DataBase.
        /// </summary>
        /// <param name="id"> The Issue Id. </param>
        public void Delete(int id)
        {
            Issue? issue = _dbContext.Issues.FirstOrDefault(issue => issue.Id == id);
            if (issue != null)
            {
                issue.IsDeleted = true;
                _dbContext.SaveChanges();
            }
        }
    }
}