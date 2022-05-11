table 50203 "Nutrition Orders Setup"
{
    Caption = 'Nutrition Orders Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; PKEY; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(3; "Posted No. Series"; Code[20])
        {
            Caption = 'Posted No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
    keys
    {
        key(PK; PKEY)
        {
            Clustered = true;
        }
    }
}
