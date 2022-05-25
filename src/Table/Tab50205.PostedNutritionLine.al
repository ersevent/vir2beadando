table 50205 "Posted Nutrition Line"
{
    Caption = 'Posted Nutrition';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Nutrition No.';
            DataClassification = CustomerContent;
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
            trigger OnValidate()
            var
                recMacronutrients: Record Macronutrients;
            begin
                Rec.CalcFields(Description);
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Macronutrients.Description where("Code" = field("Code")));
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(6; Protein; Integer)
        {
            Caption = 'Protein';
            DataClassification = CustomerContent;
        }
        field(7; Fat; Integer)
        {
            Caption = 'Fat';
            DataClassification = CustomerContent;
        }
        field(8; Carbohydrates; Integer)
        {
            Caption = 'Carbohydrates';
            DataClassification = CustomerContent;
        }
        field(9; "Unit of measure"; Code[10])
        {
            Caption = 'Unit of measure';
            DataClassification = CustomerContent;
        }
        field(10; KJ; Integer)
        {
            Caption = 'KJ';
            DataClassification = CustomerContent;
        }
        field(11; Kcal; Integer)
        {
            Caption = 'Kcal';
            DataClassification = CustomerContent;
        }
        field(12; "Total Protein"; Integer)
        {
            Caption = 'Total Protein';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Protein where("No." = field("No.")));
        }
        field(13; "Total Fat"; Integer)
        {
            Caption = 'Total Fat';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Fat where("No." = field("No.")));
        }
        field(14; "Total Carbohydrates"; Integer)
        {
            Caption = 'Total Carbohydrates';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Carbohydrates where("No." = field("No.")));
        }
        field(15; "Total KJ"; Integer)
        {
            Caption = 'Total KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".KJ where("No." = field("No.")));
        }
        field(16; "Total Kcal"; Integer)
        {
            Caption = 'Total Kcal';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Kcal where("No." = field("No.")));
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
