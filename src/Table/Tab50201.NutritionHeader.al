table 50201 "Nutrition Header"
{
    Caption = 'Táplálkozás';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'Szám';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Text[20])
        {
            Caption = 'Vevő száma';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            
            trigger OnValidate()
            var
                Customer: Record Customer;
                NutritionLine: Record "Nutrition Line";
                decProtein: Integer;
            begin
                if(Customer.get("Customer No.")) then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';

                //TODO total számitása
                if NutritionLine.FindSet() then begin
                    decProtein := 0;
                    repeat
                        decProtein += NutritionLine.Protein;
                    until NutritionLine.Next() = 0;
                    Rec."Total Protein" := decProtein;
                end
            end;
        }
        field(3; "Customer Name"; Text[20])
        {
            Caption = 'Vevő neve';
            DataClassification = CustomerContent;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Dátum';
            DataClassification = CustomerContent;
        }
        field(5; Status; enum "Sales Document Status")
        {
            Caption = 'Státusz';
            ValuesAllowed = 0, 1;
            DataClassification = CustomerContent;
        }
        field(6; "Delete after post"; Boolean)
        {
            Caption = 'Törlés könyvelés után';
            DataClassification = CustomerContent;
        }
        field(7; "Total Protein"; Integer)
        {
            Caption = 'Összes fehérje';
            DataClassification = CustomerContent;
        }
        field(8; "Total Fat"; Integer)
        {
            Caption = 'Összes zsír';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Fat where("No." = field("No.")));
        }
        field(9; "Total Carbohydrates"; Integer)
        {
            Caption = 'Összes szénhidrát';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Carbohydrates where("No." = field("No.")));
        }
        field(10; "Total KJ"; Integer)
        {
            Caption = 'Összes KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".KJ where("No." = field("No.")));
        }
        field(11; "Total Kcal"; Integer)
        {
            Caption = 'Összes kalória';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Kcal where("No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    
    trigger OnInsert()
    var
        NutrOrderSetup : Record "Nutrition Orders Setup";
        NoManagement : Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            NutrOrderSetup.Get();
            "No." := NoManagement.GetNextNo(NutrOrderSetup."No. Series",WORKDATE,true);
        end;
        Rec."Date" := System.Today();
    end;
}
