table 52222 Request
{
    Caption = 'Request';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(20; "User ID"; Code[20])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(30; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(31; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(40; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = Created,Assigned,Canceled,Posted;
            Editable = false;
        }
        field(50; Priority; Option)
        {
            Caption = 'Priority';
            DataClassification = CustomerContent;
            OptionMembers = Low,High,Emergency;
        }
        field(60; "Request Category"; Enum Category)
        {
            Caption = 'Request Category';
            DataClassification = CustomerContent;
            //TableRelation = IF ("Request Category"=filter(Electrician or SanitaryEngineering or Gas)) Repairman.Code WHERE (Request Category=FIELD(Request Category)) ELSE IF (Request Category=CONST(" ")) Repairman.Code;
        }
        field(70; "Repairman Code"; Code[20])
        {
            Caption = 'Repairman Code';
            DataClassification = CustomerContent;
            TableRelation =
                if ("Request Category" = filter(Electrician | "Sanitary engineering" | Gas)) Repairman.Code where("Request Category" = field("Request Category"))
            else
            if ("Request Category" = const(" ")) Repairman.Code;
            trigger OnValidate()
            begin
                CheckStatus();
            end;
        }
        field(71; "Repairman Comment"; Text[250])
        {
            Caption = 'Repairman Comment';
            DataClassification = CustomerContent;
        }
        field(72; "Repairman Name"; Text[50])
        {
            Caption = 'Repairman Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Repairman.Name where(Code = field("Repairman Code")));
            Editable = false;
        }
        field(80; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
            FieldClass = Normal;
            trigger OnValidate()
            begin
                CopyFromCustomer();
            end;
        }
        field(81; "Customer Full Name"; Text[100])
        {
            Caption = 'Customer Full Name';
            DataClassification = CustomerContent;
        }
        field(82; "Customer Phone No."; Code[30])
        {
            Caption = 'Customer Phone No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CheckCustomerPhone();
            end;
        }
        field(83; "Customer City"; Text[50])
        {
            Caption = 'Customer City';
            DataClassification = CustomerContent;
        }
        field(84; "Customer Street"; Text[100])
        {
            Caption = 'Customer Street';
            DataClassification = CustomerContent;
        }
        field(85; "Customer House No."; Code[10])
        {
            Caption = 'Customer House No.';
            DataClassification = CustomerContent;
        }
        field(86; "Customer Room"; Code[10])
        {
            Caption = 'Customer Room';
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
    begin
        InitValues();
    end;

    local procedure CopyFromCustomer()
    var
        Customer: Record Customer;
    begin
        if Customer.get(Rec."Customer No.") then begin
            "Customer Full Name" := Customer.Contact;
            "Customer Phone No." := Customer."Phone No.";
            "Customer City" := Customer.City;
        end;
    end;

    local procedure InitValues()
    begin
        "User ID" := UserId;
        "Creation Date" := Today;
        "Creation Time" := Time;
    end;

    local procedure CheckStatus()
    begin
        Rec.TestField("Repairman Code");
        if "Repairman Code" <> '' then
            Status := Status::Assigned
        else
            Status := Status::Created;
    end;

    local procedure CheckCustomerPhone()
    var
        NotAvailableSymbols: Label '!`~@#$%^&*()_+|}{[]\"?><,./;№QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm', Locked = true;
    begin
        "Customer Phone No." := DELCHR("Customer Phone No.", '=', NotAvailableSymbols);
    end;
}
