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
    actions{
        area(Processing)
        {
            action(Release)
            {
                Caption = 'Release';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    //Message(NotImplementedError, UserId());
                    NutritionManagement.ChangeStatus(Rec, Rec.Status::Released);
                end;
            }
            action(Reopen)
            {
                Caption = 'Reopen';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    NutritionManagement.ChangeStatus(Rec, Rec.Status::Open);
                end;
            }
            action(PostDocument)
            {
                Caption = 'Post';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
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
                Caption = 'Export';
                Image = Export;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
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
                Promoted = true;        //főtáblán is jelenjen meg
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

    /* trigger OnAfterGetRecord()      //total kiszámitása miután a record kész van, flowfield helyett
    var
        tempProtein: Integer;
        tempFat: Integer;
        tempCarbohydrates: Integer;
        tempKJ: Integer;
        tempKcal: Integer;
        NutritionLine: Record "Nutrition Line";
    begin
        NutritionLine.Reset();
        NutritionLine.SetRange("No.", Rec."No.");
        if NutritionLine.FindSet() then begin
            tempProtein := 0;
            tempFat := 0;
            tempCarbohydrates := 0;
            tempKJ := 0;
            tempKcal := 0;
            repeat
                tempProtein += NutritionLine.Protein;
                tempFat += NutritionLine.Fat;
                tempCarbohydrates += NutritionLine.Carbohydrates;
                tempKJ += NutritionLine.KJ;
                tempKcal += NutritionLine.Kcal;
            until NutritionLine.Next() = 0;
            end;
        Rec."Total Protein" := tempProtein;
        Rec."Total Fat" := tempFat;
        Rec."Total Carbohydrates" := tempCarbohydrates;
        Rec."Total KJ" := tempKJ;
        Rec."Total Kcal" := tempKcal;
    end; */
    
    var
        PageEditable: Boolean;
        NotImplementedError: Label 'Nincs implementálva %1';
        NutritionManagement: Codeunit "Nutrition Management";
}
