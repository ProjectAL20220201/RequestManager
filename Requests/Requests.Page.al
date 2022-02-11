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
    CardPageId = "Request";
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
                    StyleExpr = StyleColorText;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Request Category"; Rec."Request Category")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Repairman Code"; Rec."Repairman Code")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Repairman Comment"; Rec."Repairman Comment")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Repairman Name"; Rec."Repairman Name")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Repairman Email"; Rec."Repairman Email")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer Full Name"; Rec."Customer Full Name")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer Phone No."; Rec."Customer Phone No.")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer City"; Rec."Customer City")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer Street"; Rec."Customer Street")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer House No."; Rec."Customer House No.")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
                }
                field("Customer Room"; Rec."Customer Room")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleColorText;
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
    var
        StyleColorText: Text;

    trigger OnAfterGetRecord()
    begin
        CheckStatus();
    end;

    trigger OnOpenPage()
    begin
        CheckStatus();
    end;

    local procedure CheckStatus()
    begin
        StyleColorText := 'Standard';
        if Status = Status::Canceled then
            StyleColorText := 'Subordinate'
        else begin
            if Priority = Priority::Emergency then
                StyleColorText := 'Unfavorable';
        end;
    end;
}
