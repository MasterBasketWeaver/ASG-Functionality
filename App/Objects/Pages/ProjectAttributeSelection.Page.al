page 50100 "WSB ASG Proj. Attri. Selection"
{
    Caption = 'Select Attribute Filter';
    PageType = ConfirmationDialog;
    SourceTable = "Proj Attr. Value Selection PGS";
    LinksAllowed = false;
    DelayedInsert = true;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            field("Attribute Name"; Rec."Attribute Name")
            {
                ApplicationArea = all;
                TableRelation = "Project Attribute PGS".Name where(Blocked = const(false));
                Editable = true;
            }
            field("Attribute Value"; Rec.Value)
            {
                ApplicationArea = all;
                TableRelation = IF ("Attribute Type" = const(Option)) "Project Attribute Value PGS".Value where("Attribute ID" = field("Attribute ID"), Blocked = const(false));
                Editable = Rec."Attribute Name" <> '';
            }
        }
    }

    var
        InitName, InitValue : Text;

    trigger OnOpenPage()
    begin
        Rec.Init();
        if InitName <> '' then
            Rec."Attribute Name" := InitName;
        if InitValue <> '' then
            Rec.Value := InitValue;
        Rec.Insert(false);
    end;

    procedure SetValues(NewName: Text; NewValue: Text)
    begin
        InitName := NewName;
        InitValue := NewValue;
    end;

    procedure GetValues(var NewName: Text; var NewValue: Text)
    begin
        NewName := Rec."Attribute Name";
        NewValue := Rec.Value;
    end;
}