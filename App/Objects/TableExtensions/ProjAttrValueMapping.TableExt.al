tableextension 50100 "WSB ASG Proj. Attr. Mapping" extends "Proj Attr. Value Mapping PGS"
{
    fields
    {
        field(50100; "WSB ASG Attribute Name"; Text[250])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Project Attribute PGS".Name where(ID = field("Job Attribute ID"), Blocked = const(false)));
            Caption = 'Attrbute Name';
        }
        field(50101; "WSB ASG Attribute Value"; Text[250])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Project Attribute Value PGS".Value where("Attribute ID" = field("Job Attribute ID"), ID = field("Job Attribute Value ID"), Blocked = const(false)));
            Caption = 'Attribute Value';
        }
        field(50102; "WSB ASG Job Description"; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Job.Description where("No." = field("No.")));
            Caption = 'Job Description';
        }
    }
}