page 52222 "Request"
{
    Caption = 'Request';
    PageType = Document;
    SourceTable = Request;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = RepFieldEditalbe;
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    var
                        NoSeriesManagement: Codeunit NoSeriesManagement;
                        RequestSetup: Record RequestSetup;
                    begin
                        if Status = Status::Created then begin
                            RequestSetup.Get();
                            if NoSeriesManagement.SelectSeries(RequestSetup.DefaultSerialNo, '', Rec."No.") then
                                NoSeriesManagement.SetSeries(Rec."No.");
                        end;
                    end;
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
            }
            group(Repairman)
            {
                Caption = 'Repairman';
                Editable = RepFieldEditalbe;
                field("Repairman Code"; Rec."Repairman Code")
                {
                    ToolTip = 'Specifies the value of the Repairman Code field.';
                    ApplicationArea = All;
                }
                field("Repairman Name"; Rec."Repairman Name")
                {
                    ToolTip = 'Specifies the value of the Repairman Name field.';
                    ApplicationArea = All;
                }
                field("Repairman Comment"; Rec."Repairman Comment")
                {
                    ToolTip = 'Specifies the value of the Repairman Comment field.';
                    ApplicationArea = All;
                    Editable = RepairmanCommentEditable;
                }
            }
            group(Customer)
            {
                Caption = 'Customer';
                Editable = RepFieldEditalbe;
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
        area(FactBoxes)
        {
            part(Requests; FactBoxRequest)
            {
                SubPageLink = "No." = field("No.");
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action(Assigned)
            {
                ApplicationArea = All;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    "Request Mgt".Assigned(Rec);
                end;
            }
            action(Posted)
            {
                ApplicationArea = All;
                Image = PostSendTo;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    "Request Mgt".Posted(Rec);
                end;
            }
            action(Canceled)
            {
                ApplicationArea = All;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    "Request Mgt".Cancel(Rec);
                end;
            }
        }

    }
    trigger OnOpenPage()
    begin
        if Status = Status::Created then begin
            RepFieldEditalbe := true;
            RepairmanCommentEditable := true;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        SetEditable();
    end;

    var
        "Request Mgt": Codeunit "Request Mgt";
        RepFieldEditalbe: Boolean;
        RepairmanCommentEditable: Boolean;

    local procedure SetEditable()
    begin
        RepFieldEditalbe := TRUE;
        RepairmanCommentEditable := TRUE;
        IF Status = Status::Assigned THEN
            RepFieldEditalbe := FALSE;
        IF (Status = Status::Canceled) OR (Status = Status::Posted) THEN BEGIN
            RepFieldEditalbe := FALSE;
            RepairmanCommentEditable := FALSE;
        END;
    end;
}
