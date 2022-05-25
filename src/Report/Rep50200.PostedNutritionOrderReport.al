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
            dataitem("PostedNutritionLine";"Posted Nutrition Line")
            {
                DataItemLinkReference = PostedNutritionHeader;
                DataItemLink = "No." = field("No.");

                column(Protein; "Protein")
                {
                }
                column(Fat; "Fat")
                {
                }
                column(Carbohydrates; "Carbohydrates")
                {
                }
                column(KJ; "KJ")
                {
                }
                column(Kcal; "Kcal")
                {
                }
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
