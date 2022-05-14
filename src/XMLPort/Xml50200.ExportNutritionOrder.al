xmlport 50200 "Export Nutrition Order"
{
    Caption = 'Export Nutrition Order';
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
                fieldelement("No."; NutritionHeader."No.")
                {
                }
                fieldelement(CustomerName; NutritionHeader."Customer Name")
                {
                }
                fieldelement(Date; NutritionHeader."Date")
                {
                }
                tableelement(NutritionLine; "Nutrition Line")
                {
                    LinkTable = NutritionHeader;
                    LinkFields = "No." = field("No.");

                    fieldelement(TotalProtein; NutritionLine."Total Protein")
                    {
                    }
                    fieldelement(TotalFat; NutritionLine."Total Fat")
                    {
                    }
                    fieldelement(TotalCarbohydrates; NutritionLine."Total Carbohydrates")
                    {
                    }
                    fieldelement(TotalKJ; NutritionLine."Total KJ")
                    {
                    }
                    fieldelement(TotalKcal; NutritionLine."Total Kcal")
                    {
                    }
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