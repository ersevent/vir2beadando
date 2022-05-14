query 50201 "Nutrition Query"
{
    Caption = 'Nutrition Query';
    QueryType = Normal;
    
    elements
    {
        dataitem(NutritionHeader; "Nutrition Header")
        {
            column(No; "No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column("Date"; "Date")
            {
            }
            dataitem(NutritionLine; "Nutrition Line")
            {
                DataItemLink = "No." = NutritionHeader."No.";
                column(Protein; Protein)
                {
                }
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    end;
}
