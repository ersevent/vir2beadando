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

                    fieldelement(Protein; NutritionLine.Protein)
                    {
                    }
                    fieldelement(Fat; NutritionLine."Fat")
                    {
                    }
                    fieldelement(Carbohydrates; NutritionLine."Carbohydrates")
                    {
                    }
                    fieldelement(KJ; NutritionLine."KJ")
                    {
                    }
                    fieldelement(Kcal; NutritionLine."Kcal")
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