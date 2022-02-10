page 52223 FactBoxRequest
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Request;
    Editable = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Customer Request Count"; CustomerRequestCount)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetRange("Repairman Code");
                        CustomerRequestCount := Count;
                    end;

                }
                field("Address Request Count"; AddresRequestCount)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetRange("Customer City");
                        SetRange("Customer Street");
                        SetRange("Customer House No.");
                        SetRange("Customer Room");
                        AddresRequestCount := Count;
                    end;
                }
            }
        }
    }
    var
        CustomerRequestCount: Integer;
        AddresRequestCount: Integer;
}