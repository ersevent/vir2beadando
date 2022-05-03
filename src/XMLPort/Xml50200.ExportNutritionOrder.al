xmlport 50200 "Export Nutrition Order"
{
    Caption = 'Táplálkozás exportálása';
    Format = Xml;
    Direction = Export;
/*  
    Format = VariableText;
    TextEncoding = UTF8;
    TableSeparator = '<NewLine>'; */

    schema
    {
        textelement(Root)
        {
            tableelement(NutritionHeader; "Nutrition Header")
            {
                RequestFilterFields = "No.";
                fieldelement("No."; NutritionHeader."No.")
                {
                }
                fieldelement(CustomerName; NutritionHeader."Customer Name")
                {
                }
                fieldelement(Date; NutritionHeader."Date")
                {
                }
                fieldelement(TotalProtein; NutritionHeader."Total Protein")
                {
                }
                fieldelement(TotalFat; NutritionHeader."Total Fat")
                {
                }
                fieldelement(TotalCarbohydrates; NutritionHeader."Total Carbohydrates")
                {
                }
                fieldelement(TotalKJ; NutritionHeader."Total KJ")
                {
                }
                fieldelement(TotalKcal; NutritionHeader."Total Kcal")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
