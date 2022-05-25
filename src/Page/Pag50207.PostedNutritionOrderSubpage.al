page 50207 "Posted Nutrition Order Subpage"
{
    Caption = 'Posted Nutrition';
    PageType = ListPart;
    SourceTable = "Posted Nutrition Line";
    Editable = false;
    CardPageId = "Posted Nutrition Order";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Protein; Rec.Protein)
                {
                    ApplicationArea = All;
                }
                field(Fat; Rec.Fat)
                {
                    ApplicationArea = All;
                }
                field(Carbohydrates; Rec.Carbohydrates)
                {
                    ApplicationArea = All;
                }
                field("Unit of measure"; Rec."Unit of measure")
                {
                    ApplicationArea = All;
                }
                field(KJ; Rec.KJ)
                {
                    ApplicationArea = All;
                }
                field(Kcal; Rec.Kcal)
                {
                    ApplicationArea = All;
                }
            }
            group(Total)
            {
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
        }
    }
}
