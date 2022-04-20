page 50201 "Nutrition Order"
{
    Caption = 'Táplálkozás';
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
                    Visible = false;
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
            part("Nutrion List"; "NutritionOrderSubpage")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = All;
            }

            group(Total)
            {
                field("Total Protein"; Rec."Total Protein")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Fat"; Rec."Total Fat")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Carbohydrates"; Rec."Total Carbohydrates")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total KJ"; Rec."Total KJ")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Kcal"; Rec."Total Kcal")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions{
        area(Processing)
        {
            action(ChangeStatus)
            {
                Caption = 'Táplálkozás lezárása';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    NotImplementedError: Label 'Not Implemented %1';
                begin
                    //Message(NotImplementedError, UserId());
                    Rec.TestField(Rec."Customer No.");
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify();
                end;
            }
            action(Reopen)
            {
                Caption = 'Táplálkozás újranyitása';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    NotImplementedError: Label 'Nincs implementálva %1';
                begin
                    NutrionManagement.ChangeStatus(Rec, Rec.Status::Open);
                end;
            }
            action(PostDocument)
            {
                Caption = 'Könyvelés';
                Image = Stages;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    NotImplementedError: Label 'Nincs implementálva %1';
                begin
                    NutrionManagement.PostNutrionOrder(Rec);
                end;
            }
            action(ExportOrders)
            {
                Caption = 'Táplálkozás exportálása';
                Image = Export;
                ApplicationArea = All;
                Promoted = true;        //főtáblán is jelenjen meg
                PromotedOnly = true;
                PromotedIsBig = true;
                //TODO csak 1 recordot exportáljon
                trigger OnAction()
                begin
                    Xmlport.Run(50200, true, false);
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
        NutrionManagement: Codeunit "Nutrion Management";
}
