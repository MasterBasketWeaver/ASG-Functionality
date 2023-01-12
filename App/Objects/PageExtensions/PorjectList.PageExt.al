pageextension 50100 "WSB ASG Project List" extends "Project List (PGS)"
{
    layout
    {
        addlast(Control1)
        {
            field("WSB ASG Proj. Attribute 1"; Rec."WSB ASG Proj. Attribute 1")
            {
                ApplicationArea = all;
                Visible = ShowField1;
            }
            field("WSB ASG Proj. Attribute 2"; Rec."WSB ASG Proj. Attribute 2")
            {
                ApplicationArea = all;
                Visible = ShowField2;
            }
            field("WSB ASG Proj. Attribute 3"; Rec."WSB ASG Proj. Attribute 3")
            {
                ApplicationArea = all;
                Visible = ShowField3;
            }
            field("WSB ASG Proj. Attribute 4"; Rec."WSB ASG Proj. Attribute 4")
            {
                ApplicationArea = all;
                Visible = ShowField4;
            }
            field("WSB ASG Proj. Attribute 5"; Rec."WSB ASG Proj. Attribute 5")
            {
                ApplicationArea = all;
                Visible = ShowField5;
            }
            field("WSB ASG Proj. Attribute 6"; Rec."WSB ASG Proj. Attribute 6")
            {
                ApplicationArea = all;
                Visible = ShowField6;
            }
            field("WSB ASG Proj. Attribute 7"; Rec."WSB ASG Proj. Attribute 7")
            {
                ApplicationArea = all;
                Visible = ShowField7;
            }
            field("WSB ASG Proj. Attribute 8"; Rec."WSB ASG Proj. Attribute 8")
            {
                ApplicationArea = all;
                Visible = ShowField8;
            }
            field("WSB ASG Proj. Attribute 9"; Rec."WSB ASG Proj. Attribute 9")
            {
                ApplicationArea = all;
                Visible = ShowField9;
            }
            field("WSB ASG Proj. Attribute 10"; Rec."WSB ASG Proj. Attribute 10")
            {
                ApplicationArea = all;
                Visible = ShowField10;
            }
            field("WSB ASG Proj. Attribute 11"; Rec."WSB ASG Proj. Attribute 11")
            {
                ApplicationArea = all;
                Visible = ShowField11;
            }
            field("WSB ASG Proj. Attribute 12"; Rec."WSB ASG Proj. Attribute 12")
            {
                ApplicationArea = all;
                Visible = ShowField12;
            }
            field("WSB ASG Proj. Attribute 13"; Rec."WSB ASG Proj. Attribute 13")
            {
                ApplicationArea = all;
                Visible = ShowField13;
            }
            field("WSB ASG Proj. Attribute 14"; Rec."WSB ASG Proj. Attribute 14")
            {
                ApplicationArea = all;
                Visible = ShowField14;
            }
            field("WSB ASG Proj. Attribute 15"; Rec."WSB ASG Proj. Attribute 15")
            {
                ApplicationArea = all;
                Visible = ShowField15;
            }
            field("WSB ASG Proj. Attribute 16"; Rec."WSB ASG Proj. Attribute 16")
            {
                ApplicationArea = all;
                Visible = ShowField16;
            }
            field("WSB ASG Proj. Attribute 17"; Rec."WSB ASG Proj. Attribute 17")
            {
                ApplicationArea = all;
                Visible = ShowField17;
            }
            field("WSB ASG Proj. Attribute 18"; Rec."WSB ASG Proj. Attribute 18")
            {
                ApplicationArea = all;
                Visible = ShowField18;
            }
            field("WSB ASG Proj. Attribute 19"; Rec."WSB ASG Proj. Attribute 19")
            {
                ApplicationArea = all;
                Visible = ShowField19;
            }
            field("WSB ASG Proj. Attribute 20"; Rec."WSB ASG Proj. Attribute 20")
            {
                ApplicationArea = all;
                Visible = ShowField20;
            }
            field("WSB ASG Proj. Attribute 21"; Rec."WSB ASG Proj. Attribute 21")
            {
                ApplicationArea = all;
                Visible = ShowField21;
            }
            field("WSB ASG Proj. Attribute 22"; Rec."WSB ASG Proj. Attribute 22")
            {
                ApplicationArea = all;
                Visible = ShowField22;
            }
            field("WSB ASG Proj. Attribute 23"; Rec."WSB ASG Proj. Attribute 23")
            {
                ApplicationArea = all;
                Visible = ShowField23;
            }
            field("WSB ASG Proj. Attribute 24"; Rec."WSB ASG Proj. Attribute 24")
            {
                ApplicationArea = all;
                Visible = ShowField24;
            }
            field("WSB ASG Proj. Attribute 25"; Rec."WSB ASG Proj. Attribute 25")
            {
                ApplicationArea = all;
                Visible = ShowField25;
            }
            field("WSB ASG Proj. Attribute 26"; Rec."WSB ASG Proj. Attribute 26")
            {
                ApplicationArea = all;
                Visible = ShowField26;
            }
            field("WSB ASG Proj. Attribute 27"; Rec."WSB ASG Proj. Attribute 27")
            {
                ApplicationArea = all;
                Visible = ShowField27;
            }
            field("WSB ASG Proj. Attribute 28"; Rec."WSB ASG Proj. Attribute 28")
            {
                ApplicationArea = all;
                Visible = ShowField28;
            }
            field("WSB ASG Proj. Attribute 29"; Rec."WSB ASG Proj. Attribute 29")
            {
                ApplicationArea = all;
                Visible = ShowField29;
            }
        }
    }

    actions
    {
        addlast("Project (PGS)")
        {
            action("WSB ASG Populate Attributes")
            {
                ApplicationArea = all;
                Image = PostApplication;
                Caption = 'Populate Attributes';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Job: Record Job;
                    ProjValueMapping: Record "Proj Attr. Value Mapping PGS";
                    ProjAttribute: Record "Project Attribute PGS";
                    AttrValue: Record "Project Attribute Value PGS";
                    RecRef: RecordRef;
                    FldId: Integer;
                begin
                    if not Job.FindSet(true) then
                        exit;
                    ProjValueMapping.SetRange("Table ID", Database::Job);
                    repeat
                        ProjValueMapping.SetRange("No.", Job."No.");
                        RecRef.GetTable(Job);
                        if ProjValueMapping.FindSet() then
                            repeat
                                FldId := Job.FieldNo("WSB ASG Proj. Attribute 1") + ProjValueMapping."Job Attribute ID" - 1;
                                if RecRef.FieldExist(FldId) then
                                    if ProjAttribute.Get(ProjValueMapping."Job Attribute ID") and AttrValue.Get(ProjValueMapping."Job Attribute ID", ProjValueMapping."Job Attribute Value ID") then
                                        RecRef.Field(FldId).Value(AttrValue.Value)
                                    else
                                        RecRef.Field(FldId).Value('');
                            until ProjValueMapping.Next() = 0;
                        RecRef.SetTable(Job);
                        Job.Modify(false);
                    until Job.Next() = 0;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ShowField1 := Rec.FieldCaption("WSB ASG Proj. Attribute 1") <> '';
        ShowField2 := Rec.FieldCaption("WSB ASG Proj. Attribute 2") <> '';
        ShowField3 := Rec.FieldCaption("WSB ASG Proj. Attribute 3") <> '';
        ShowField4 := Rec.FieldCaption("WSB ASG Proj. Attribute 4") <> '';
        ShowField5 := Rec.FieldCaption("WSB ASG Proj. Attribute 5") <> '';
        ShowField6 := Rec.FieldCaption("WSB ASG Proj. Attribute 6") <> '';
        ShowField7 := Rec.FieldCaption("WSB ASG Proj. Attribute 7") <> '';
        ShowField8 := Rec.FieldCaption("WSB ASG Proj. Attribute 8") <> '';
        ShowField9 := Rec.FieldCaption("WSB ASG Proj. Attribute 9") <> '';
        ShowField10 := Rec.FieldCaption("WSB ASG Proj. Attribute 10") <> '';
        ShowField11 := Rec.FieldCaption("WSB ASG Proj. Attribute 11") <> '';
        ShowField12 := Rec.FieldCaption("WSB ASG Proj. Attribute 12") <> '';
        ShowField13 := Rec.FieldCaption("WSB ASG Proj. Attribute 13") <> '';
        ShowField14 := Rec.FieldCaption("WSB ASG Proj. Attribute 14") <> '';
        ShowField15 := Rec.FieldCaption("WSB ASG Proj. Attribute 15") <> '';
        ShowField16 := Rec.FieldCaption("WSB ASG Proj. Attribute 16") <> '';
        ShowField17 := Rec.FieldCaption("WSB ASG Proj. Attribute 17") <> '';
        ShowField18 := Rec.FieldCaption("WSB ASG Proj. Attribute 18") <> '';
        ShowField19 := Rec.FieldCaption("WSB ASG Proj. Attribute 19") <> '';
        ShowField20 := Rec.FieldCaption("WSB ASG Proj. Attribute 20") <> '';
        ShowField21 := Rec.FieldCaption("WSB ASG Proj. Attribute 21") <> '';
        ShowField22 := Rec.FieldCaption("WSB ASG Proj. Attribute 22") <> '';
        ShowField23 := Rec.FieldCaption("WSB ASG Proj. Attribute 23") <> '';
        ShowField24 := Rec.FieldCaption("WSB ASG Proj. Attribute 24") <> '';
        ShowField25 := Rec.FieldCaption("WSB ASG Proj. Attribute 25") <> '';
        ShowField26 := Rec.FieldCaption("WSB ASG Proj. Attribute 26") <> '';
        ShowField27 := Rec.FieldCaption("WSB ASG Proj. Attribute 27") <> '';
        ShowField28 := Rec.FieldCaption("WSB ASG Proj. Attribute 28") <> '';
        ShowField29 := Rec.FieldCaption("WSB ASG Proj. Attribute 29") <> '';
    end;

    var
        [InDataSet]
        ShowField1: Boolean;
        [InDataSet]
        ShowField2: Boolean;
        [InDataSet]
        ShowField3: Boolean;
        [InDataSet]
        ShowField4: Boolean;
        [InDataSet]
        ShowField5: Boolean;
        [InDataSet]
        ShowField6: Boolean;
        [InDataSet]
        ShowField7: Boolean;
        [InDataSet]
        ShowField8: Boolean;
        [InDataSet]
        ShowField9: Boolean;
        [InDataSet]
        ShowField10: Boolean;
        [InDataSet]
        ShowField11: Boolean;
        [InDataSet]
        ShowField12: Boolean;
        [InDataSet]
        ShowField13: Boolean;
        [InDataSet]
        ShowField14: Boolean;
        [InDataSet]
        ShowField15: Boolean;
        [InDataSet]
        ShowField16: Boolean;
        [InDataSet]
        ShowField17: Boolean;
        [InDataSet]
        ShowField18: Boolean;
        [InDataSet]
        ShowField19: Boolean;
        [InDataSet]
        ShowField20: Boolean;
        [InDataSet]
        ShowField21: Boolean;
        [InDataSet]
        ShowField22: Boolean;
        [InDataSet]
        ShowField23: Boolean;
        [InDataSet]
        ShowField24: Boolean;
        [InDataSet]
        ShowField25: Boolean;
        [InDataSet]
        ShowField26: Boolean;
        [InDataSet]
        ShowField27: Boolean;
        [InDataSet]
        ShowField28: Boolean;
        [InDataSet]
        ShowField29: Boolean;
}