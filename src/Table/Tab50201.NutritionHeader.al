table 50201 "Nutrition Header"
{
    Caption = 'Táplálkozás';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'Táplálkozási szám';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Vevő száma';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if(Customer.get("Customer No.")) then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';
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
            Editable = false;
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
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Protein where("No." = field("No.")));
            Editable = false;  //flowfield mindig editable false
        }
        field(8; "Total Fat"; Integer)
        {
            Caption = 'Összes zsír';
            DataClassification = CustomerContent;
        }
        field(9; "Total Carbohydrates"; Integer)
        {
            Caption = 'Összes szénhidrát';
            DataClassification = CustomerContent;
        }
        field(10; "Total KJ"; Integer)
        {
            Caption = 'Összes KJ';
            DataClassification = CustomerContent;
        }
        field(11; "Total Kcal"; Integer)
        {
            Caption = 'Összes kalória';
            DataClassification = CustomerContent;
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
