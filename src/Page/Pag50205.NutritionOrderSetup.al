page 50205 "Nutrition Order Setup"
{
    Caption = 'Táplálkozás beállítás';
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
            }
        }
    }
    trigger OnOpenPage()
    var
        no : Code[20];
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
        No := 'AAA123123';
        no := IncStr(No);
    end;
}
