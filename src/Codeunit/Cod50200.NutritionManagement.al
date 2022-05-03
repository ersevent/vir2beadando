codeunit 50200 "Nutrition Management"
{
    procedure ChangeStatus(var NutritionHeader: Record "Nutrition Header";Status: Enum "Sales Document Status")
    //ha var ott van akkor referencia, ha nincs akkor csak lemásolja az értékeket
    begin
        NutritionHeader.TestField(NutritionHeader."Customer No.");
        NutritionHeader.Status := Status;
        NutritionHeader.Modify();
    end;

    procedure ConfirmChangeStatusToOpen(var Rec: Record "Nutrition Header")
    begin
        if not Confirm('Szeretnéd lezárni a táplálkozást?') then
            Error('Hiba!');
    end;

    internal procedure ConfirmChangeStatusToRelease(var Rec: Record "Nutrition Header")
    begin
        if not Confirm('Szeretnéd újranyitni a táplálkozást?') then
            Error('Hiba!')
    end;

    internal procedure CalcQuantity(var NutritionLine: Record "Nutrition Line"; recMacronutrients: Record Macronutrients)
    begin
        if recMacronutrients.Get(NutritionLine."Code") then
        begin
            NutritionLine.Protein := recMacronutrients.Protein * NutritionLine.Quantity;
            NutritionLine.Fat := recMacronutrients.Fat * NutritionLine.Quantity;
            NutritionLine.Carbohydrates := recMacronutrients.Carbohydrates * NutritionLine.Quantity;
            NutritionLine."Unit of measure" := recMacronutrients."Unit of measure";
            NutritionLine.KJ := recMacronutrients.KJ * NutritionLine.Quantity;
            NutritionLine.Kcal := recMacronutrients.Kcal * NutritionLine.Quantity;
            NutritionLine.Modify();
        end;    
    end;
    procedure PostNutritionOrder(var NutritionHeader: Record "Nutrition Header")
    var
        NutritionLine: Record "Nutrition Line";
        NutritionPostedHeader: Record "Posted Nutrition Header";
        NutritionPostedLine: Record "Posted Nutrition Line";
        NutritionOrderSetup : Record "Nutrition Orders Setup";
        NoManagement : Codeunit NoSeriesManagement;
    begin
        NutritionHeader.TestField(Status, NutritionHeader.Status::Released);

        if not Confirm('Szeretnéd könyvelni a táplálkozást?') then
            exit;

        NutritionPostedHeader.Init();
        NutritionPostedHeader.TransferFields(NutritionHeader);
        NutritionOrderSetup.Get();
        NutritionPostedHeader."No." := NoManagement.GetNextNo(NutritionOrderSetup."Posted No. Series",WORKDATE,true);
        NutritionPostedHeader.Insert(true);

        NutritionLine.Reset();
        NutritionLine.SetRange("No.", NutritionHeader."No.");
        if NutritionLine.FindSet() then
            repeat
                NutritionPostedLine.Init();
                NutritionPostedLine.TransferFields(NutritionLine);
                NutritionPostedLine."No." := NutritionPostedHeader."No.";
                NutritionPostedLine.Insert(true);
            until NutritionLine.Next() = 0;
        Message('Sikeres könyvelés!');
        if NutritionHeader."Delete after post" then
            NutritionHeader.Delete(true);     //törli a rekordot a táblában
        //Page.RunModal(Page::"Nutrition Order", NutritionPostedHeader);
    end;
}
