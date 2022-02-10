table 52223 RequestSetup
{
    Caption = 'Request Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; DefaultSerialNo; Code[10])
        {
            Caption = 'Default Serial No.';
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
