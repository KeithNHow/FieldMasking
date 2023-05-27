/// <summary>
/// PageExtension KNH Customer Card Ext (ID 50100) extends Record Customer Card.
/// </summary>
pageextension 52070 "KNHCustomerCardExt" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(KNHCreditCardNo; Rec.KNHCreditCardNo)
            {
                ApplicationArea = All;
                Caption = 'Credit Card No.';
                ToolTip = 'Credit Card No.';
                trigger OnValidate()
                begin
                    if StrLen(Rec.KNHCreditCardNo) < 5 then
                        Error('Not a valid credit card');
                end;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord()
    begin
        Rec.KNHCreditCardNo := Customer.PerformMasking();
    end;

    var
        Customer: Record Customer;
}
