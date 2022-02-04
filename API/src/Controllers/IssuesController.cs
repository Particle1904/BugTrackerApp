using Data.src.Interfaces;
using Data.src.Services;
using Microsoft.AspNetCore.Mvc;
using Shared.src.DTOs;
using Shared.src.Models;

namespace API.src.Controllers
{
    [ApiController]
    [Route("/api/v1/[controller]")]
    public class IssuesController : Controller
    {
        private readonly IIssuesRepository _issuesRepository;
        private readonly ObjectMapper _objectMapper;

        public IssuesController(IIssuesRepository issuesRepository, ObjectMapper objectMapper)
        {
            _issuesRepository = issuesRepository;
            _objectMapper = objectMapper;
        }

        [HttpPost]
        public async Task<ActionResult> Create([FromBody] IssueDto issueDto)
        {
            Issue issue = _objectMapper.MapIssueDtoToIssueModel(issueDto);

            await _issuesRepository.CreateAsync(issue);

            return Ok();
        }

        [HttpGet]
        public async Task<ActionResult> GetAll()
        {
            IEnumerable<Issue>? issues = await _issuesRepository.GetAllAsync();

            if (issues == null)
            {
                return NotFound();
            }

            List<IssueDto> issuesDto = new List<IssueDto>();
            foreach (Issue issue in issues)
            {
                if (issue.IsDeleted)
                {
                    continue;
                }
                IssueDto mappedIssue = _objectMapper.MapIssueModelToIssueDto(issue);
                issuesDto.Add(mappedIssue);
            }

            return Ok(issuesDto);
        }

        [HttpGet("get/{id}")]
        public async Task<ActionResult> GetById(int id)
        {
            Issue issue = await _issuesRepository.GetByIdAsync(id);
            if (issue == null)
            {
                return NotFound();
            }
            if (issue.IsDeleted)
            {
                return NotFound();
            }

            return Ok(_objectMapper.MapIssueModelToIssueDto(issue));
        }

        [HttpPut("update/{id}")]
        public async Task<ActionResult> Update(IssueDto issueDto)
        {
            Issue issue = _objectMapper.MapIssueDtoToIssueModel(issueDto);

            await _issuesRepository.UpdateAsync(issueDto.Id, issue);

            return Ok();
        }

        [HttpDelete("delete/{id}")]
        public ActionResult Delete(int id)
        {
            _issuesRepository.Delete(id);

            return Ok();
        }
    }
}
