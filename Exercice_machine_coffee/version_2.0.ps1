# Script machine à café Version 2.0
# Auteur : Christian

# Configuration de l'encodage pour Unicode
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

<# 
    Changelog Version 2.0 : 
    - Ajout du choix de sucre
    - AJout du choix de gobelet
    - Affichage du résumé de la commande
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
$coffee = "Café"
$tea = "Thé"
$chocolat = "Chocolat"
$sugar = "Sucre"
$gobelet = "Gobelet"



#================================================
# 02 - MENU BOISSON
#================================================
function Select-Drink {

    # Clear-Host

    Write-Host ""
    Write-Host "╭────────────────────────────────────────────╮"
    Write-Host "│   MENU                                     │"
    Write-Host "├────────────────────────────────────────────┤"
    Write-Host "│                                            │"
    Write-Host "│   1. Café                                  │"
    Write-Host "│   2. Thé                                   │"
    Write-Host "│   3. Chocolat                              │"
    Write-Host "│                                            │"
    Write-Host "╰────────────────────────────────────────────╯"
    Write-Host ""

    $script:DrinkChoice = Read-Host "Choisissez une boisson "

    switch ($DrinkChoice) {

        1 {
            $script:Choice = $coffee
        }
        2 {
            $script:Choice = $tea
        }
        3 {
            $script:Choice = $chocolat
        }
        default {
            Write-Host "Entrée invalide !" -Foreground Red
            Select-Drink
        }
    }
}

#================================================
# 03 - DEMANDE SUCRE
#================================================
function Add-Sugar {

    $script:sugarChoice = Read-Host "Voulez-vous du $sugar ? [Y/N] "

    if ($sugarChoice -eq "y") {

        $script:choiceSugar = "Avec du $sugar"

    } elseif ($sugarChoice -eq "n") {

        $script:choiceSugar = "Sans $sugar"

    } else {

        Write-Host "Entrée invalide !" -Foreground Red
        Add-Sugar
        
    }
}


#================================================
# 04 - DEMANDE GOBELET
#================================================
function Add-Gobelet {

    
    $script:gobeletChoice = Read-Host "Voulez-vous un $gobelet ?"

    if ($script:gobeletChoice -eq "y") {

        $script:choiceGobelet = "Avec un $gobelet"

    } elseif ($script:gobeletChoice -eq "n") {

        $script:choiceGobelet = "Sans $gobelet"

    } else {

        Write-Host "Entrée invalide !" -Foreground Red
        Add-Gobelet
    }
        
}



#================================================
# 05 - RESUME COMMANDE
#================================================
function Show-Command {

    Write-Host ""
    Write-Host "╭────────────────────────────────────────────╮"
    Write-Host "│   Voici le résumé de votre commande :      │"
    Write-Host "├────────────────────────────────────────────┤"
    Write-Host "│                                            │"
    Write-Host "│   Boisson : $Choice                        │"
    Write-Host "│   Sucre   : $choicesugar                   │"
    Write-Host "│   Gobelet : $script:choiceGobelet          │"
    Write-Host "│                                            │"
    Write-Host "╰────────────────────────────────────────────╯"

}



#================================================
# 00 - EXECUTION DU SCRIPT
#================================================
Select-Drink
Add-Sugar
Add-Gobelet
Show-Command