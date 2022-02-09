report 52220 "Requests Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report.rdl';

    dataset
    {
        dataitem(Repairman; Repairman)
        {
            RequestFilterFields = "Code";
            column(Name; Repairman.Name)
            {
            }
            dataitem(Request; Request)
            {
                DataItemLinkReference = Repairman;
                DataItemLink = "Repairman Code" = field("Code");
                RequestFilterFields = "Creation Date", "Repairman Code";
                column(Creation_Date; "Creation Date")
                {
                }
                column(Customer_City; "Customer City")
                {
                }
                column(Customer_Street; "Customer Street")
                {
                }
                column(Customer_House_No_; "Customer House No.")
                {
                }
                column(Customer_Room; "Customer Room")
                {
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                // group(GroupName)
                // {
                //     field(Name; SourceExpression)
                //     {
                //         ApplicationArea = All;

                //     }
                // }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}