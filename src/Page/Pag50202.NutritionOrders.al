page 50202 "Nutrition Orders"
{
    ApplicationArea = All;
    Caption = 'Táplálkozások';
    PageType = List;
    SourceTable = "Nutrition Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Nutrition Order";
    
    layout
    {
        area(content)
        {
            repeater(General)
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
        }
    }
}
