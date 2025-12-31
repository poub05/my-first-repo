# Script machine à café Version 3.0
# Auteur : Christian

# Configuration de l'encodage pour Unicode
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

<# Changelog Version 2.0 :  
    - Ajout du choix de sucre
    - AJout du choix de gobelet
    - Affichage du résumé de la commande
#>

<# Changelog Version 3.0 :   
    - Ajout du choix d'une touilette
    - Création d'un fichier texte par ingrédient avec la quantité de chaque ingrédient
    - Stocakge des valeurs ingrédient dans des variables
    - Modification à chaque nouvelle commande des valeurs ingrédients    
#>



# Sommaire
# 01 - Variables
# 02 - Menu Boisson
# 03 - Demande Sucre
# 04 - Demande Gobelet
# 05 - Résumé Commande
# 00 - Exécution du Script





#================================================
# 01 - VARIABLES
#================================================
$script:coffee = "Café"
$script:tea = "Thé"
$script:chocolat = "Chocolat"
$script:sugar = "Sucre"
$script:gobelet = "Gobelet"
$script:touillette = "Touillette"


# Variables des stocks
[int]$script:coffeNumber = Get-Content (Join-Path $PSScriptRoot "coffee.txt")
[int]$script:teaNumber = Get-Content (Join-Path $PSScriptRoot "tea.txt")
[int]$script:chocolatNumber = Get-Content (Join-Path $PSScriptRoot "chocolat.txt")
[int]$script:sugarNumber = Get-Content (Join-Path $PSScriptRoot "sugar.txt")
[int]$script:gobeletNumber = Get-Content (Join-Path $PSScriptRoot "gobelet.txt")
[int]$script:touilletteNumber = Get-Content (Join-Path $PSScriptRoot "touillette.txt")

#================================================
# 01 - MENU BOISSON
#================================================
function Select-Drink {

    # Clear-Host

    Write-Host ""
    Write-Host "╭────────────────────────────────────────────╮"
    Write-Host "│   MENU                                     │"
    Write-Host "├────────────────────────────────────────────┤"
    Write-Host "│                                            │"
    Write-Host ("│   1. {0, -37} │" -f $coffee)               
    Write-Host ("│   2. {0, -37} │" -f $tea)                      
    Write-Host ("│   3. {0, -37} │" -f $chocolat)            
    Write-Host "│                                            │"
    Write-Host "╰────────────────────────────────────────────╯"
    Write-Host ""

    $script:DrinkChoice = Read-Host "Choisissez une boisson "

    switch ($DrinkChoice) {

        1 {
            $script:Choice = $coffee

            $script:removeCoffee = $coffeNumber - 1
            Set-Content -Path coffee.txt -Value $script:removeCoffee
        }
        2 {
            $script:Choice = $tea
            $script:removeTea = $teaNumber - 1
            Set-Content -Path tea.txt -Value $script:removeTea

        }
        3 {
            $script:Choice = $chocolat
            $script:removeChocolat = $chocolatNumber - 1
            Set-Content -Path chocolat.txt -Value $script:removeChocolat

        }
        default {
            Write-Host "Entrée invalide !" -Foreground Red
            Select-Drink
        }
    }
    Add-Sugar
}

#================================================
# 02 - DEMANDE SUCRE
#================================================
function Add-Sugar {

    $script:sugarChoice = Read-Host "Voulez-vous du $sugar ($sugarNumber) ? [Y/N] "

    if ($sugarChoice -eq "y") {

        $script:choiceSugar = "Avec du $sugar"

        $script:removeSugar = $script:sugarNumber - 1

        Set-Content -Path sugar.txt -Value $script:removeSugar

    } elseif ($sugarChoice -eq "n") {

        $script:choiceSugar = "Sans $sugar"

    } else {

        Write-Host "Entrée invalide !" -Foreground Red
        Add-Sugar
        
    }
    Add-Gobelet
}


#================================================
# 03 - DEMANDE GOBELET
#================================================
function Add-Gobelet {

    
    $script:gobeletChoice = Read-Host "Voulez-vous un $gobelet ($gobeletNumber) ? [Y/N] "

    if ($script:gobeletChoice -eq "y") {

        $script:choiceGobelet = "Avec un $gobelet"

        $script:removeGobelet = $gobeletNumber - 1

        Set-Content -Path gobelet.txt -Value $script:removeGobelet

    } elseif ($script:gobeletChoice -eq "n") {

        $script:choiceGobelet = "Sans $gobelet"

    } else {

        Write-Host "Entrée invalide !" -Foreground Red
        Add-Gobelet
    }
    Add-Touillette
}


#================================================
# 04 - DEMANDE TOUILLETTE
#================================================
function Add-Touillette {

    $script:touilletteChoice = Read-Host "Voulez-vous une $touillette ($touilletteNumber) ? [Y/N] "

    if ($script:touilletteChoice -eq "y") {

        $script:choiceTouillette = "Avec une touillette"

        $script:removeTouillette = $touilletteNumber - 1

        Set-Content -Path touillette.txt -Value $script:removeTouillette

    } elseif ($script:touilletteChoice -eq "n") {

        $script:choiceTouillette = "Sans touillette"

    } else {

        Write-Host "Entrée invalide !" -Foreground Red
        Add-Touillette
    }
}



#================================================
# 04 - RESUME COMMANDE
#================================================
function Show-Command {

    Write-Host ""
    Write-Host "╭────────────────────────────────────────────╮"
    Write-Host "│   Voici le résumé de votre commande :      │"
    Write-Host "├────────────────────────────────────────────┤"
    Write-Host "│                                            │"
    Write-Host ("│   Boisson    : {0,-27} │" -f $Choice)
    Write-Host ("│   Sucre      : {0,-27} │" -f $choicesugar)
    Write-Host ("│   Gobelet    : {0,-27} │" -f $script:choiceGobelet)
    Write-Host ("│   Touillette : {0,-27} │" -f $script:choiceTouillette)
    Write-Host "│                                            │"
    Write-Host "╰────────────────────────────────────────────╯"
    Write-Host ""

}



#================================================
# 00 - EXECUTION DU SCRIPT
#================================================
Select-Drink
Show-Command