page 50141 "My Seminars"
// CSD1.00 - 2018-01-01 - D. E. Veloper
//   Chapter 10 - Lab 1 - 4
//     - Created new page
{
    PageType = Listpart;
    SourceTable = "My Seminars";
    Caption = 'My Seminars';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Seminar No."; "Seminar No.")
                {
                    ApplicationArea=All;
                }
                field(Name; Seminar.Name)
                {
                    ApplicationArea=All;
                }
                field(Duration; Seminar."Seminar Duration")
                {
                    ApplicationArea=All;
                }
                field(Price; Seminar."Seminar Price")
                {
                    ApplicationArea=All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Open)
            {
                Image=Card;
                
                trigger OnAction();
                begin
                    OpenSeminarCard();
                end;
            }
        }
    }

    var
        Seminar: Record "CSD Seminar";

    trigger OnOpenPage();
    begin
        SetRange("User Id", UserId());
    end;

    trigger OnAfterGetRecord();
    begin
        if Seminar.get("Seminar No.") then;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Clear(Seminar);
    end;

    local procedure OpenSeminarCard();
    begin
        if Seminar."No." <> '' then
            Page.Run(Page::"CSD Seminar Card", Seminar);
    end;
}