table 50201 "Nutrition Header"
{
    Caption = 'Nutrition Order';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'Nutrition No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if(Customer.get("Customer No.")) then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';
            end;
        }
        field(3; "Customer Name"; Text[20])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; Status; enum "Sales Document Status")
        {
            Caption = 'Status';
            ValuesAllowed = 0, 1;
            DataClassification = CustomerContent;
        }
        field(6; "Delete after post"; Boolean)
        {
            Caption = 'Delete after post';
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
    
    trigger OnInsert()
    var
        NutrOrderSetup : Record "Nutrition Orders Setup";
        NoManagement : Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            NutrOrderSetup.Get();
            "No." := NoManagement.GetNextNo(NutrOrderSetup."No. Series",WORKDATE,true);
        end;
        Rec."Date" := System.Today();
    end;
}
