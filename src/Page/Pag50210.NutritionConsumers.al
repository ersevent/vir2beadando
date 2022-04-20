page 50210 "Nutrition Consumers"
{
    ApplicationArea = All;
    Caption = 'Tápanyag fogyasztók';
    PageType = List;
    SourceTable = "Posted Nutrition Header";
    UsageCategory = Lists;
    CardPageId = "Nutrition Consumer";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
