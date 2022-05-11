page 50205 "Nutrition Order Setup"
{
    Caption = 'Nutrition Order Setup';
    PageType = Card;
    SourceTable = "Nutrition Orders Setup";
    UsageCategory = Administration;
    ApplicationArea = all;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("Posted No. Series"; Rec."Posted No. Series")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
