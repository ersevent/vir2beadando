table 50204 "Posted Nutrition Header"
{
    Caption = 'Posted Nutrition Order';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Nutrition No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(7; "Total Protein"; Integer)
        {
            Caption = 'Total Protein';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Protein where("No." = field("No.")));
        }
        field(8; "Total Fat"; Integer)
        {
            Caption = 'Total Fat';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Fat where("No." = field("No.")));
        }
        field(9; "Total Carbohydrates"; Integer)
        {
            Caption = 'Total Carbohydrates';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".Carbohydrates where("No." = field("No.")));
        }
        field(10; "Total KJ"; Integer)
        {
            Caption = 'Total KJ';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Nutrition Line".KJ where("No." = field("No.")));
        }
        field(11; "Total Kcal"; Integer)
        {
            Caption = 'Total Kcal';
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
