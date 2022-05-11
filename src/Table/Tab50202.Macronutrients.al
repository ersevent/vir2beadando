table 50202 Macronutrients
{
    Caption = 'Macronutrients';
    DataClassification = ToBeClassified;

    LookupPageId = Macronutrients;
    DrillDownPageId = Macronutrients;
    
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[20])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Protein; Integer)
        {
            Caption = 'Protein';
            DataClassification = CustomerContent;
        }
        field(4; Fat; Integer)
        {
            Caption = 'Fat';
            DataClassification = CustomerContent;
        }
        field(5; Carbohydrates; Integer)
        {
            Caption = 'Carbohydrates';
            DataClassification = CustomerContent;
        }
        field(6; "Unit of measure"; Code[10])
        {
            Caption = 'Unit of measure';
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
            Caption = 'Kcal';
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
