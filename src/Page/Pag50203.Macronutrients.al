page 50203 "Macronutrients"
{
    ApplicationArea = All;
    Caption = 'Összetevők';
    PageType = List;
    SourceTable = Macronutrients;
    UsageCategory = Lists;
    CardPageId = Macronutrient;
    
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
        }
    }
}
