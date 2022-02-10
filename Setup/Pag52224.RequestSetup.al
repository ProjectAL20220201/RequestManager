page 52224 "Request Setup"
{
    Caption = 'Request Setup';
    PageType = Card;
    SourceTable = RequestSetup;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DefaultSerialNo; Rec.DefaultSerialNo)
                {
                    ToolTip = 'Specifies the value of the Default Serial No. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
