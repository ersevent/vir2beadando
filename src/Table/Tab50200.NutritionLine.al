table 50200 "Nutrition Line"
{
    Caption = 'Táplálkozás összetevők';
    DataClassification = ToBeClassified;
    LookupPageId = NutritionOrderSubpage;
    DrillDownPageId = NutritionOrderSubpage;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Szám';
            DataClassification = CustomerContent;
            TableRelation = "Nutrition Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Sorszám';
            DataClassification = CustomerContent;
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Kód';
            DataClassification = CustomerContent;
            TableRelation = Macronutrients."Code";

            trigger OnValidate()
            var
                recMacronutrients: Record Macronutrients;
            begin
                if recMacronutrients.Get(Rec."Code") then
                    begin
                        Rec.Protein := recMacronutrients.Protein;
                        Rec.Fat := recMacronutrients.Fat;
                        Rec.Carbohydrates := recMacronutrients.Carbohydrates;
                        Rec."Unit of measure" := recMacronutrients."Unit of measure";
                        Rec.KJ := recMacronutrients.KJ;
                        Rec.Kcal := recMacronutrients.Kcal;
                    end
                else
                    Rec."Protein" := 0;
                Rec.CalcFields(Description);
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Leírás';
            FieldClass = FlowField;
            CalcFormula = lookup(Macronutrients.Description where("Code" = field("Code")));     //keresek valamit
            Editable = false;   //flowfield mindig editable false
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Mennyiség';
            DataClassification = CustomerContent;
            InitValue = 1;

            trigger OnValidate()
            var
                recMacronutrients: Record Macronutrients;
            begin
                if recMacronutrients.Get(Rec."Code") then
                    Rec.Protein := recMacronutrients.Protein * Quantity;
                    Rec.Fat := recMacronutrients.Fat * Quantity;
                    Rec.Carbohydrates := recMacronutrients.Carbohydrates * Quantity;
                    Rec."Unit of measure" := recMacronutrients."Unit of measure";
                    Rec.KJ := recMacronutrients.KJ * Quantity;
                    Rec.Kcal := recMacronutrients.Kcal * Quantity;
            end;
        }
        field(6; Protein; Integer)
        {
            Caption = 'Fehérje';
            Editable = false; 
        }
        field(7; Fat; Integer)
        {
            Caption = 'Zsír';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; Carbohydrates; Integer)
        {
            Caption = 'Szénhidrát';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9; "Unit of measure"; Code[10])
        {
            Caption = 'Mértékegység';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; KJ; Integer)
        {
            Caption = 'KJ'; 
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; Kcal; Integer)
        {
            Caption = 'Kalória';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
