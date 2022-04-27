page 50206 "Posted Nutrition Order"
{
    Caption = 'Könyvelt táplálkozás';
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
                field("Total Protein"; Rec."Total Protein")
                {
                    ApplicationArea = All;
                }
                field("Total Fat"; Rec."Total Fat")
                {
                    ApplicationArea = All;
                }
                field("Total Carbohydrates"; Rec."Total Carbohydrates")
                {
                    ApplicationArea = All;
                }
                field("Total KJ"; Rec."Total KJ")
                {
                    ApplicationArea = All;
                }
                field("Total Kcal"; Rec."Total Kcal")
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
