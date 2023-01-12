reportextension 50100 "WSB ASG Create Proj. Invs." extends "Create Project Invoices (PGS)"
{
    dataset
    {
        modify(Job)
        {
            RequestFilterFields = "Ending Date";

            trigger OnAfterAfterGetRecord()
            begin
                SetJobFilter();
            end;
        }
    }


    requestpage
    {
        layout
        {
            addlast(Options)
            {
                group("WSB ASG Attributes")
                {
                    Caption = 'Project Attribute Filter';

                    field("WSB ASG Name"; AttributeName)
                    {
                        ApplicationArea = all;
                        Caption = 'Name';
                        Editable = false;

                        trigger OnDrillDown()
                        begin
                            AttributeLookup();
                        end;

                    }
                    field("WSB ASG Value"; AttributeValue)
                    {
                        ApplicationArea = all;
                        Caption = 'Value';
                        Editable = false;

                        trigger OnDrillDown()
                        begin
                            AttributeLookup();
                        end;
                    }
                }
            }
        }
    }

    var
        AttributeName, AttributeValue : Text;


    local procedure AttributeLookup()
    var
        ProjAttrSel: Page "WSB ASG Proj. Attri. Selection";
    begin
        ProjAttrSel.SetValues(AttributeName, AttributeValue);
        if ProjAttrSel.RunModal() = Action::Yes then
            ProjAttrSel.GetValues(AttributeName, AttributeValue);
    end;

    local procedure SetJobFilter()
    var
        JobNoFilter, AttributeFilter : text;
        Attribute: Record "Project Attribute PGS";
        AttributeValueRec: Record "Project Attribute Value PGS";
        AttrMapping: Record "Proj Attr. Value Mapping PGS";
    begin
        if (AttributeName = '') or (AttributeValue = '') then
            exit;
        Attribute.SetRange(Name, AttributeName);
        if not Attribute.FindFirst() then
            exit;
        AttributeValueRec.SetRange("Attribute ID", Attribute.ID);
        AttributeValueRec.SetRange(Value, AttributeValue);
        if not AttributeValueRec.FindFirst() then
            exit;
        AttrMapping.SetRange("Table ID", Database::Job);
        AttrMapping.SetRange("Job Attribute ID", Attribute.ID);
        AttrMapping.SetRange("Job Attribute Value ID", AttributeValueRec.ID);
        if not AttrMapping.FindSet() then
            exit;
        // JobNoFilter := Job.GetFilter("No.");
        // if JobNoFilter = '' then
        JobNoFilter := AttrMapping."No.";
        if AttrMapping.Next() <> 0 then
            repeat
                JobNoFilter += '|' + AttrMapping."No.";
            until AttrMapping.Next() = 0;
        Job.SetFilter("No.", JobNoFilter);
    end;

}