table 50206 "Posted Nutrition Orders Setup"
{
    Caption = 'Könyvelt táplálkozások beállítás';
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
    }
    keys
    {
        key(PK; PKEY)
        {
            Clustered = true;
        }
    }
}
