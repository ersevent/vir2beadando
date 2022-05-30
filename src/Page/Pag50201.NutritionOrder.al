page 50201 "Nutrition Order"
{
    Caption = 'Nutrition Order';
    PageType = Document;
    SourceTable = "Nutrition Header";

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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Delete after post"; Rec."Delete after post")
                {
                    ApplicationArea = All;
                }
            }
            part("Nutrition List"; "NutritionOrderSubpage")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Release)
            {
                Caption = 'Release';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    NutritionManagement.ChangeStatus(Rec, Rec.Status::Released);
                    NutritionOrder.SetRecord(Rec);
                    CurrPage.Close();
                    NutritionOrder.Run();
                end;
            }
            action(Reopen)
            {
                Caption = 'Reopen';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    NutritionManagement.ChangeStatus(Rec, Rec.Status::Open);
                    NutritionOrder.SetRecord(Rec);
                    CurrPage.Close();
                    NutritionOrder.Run();
                end;
            }
            action(PostDocument)
            {
                Caption = 'Post';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    NutritionManagement.PostNutritionOrder(Rec);
                end;
            }
            action(ExportOrders)
            {
                Caption = 'Export XML';
                Image = Export;
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Xmlport.Run(50200, false, false, Rec);
                end;
            }
            action(Query)
            {
                Caption = 'Query';
                Image = Export;
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                trigger OnAction()
                var
                    MyQuery: Query "Nutrition Query";
                    OutputText: Label 'Customer name = %1, Protein = %2';
                begin
                    MyQuery.Open;
                    while MyQuery.Read do
                        Message(OutputText, MyQuery.CustomerName, MyQuery.Protein);
                    MyQuery.Close;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        PageEditable := Rec.Status = Rec.Status::Open;      //page megnyitásánlá eldől hogy status az open vagy released
        CurrPage.Editable(PageEditable);
    end;

    var
        PageEditable: Boolean;
        NutritionOrder: Page "Nutrition Order";
        NutritionManagement: Codeunit "Nutrition Management";
}
