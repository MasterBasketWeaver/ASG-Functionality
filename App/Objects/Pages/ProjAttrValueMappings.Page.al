page 50101 "WSB ASG Job Attritbues"
{
    PageType = List;
    SourceTable = "Proj Attr. Value Mapping PGS";
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'Project Attributes Power BI';
    SourceTableView = sorting("Table ID", "No.", "Job Attribute ID") where("Table ID" = const(167));
    Editable = false;
    LinksAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Line)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Caption = 'Job No.';
                }
                field("WSB ASG Job Description"; Rec."WSB ASG Job Description")
                {
                    ApplicationArea = all;
                }
                field("WSB ASG Attribute Name"; Rec."WSB ASG Attribute Name")
                {
                    ApplicationArea = all;
                }
                field("WSB ASG Attribute Value"; Rec."WSB ASG Attribute Value")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}