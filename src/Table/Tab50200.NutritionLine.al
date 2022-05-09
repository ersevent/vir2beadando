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
            Caption = 'Táplálkozás szám';
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
                    end;
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
                NutritionManagement.CalcQuantity(Rec, recMacronutrients);
            end;
        }
        field(6; Protein; Integer)
        {
            Caption = 'Fehérje';
            DataClassification = CustomerContent;
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
        field(12; "Total Protein"; Integer)
        {
            Caption = 'Összes fehérje';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Protein where("No." = field("No.")));
        }
        field(13; "Total Fat"; Integer)
        {
            Caption = 'Összes zsír';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Fat where("No." = field("No.")));
        }
        field(14; "Total Carbohydrates"; Integer)
        {
            Caption = 'Összes szénhidrát';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Carbohydrates where("No." = field("No.")));
        }
        field(15; "Total KJ"; Integer)
        {
            Caption = 'Összes KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".KJ where("No." = field("No.")));
        }
        field(16; "Total Kcal"; Integer)
        {
            Caption = 'Összes kalória';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Kcal where("No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        NutritionManagement: Codeunit "Nutrition Management";
}
