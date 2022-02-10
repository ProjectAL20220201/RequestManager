table 52221 Repairman
{
    Caption = 'Repairman';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(30; "E-mail"; Text[80])
        {
            Caption = 'E-mail';
            ExtendedDatatype = EMail;
            DataClassification = CustomerContent;
            //if (STRPOS("E-mail", '@') < 4) AND (STRPOS("E-mail", '.') <= 1) THEN
            //    ERROR(EmailError);
            //if (STRLEN(STRSUBSTNO("E-mail",'@','.'))<4) AND ((STRLEN("E-mail")-STRPOS("E-mail",'.'))<3) THEN
            //    ERROR(EmailError);
            trigger OnValidate()
            begin
                CheckEmail();
            end;
        }
        field(40; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckPhone();
            end;
        }
        field(50; "Request Category"; Enum Category)
        {
            Caption = 'Request Category';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    local procedure CheckPhone()
    var
        NotAvailableSymbols: Label '!`~@#$%^&*()_+|}{[]\"?><,./;№QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm', Locked = true;
    begin
        "Phone No." := DelChr("Phone No.", '=', NotAvailableSymbols);
    end;

    local procedure CheckEmail()
    var
        EmailError: Label 'Wrong email';
    begin
        if (STRPOS("E-mail", '@') < 4) and (STRPOS("E-mail", '.') <= 1) then
            ERROR(EmailError);
        if (STRLEN(STRSUBSTNO("E-mail", '@', '.')) < 4) and ((STRLEN("E-mail") - STRPOS("E-mail", '.')) < 3) then
            ERROR(EmailError);
    end;
}
