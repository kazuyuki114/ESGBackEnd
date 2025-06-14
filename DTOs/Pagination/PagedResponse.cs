namespace ESGBackEnd.DTOs.Pagination
{
    public class PagedResponse<T>
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalCount { get; set; }
        public int TotalPages { get; set; }
        public bool HasPrevious => PageNumber > 1;
        public bool HasNext => PageNumber < TotalPages;
        public List<T> Data { get; set; }
        
        public PagedResponse(List<T> data, int totalCount, int pageNumber, int pageSize)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
            TotalCount = totalCount;
            TotalPages = (int)Math.Ceiling(totalCount / (double)pageSize);
            Data = data;
        }
    }
}