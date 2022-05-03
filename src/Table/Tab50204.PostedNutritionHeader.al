table 50204 "Posted Nutrition Header"
{
    Caption = 'Könyvelt táplálkozás';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Szám';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Vevő száma';
            DataClassification = CustomerContent;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Vevő neve';
            DataClassification = CustomerContent;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Dátum';
            DataClassification = CustomerContent;
        }
        field(7; "Total Protein"; Integer)
        {
            Caption = 'Összes fehérje';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Protein where("No." = field("No.")));
        }
        field(8; "Total Fat"; Integer)
        {
            Caption = 'Összes zsír';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Fat where("No." = field("No.")));
        }
        field(9; "Total Carbohydrates"; Integer)
        {
            Caption = 'Összes szénhidrát';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Carbohydrates where("No." = field("No.")));
        }
        field(10; "Total KJ"; Integer)
        {
            Caption = 'Összes KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".KJ where("No." = field("No.")));
        }
        field(11; "Total Kcal"; Integer)
        {
            Caption = 'Összes kalória';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Kcal where("No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
