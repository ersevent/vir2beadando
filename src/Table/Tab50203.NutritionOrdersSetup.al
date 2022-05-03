table 50203 "Nutrition Orders Setup"
{
    Caption = 'Táplálkozások beállítás';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; PKEY; Code[10])
        {
            Caption = 'Elsődleges kulcs';
            DataClassification = ToBeClassified;
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'Sorszám';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(3; "Posted No. Series"; Code[20])
        {
            Caption = 'Könyvelt sorszám';
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
