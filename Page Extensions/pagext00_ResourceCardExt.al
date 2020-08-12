pageextension 50100 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {
                ApplicationArea = all;
            }
            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {
                ApplicationArea = all;
            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
            }
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                ApplicationArea = all;
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
}