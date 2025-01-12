/// <summary>
/// TableExtension CustomerExt (ID 50100) extends Record Customer.
/// </summary>
tableextension 52070 "KNHCustomerExt" extends Customer
{
    fields
    {
        field(50100; KNHCreditCardNo; Text[50])
        {
            Caption = 'Credit Card No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                MaskedCreditCard: Text[50];
            begin
                Rec.KNHCreditCardNo := MaskedCreditCard;
            end;
        }
    }

    /// <summary>
    /// PerformMasking.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure PerformMasking(): Text[50]
    begin
        if StrLen(Rec.KNHCreditCardNo) > 4 then
            exit('******' + Rec.KNHCreditCardNo.Substring(7, 4))
        else
            exit('');
    end;
}
