codeunit 50100 "WSB ASG Subscribers"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Caption Class", 'OnResolveCaptionClass', '', false, false)]
    local procedure CaptionClassOnResolveCaptionClass(CaptionArea: Text; CaptionExpr: Text; var Caption: Text; var Resolved: Boolean)
    var
        ProjAttribute: Record "Project Attribute PGS";
        TempID: Integer;
    begin
        if (CaptionArea <> '50100') then
            exit;
        if not Evaluate(TempID, CaptionExpr) or not ProjAttribute.Get(TempID) then
            Caption := ''
        else
            Caption := ProjAttribute.Name;
        Resolved := true;
    end;


    [EventSubscriber(ObjectType::Page, Page::"Project Attr. Value List PGS", 'OnAfterJobAttributeValueMappingModify', '', false, false)]
    local procedure OnAfterJobAttributeValueMappingModify(var JobAttributeValueMapping: Record "Proj Attr. Value Mapping PGS"; JobAttributeValueSelection: Record "Proj Attr. Value Selection PGS")
    var
        Job: Record Job;
        RecRec: RecordRef;
        FldId: Integer;
    begin
        if (JobAttributeValueMapping."Table ID" <> Database::Job) or not Job.Get(JobAttributeValueMapping."No.") then
            exit;
        RecRec.GetTable(Job);
        FldId := Job.FieldNo("WSB ASG Proj. Attribute 1") + JobAttributeValueMapping."Job Attribute ID" - 1;
        if not RecRec.FieldExist(FldId) then
            exit;
        RecRec.Field(FldId).Value(JobAttributeValueSelection.Value);
        RecRec.Modify(false);
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Project Attr. Value List PGS", 'OnAfterJobAttributeValueMappingDelete', '', false, false)]
    // local procedure OnAfterJobAttributeValueMappingDelete(AttributeToDeleteID: Integer; RelatedRecordCode: Code[20]; JobAttributeValueSelection: Record "Proj Attr. Value Selection PGS")
    // var
    //     Job: Record Job;
    //     RecRec: RecordRef;
    //     FldId: Integer;
    // begin

    //     if not Confirm(StrSubstNo('%1, %2, %3', AttributeToDeleteID, RelatedRecordCode, JobAttributeValueSelection.Value)) then
    //         Error('');

    //     if Job.Get(RelatedRecordCode) then
    //         exit;
    //     RecRec.GetTable(Job);
    //     FldId := Job.FieldNo("WSB ASG Proj. Attribute 1") + AttributeToDeleteID - 1;
    //     if not RecRec.FieldExist(FldId) then
    //         exit;
    //     RecRec.Field(FldId).Value(JobAttributeValueSelection.Value);
    //     RecRec.Modify(false);
    // end;



    // [IntegrationEvent(false, false)]
    // local procedure OnAfterJobAttributeValueMappingDelete(AttributeToDeleteID: Integer; RelatedRecordCode: Code[20]; JobAttributeValueSelection: Record "Proj Attr. Value Selection PGS")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterJobAttributeValueMappingModify(var JobAttributeValueMapping: Record "Proj Attr. Value Mapping PGS"; JobAttributeValueSelection: Record "Proj Attr. Value Selection PGS")
    // begin
    // end;


    // var
    //     p1: Page 14046361;
}