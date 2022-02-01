using Shared.src.DTOs;
using Shared.src.Models;

namespace Data.src.Services
{
    public class ObjectMapper
    {
        public ObjectMapper()
        { 
        }

        public Issue MapIssueDtoToIssueModel(IssueDto issueDto)
        {
            Issue mappedModel = new Issue()
            {
                Id = issueDto.Id,
                Title = issueDto.Title,
                Description = issueDto.Description,
                IsFixed = issueDto.IsFixed,
                CreationDate = issueDto.CreationDate,
                ModifiedDate = issueDto.ModifiedDate
            };

            return mappedModel;
        }

        public IssueDto MapIssueModelToIssueDto(Issue issueModel)
        {
            IssueDto mappedDto = new IssueDto()
            {
                Id = issueModel.Id,
                Title = issueModel.Title,
                Description = issueModel.Description,
                IsFixed = issueModel.IsFixed,
                CreationDate = issueModel.CreationDate,
                ModifiedDate = issueModel.ModifiedDate
            };

            return mappedDto;
        }
    }
}
