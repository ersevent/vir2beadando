page 50208 "Posted Nutrition Orders"
{
    ApplicationArea = All;
    Caption = 'Posted Nutrition Orders';
    PageType = List;
    SourceTable = "Posted Nutrition Header";
    UsageCategory = History;
    CardPageId = "Posted Nutrition Order";
    
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
    actions
    {
        area(Processing)
        {
            action("Create Report")
            {
                Caption = 'Create Report';
                Image = Report;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    report.Run(Report::"Posted Nutrition Order Report", true, false, Rec);
                end;
            }
        }
    }
}
