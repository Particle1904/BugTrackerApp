namespace Client.Pages
{
    public static class Utilities
    {
        public static string FormatDateText(DateTime date)
        {
            return $"{date.ToString("dd/MM/yy hh:mm tt")}";
        }
    }
}
