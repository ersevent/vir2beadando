codeunit 50200 "Nutrition Management"
{
    var
        ErrorLbl: Label 'Error';

    procedure ChangeStatus(var NutritionHeader: Record "Nutrition Header"; Status: Enum "Sales Document Status")
    //ha var ott van akkor referencia, ha nincs akkor csak lemásolja az értékeket
    begin
        NutritionHeader.TestField(NutritionHeader."Customer No.");
        NutritionHeader.Status := Status;
        NutritionHeader.Modify();
    end;

    procedure ConfirmChangeStatusToOpen(var Rec: Record "Nutrition Header")
    var
        StatusToOpenLbl: Label 'Would you like to reopen the nutrition order?';
    begin
        if not Confirm(StatusToOpenLbl) then
            Error(ErrorLbl);
    end;

    internal procedure ConfirmChangeStatusToRelease(var Rec: Record "Nutrition Header")
    var
        StatusToReleaseLbl: Label 'Would you like to release the nutrition order?';
    begin
        if not Confirm(StatusToReleaseLbl) then
            Error(ErrorLbl)
    end;

    internal procedure CalcQuantity(var NutritionLine: Record "Nutrition Line"; recMacronutrients: Record Macronutrients)
    begin
        if recMacronutrients.Get(NutritionLine."Code") then begin
            NutritionLine.Protein := recMacronutrients.Protein * NutritionLine.Quantity;
            NutritionLine.Fat := recMacronutrients.Fat * NutritionLine.Quantity;
            NutritionLine.Carbohydrates := recMacronutrients.Carbohydrates * NutritionLine.Quantity;
            NutritionLine."Unit of measure" := recMacronutrients."Unit of measure";
            NutritionLine.KJ := recMacronutrients.KJ * NutritionLine.Quantity;
            NutritionLine.Kcal := recMacronutrients.Kcal * NutritionLine.Quantity;
            NutritionLine.Modify();
        end;
    end;

    internal procedure ConfirmExport(var Rec: Record "Nutrition Header")
    var
        ExportLbl: Label 'Would you like to export the nutrition order?';
    begin
        if not Confirm(ExportLbl) then
            Error(ErrorLbl);
    end;

    internal procedure ConfirmPost(var Rec: Record "Nutrition Header")
    var
        PostLbl: Label 'Would you like to post the nutrition order?';
    begin
        if not Confirm(PostLbl) then
            Error(ErrorLbl);
    end;

    internal procedure ConfirmQuery(var Rec: Record "Nutrition Header")
    var
        QueryLbl: Label 'Would you like to create a query?';
    begin
        if not Confirm(QueryLbl) then
            Error(ErrorLbl);
    end;

    procedure PostNutritionOrder(var NutritionHeader: Record "Nutrition Header")
    var
        NutritionLine: Record "Nutrition Line";
        NutritionPostedHeader: Record "Posted Nutrition Header";
        NutritionPostedLine: Record "Posted Nutrition Line";
        NutritionOrderSetup: Record "Nutrition Orders Setup";
        NoManagement: Codeunit NoSeriesManagement;
        NutritionPostDoneLbl: Label 'Successful posting';
    begin
        NutritionHeader.TestField(Status, NutritionHeader.Status::Released);

        NutritionPostedHeader.Init();
        NutritionPostedHeader.TransferFields(NutritionHeader);
        NutritionOrderSetup.Get();
        NutritionPostedHeader."No." := NoManagement.GetNextNo(NutritionOrderSetup."Posted No. Series", WORKDATE, true);
        NutritionPostedHeader.Insert();

        NutritionLine.Reset();
        NutritionLine.SetRange("No.", NutritionHeader."No.");
        if NutritionLine.FindSet() then
            repeat
                NutritionPostedLine.Init();
                NutritionPostedLine.TransferFields(NutritionLine);
                NutritionPostedLine."No." := NutritionPostedHeader."No.";
                NutritionPostedLine.Insert(true);
            until NutritionLine.Next() = 0;
        Message(NutritionPostDoneLbl);
        if NutritionHeader."Delete after post" then
            NutritionHeader.Delete(true);     //törli a rekordot a táblában
        //Page.RunModal(Page::"Nutrition Order", NutritionPostedHeader);
    end;
}
