report 50200 "Posted Nutrition Order Report"
{
    ApplicationArea = All;
    Caption = 'Posted Nutrition Order Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'NutritionOrderReport.rdl';
    dataset
    {
        dataitem(PostedNutritionHeader; "Posted Nutrition Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "Customer Name", "Date";
            column(No; "No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(Date; "Date")
            {
            }
            column(TotalProtein; "Total Protein")
            {
            }
            column(TotalFat; "Total Fat")
            {
            }
            column(TotalCarbohydrates; "Total Carbohydrates")
            {
            }
            column(TotalKJ; "Total KJ")
            {
            }
            column(TotalKcal; "Total Kcal")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
