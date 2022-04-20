codeunit 50200 "Nutrion Management"
{
    procedure ChangeStatus(var TestHeader: Record "Nutrition Header";Status: Enum "Sales Document Status")
    //ha var ott van akkor referencia, ha nincs akkor csak lemásolja az értékeket
    begin
        TestHeader.TestField(TestHeader."Customer No.");
        TestHeader.Status := Status;
        TestHeader.Modify();
    end;

    procedure ConfirmChangeStatus(var Rec: Record "Nutrition Header")
    begin
        if not Confirm('Szeretnéd lezárni a táplálkozást?') then
            Error('Hiba!');
    end;
    procedure PostNutrionOrder(var NutrionHeader: Record "Nutrition Header")
    var
        NutrionLine: Record "Nutrition Line";
        NutrionPostedHeader: Record "Posted Nutrition Header";
        NutrionPostedLine: Record "Posted Nutrition Line";
        PostedNutrOrderSetup : Record "Posted Nutrition Orders Setup";
        NoManagement : Codeunit NoSeriesManagement;
    begin
        NutrionHeader.TestField(Status, NutrionHeader.Status::Released);

        if not Confirm('Szeretnéd könyvelni a táplálkozást?') then
            exit;

        NutrionLine.Reset();
        NutrionLine.SetRange("No.", NutrionHeader."No.");
        if NutrionLine.FindSet() then
            repeat
                NutrionPostedHeader.Init();
                NutrionPostedHeader.TransferFields(NutrionHeader);
                PostedNutrOrderSetup.Get();
                NutrionPostedHeader."No." := NoManagement.GetNextNo(PostedNutrOrderSetup."No. Series",WORKDATE,true);
                NutrionPostedHeader.Insert(true);
            until NutrionLine.Next() = 0;
        Message('Sikeres könyvelés!');
        if NutrionHeader."Delete after post" then
            NutrionHeader.Delete(true);     //törli a rekordot a táblában
        //Page.RunModal(Page::"Nutrion Order", NutrionPostedHeader);
    end;
}
