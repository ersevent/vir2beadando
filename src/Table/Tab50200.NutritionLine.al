table 50200 "Nutrition Line"
{
    Caption = 'Nutritions';
    DataClassification = ToBeClassified;
    LookupPageId = NutritionOrderSubpage;
    DrillDownPageId = NutritionOrderSubpage;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Nutrition No.';
            DataClassification = CustomerContent;
            TableRelation = "Nutrition Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            TableRelation = Macronutrients."Code";

            trigger OnValidate()
            var
                recMacronutrients: Record Macronutrients;
            begin
                if recMacronutrients.Get(Rec."Code") then begin
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
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Macronutrients.Description where("Code" = field("Code")));
            Editable = false;   //flowfield mindig editable false
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Quantity';
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
            Caption = 'Protein';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; Fat; Integer)
        {
            Caption = 'Fat';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; Carbohydrates; Integer)
        {
            Caption = 'Carbohydrates';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9; "Unit of measure"; Code[10])
        {
            Caption = 'Unit of measure';
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
            Caption = 'Kcal';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(12; "Total Protein"; Integer)
        {
            Caption = 'Total Protein';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Protein where("No." = field("No.")));
        }
        field(13; "Total Fat"; Integer)
        {
            Caption = 'Total Fat';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Fat where("No." = field("No.")));
        }
        field(14; "Total Carbohydrates"; Integer)
        {
            Caption = 'Total Carbohydrates';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".Carbohydrates where("No." = field("No.")));
        }
        field(15; "Total KJ"; Integer)
        {
            Caption = 'Total KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Nutrition Line".KJ where("No." = field("No.")));
        }
        field(16; "Total Kcal"; Integer)
        {
            Caption = 'Total Kcal';
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
