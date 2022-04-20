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
            DataClassification = CustomerContent;
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
}
