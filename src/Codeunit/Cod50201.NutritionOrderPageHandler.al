codeunit 50201 "Nutrition Order Page Handler"
{
    [EventSubscriber(ObjectType::Page, Page::"Nutrition Order", 'OnBeforeActionEvent', 'Release', false, false)]
    internal procedure OnBeforeActionEvent_ChangeStatusToOpen(var Rec: Record "Nutrition Header")
    begin
        NutritionManagement.ConfirmChangeStatusToOpen(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Nutrition Order", 'OnBeforeActionEvent', 'Reopen', false, false)]
    internal procedure OnBeforeActionEvent_ChangeStatusToRelease(var Rec: Record "Nutrition Header")
    begin
        NutritionManagement.ConfirmChangeStatusToRelease(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Nutrition Header", 'OnBeforeValidateEvent', 'No.', false, false)]
    internal procedure OnBeforeValidateEvent_DocumentNo(var Rec: Record "Nutrition Header"; var xRec: Record "Nutrition Header"; CurrFieldNo: Integer)
    //rec az uj/modositott érték, xrec a modositás előtti/régi érték
    begin
        NutritionManagement.ConfirmChangeStatusToOpen(Rec);
    end;

    var
        NutritionManagement: Codeunit "Nutrition Management";
}
