page 50206 "Posted Nutrition Order"
{
    Caption = 'Posted Nutrition Order';
    PageType = Document;
    SourceTable = "Posted Nutrition Header";
    Editable = false;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
            }
            part(PostedNutrionLine;"Posted Nutrition Order Subpage")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}
