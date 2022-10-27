[System.Collections.ArrayList]$global:array = @()
$global:id = 0
function create {
    param (
        [string]$brand,
        [string]$model,
        [int]$price,
        [int]$id
    )

    $car = [PSCustomObject]@{
        brand = $brand
        model = $model
        price = $price
        id = $id
    }

    $global:array += $car

}

function remove {
    param (
        [int]$id
    )
    
    for($i=0; $i -lt $global:array.Count; $i++){

        if($global:array[$i].id -eq $id){
            $global:array.RemoveAt($i)
        }

    }

}

function update {
    param (
        [int]$id
    )
    
    for($i=0; $i -lt $global:array.Count; $i++){

        if($global:array[$i].id -eq $id){
            Write-Host $global:array[$i]
            $action = Read-Host "What would you like to update? `n B=brand`n M=model `n P=price `n"

            if($action -eq "B"){
                $change = Read-Host "What would you like to change this to?"
                $global:array[$i].brand = $change
            }
            elseif($action -eq "M"){
                $change = Read-Host "What would you like to change this to?"
                $global:array[$i].model = $change
            }
            elseif($action -eq "P"){
                $change = Read-Host "What would you like to change this to?"
                $global:array[$i].price = $change
            }

        }

    }

}



while ($true) {
    
    $action = Read-Host "What would you like to do? `n C=create`n R=remove `n U=update `n RE=Read `n"
    
    if($action -eq "C"){
        $brand = Read-Host "What brand?"
        $model = Read-Host "Model?"
        $price = Read-Host "Price?"

        create $brand $model $price $global:id

        $global:id+=1

        Write-Host $global:array
    }
    if($action -eq "R"){
        Write-Host $global:array

        $removeid = Read-Host "What is the ID of the car you would like to remove?"

        remove $removeid

        Write-Host $global:array

    }
    if($action -eq "U"){
        Write-Host $global:array

        $updateat = Read-Host "What is the ID of the car you would like to update?"

        update $updateat

    }

    if($action -eq "RE"){
        Write-Host $global:array
    }
}



