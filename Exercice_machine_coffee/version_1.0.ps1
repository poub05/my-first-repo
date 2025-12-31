# Script machine à café Version 1.0
# Auteur : Christian

# Sommaire
# 01 - Variables
# 02 - Menu Boisson
# 00 - Exécution du script





#================================================
# 01 - VARIABLES
#================================================
$coffee = "Café"
$tea = "Thé"
$chocolat = "Chocolat"



#================================================
# 01 - MENU BOISSON
#================================================
function Select-Drink {

    # Clear-Host

    Write-Host ""
    Write-Host "╭─────────────────────────────────────╮"
    Write-Host "│   MENU                              │"
    Write-Host "├─────────────────────────────────────┤"
    Write-Host "│                                     │"
    Write-Host "│   1. Café                           │"
    Write-Host "│   2. Thé                            │"
    Write-Host "│   3. Chocolat                       │"
    Write-Host "│                                     │"
    Write-Host "╰─────────────────────────────────────╯"
    Write-Host ""

    $DrinkChoice = Read-Host "Choisissez une boisson "

    switch ($DrinkChoice) {

        1 {
            Write-Host "Vous avez choisi du $coffee."
        }
        2 {
            Write-Host "Vous avez choisi du $tea."
        }
        3 {
            Write-Host "Vous avez choisi du $chocolat."
        }
        default {
            Write-Host "Entrée invalide !" -Foreground Red
            Select-Drink
        }
    }
}



#================================================
# 00 - EXECUTION DU SCRIPT
#================================================
Select-Drink