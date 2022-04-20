table 50202 Macronutrients
{
    Caption = 'Összetevők';
    DataClassification = ToBeClassified;

    LookupPageId = Macronutrients;
    DrillDownPageId = Macronutrients;
    
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Kód';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[20])
        {
            Caption = 'Leírás';
            DataClassification = CustomerContent;
        }
        field(3; Protein; Integer)
        {
            Caption = 'Fehérje';
            DataClassification = CustomerContent;
        }
        field(4; Fat; Integer)
        {
            Caption = 'Zsír';
            DataClassification = CustomerContent;
        }
        field(5; Carbohydrates; Integer)
        {
            Caption = 'Szénhidrát';
            DataClassification = CustomerContent;
        }
        field(6; "Unit of measure"; Code[10])
        {
            Caption = 'Mértékegység';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(7; KJ; Integer)
        {
            Caption = 'KJ';
            DataClassification = CustomerContent;
        }
        field(8; Kcal; Integer)
        {
            Caption = 'Kalória';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
