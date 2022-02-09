page 52221 Requests
{
    ApplicationArea = All;
    Caption = 'Requests';
    PageType = List;
    SourceTable = Request;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.';
                    ApplicationArea = All;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ToolTip = 'Specifies the value of the Creation Time field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ToolTip = 'Specifies the value of the Priority field.';
                    ApplicationArea = All;
                }
                field("Request Category"; Rec."Request Category")
                {
                    ToolTip = 'Specifies the value of the Request Category field.';
                    ApplicationArea = All;
                }
                field("Repairman Code"; Rec."Repairman Code")
                {
                    ToolTip = 'Specifies the value of the Repairman Code field.';
                    ApplicationArea = All;
                }
                field("Repairman Comment"; Rec."Repairman Comment")
                {
                    ToolTip = 'Specifies the value of the Repairman Comment field.';
                    ApplicationArea = All;
                }
                field("Repairman Name"; Rec."Repairman Name")
                {
                    ToolTip = 'Specifies the value of the Repairman Name field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Full Name"; Rec."Customer Full Name")
                {
                    ToolTip = 'Specifies the value of the Customer Full Name field.';
                    ApplicationArea = All;
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ToolTip = 'Specifies the value of the Customer Phone No. field.';
                    ApplicationArea = All;
                }
                field("Customer City"; Rec."Customer City")
                {
                    ToolTip = 'Specifies the value of the Customer City field.';
                    ApplicationArea = All;
                }
                field("Customer Street"; Rec."Customer Street")
                {
                    ToolTip = 'Specifies the value of the Customer Street field.';
                    ApplicationArea = All;
                }
                field("Customer House No."; Rec."Customer House No.")
                {
                    ToolTip = 'Specifies the value of the Customer House No. field.';
                    ApplicationArea = All;
                }
                field("Customer Room"; Rec."Customer Room")
                {
                    ToolTip = 'Specifies the value of the Customer Room field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
