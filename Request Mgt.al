codeunit 52220 "Request Mgt"
{
    trigger OnRun()
    begin

    end;

    procedure Cancel(VAR Rec: Record Request)
    begin
        if Rec.Status = Rec.Status::Created then
            Rec.Status := Rec.Status::Canceled;
        if Rec.Status = Rec.Status::Assigned then
            Rec.Status := Rec.Status::Canceled;
    end;

    procedure Posted(VAR Rec: Record Request)
    begin
        IF Rec.Status = Rec.Status::Assigned THEN
            Rec.Status := Rec.Status::Posted;
    end;

    procedure Assigned(VAR Rec: Record Request)
    begin
        Rec.TESTFIELD(Rec."Repairman Code");
        IF (Rec."Repairman Code" <> ' ') AND (Rec.Status = Rec.Status::Created) THEN
            Rec.Status := Rec.Status::Assigned;
        Send(Rec);
    end;

    procedure Send(Rec: Record Request)
    begin
        IF Rec.Status = Rec.Status::Assigned THEN BEGIN
            SendMail.CreateMessage(COMPANYNAME, CompanyEmail, Repairman."E-mail", 'Request', '', TRUE);
            SendMail.AppendBody(MessageLetterTemplate);
            SendMail.Send;
        END;
    end;

    var
        SendMail: Codeunit "SMTP Mail";
        Repairman: Record Repairman;
        MessageLetterTemplate: Label 'You have received an application. Please go to your workspace in the app for more details.';
        CompanyEmail: Label 'CompanyName@company.com', Locked = true;
}