page 52221 Requests
{
    ApplicationArea = All;
    Caption = 'Requests';
    PageType = List;
    SourceTable = Request;
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Request Category"; Rec."Request Category")
                {
                    ApplicationArea = All;
                }
                field("Repairman Code"; Rec."Repairman Code")
                {
                    ApplicationArea = All;
                }
                field("Repairman Comment"; Rec."Repairman Comment")
                {
                    ApplicationArea = All;
                }
                field("Repairman Name"; Rec."Repairman Name")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Full Name"; Rec."Customer Full Name")
                {
                    ApplicationArea = All;
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Customer City"; Rec."Customer City")
                {
                    ApplicationArea = All;
                }
                field("Customer Street"; Rec."Customer Street")
                {
                    ApplicationArea = All;
                }
                field("Customer House No."; Rec."Customer House No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Room"; Rec."Customer Room")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Request Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Report.Run(Report::"Requests Report", FALSE, TRUE, Rec);
                end;
            }
        }
    }
}
