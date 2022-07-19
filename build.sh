#!/bin/bash

# Black Summer Mission Generator
# ==============================

# Parse config file
# -----------------
[ -x "/usr/bin/jq" ] || { echo "jq is not installed. Exit."; exit; }

defaultConfigFile="./configs/default.json"
echo "[i] Pasing default config file ($defaultConfigFile)"
srcDir=$(jq -r .srcDir $defaultConfigFile)
[ -d $srcDir ] || { echo "$srcDir doesn't exist. Exit."; exit; }
buildDir=$(jq -r .buildDir $defaultConfigFile)
[ -d $buildDir ] || { echo "$buildDir doesn't exist. We create one for you."; mkdir -v $buildDir; }
packedDir=$(jq -r .packedDir $defaultConfigFile)
[ -d $packedDir ] || { echo "$packedDir doesn't exist. We create one for you."; mkdir -v $packedDir; }
dstDir=$(jq -r .dstDir $defaultConfigFile)
[ -d "$dstDir" ] || { echo "$dstDir doesn't exist. Exit."; exit; }

missionName=$(jq -r .missionName $defaultConfigFile)

declare -A replace
replace["version"]=$(jq -r .replace.version $defaultConfigFile)".$(date "+%m%d%y")"
replace["name"]=$(jq -r .replace.name $defaultConfigFile)
replace["fullname"]=$(jq -r .replace.fullname $defaultConfigFile)

readarray -t parsedFiles < <(jq -rc .parsedFiles[] $defaultConfigFile)
# echo ${parsedFiles[@]}
readarray -t terrains < <(jq -rc .terrains[] $defaultConfigFile)
# echo ${terrains[@]}
readarray -t missions < <(jq -rc .missions[] $defaultConfigFile)
# Creating the mission
# --------------------

for mission in ${missions[@]}; do
    # @INFO: https://unix.stackexchange.com/questions/283257/is-it-possible-to-make-the-variable-inside-nested-for-loop-local
    (
        name=$(jq -r '.name' <<< $mission)
        scenario=$(jq -r '.terrain' <<< $mission)
        sqm=$(jq -r '.sqm' <<< $mission)
        mod=$(jq -r '.mod' <<< $mission)
        echo "[i] Creating mission $name-${replace["version"]} with mod $mod on $scenario scenario"

        for i in ${!terrains[@]}; do
            terrain=${terrains[i]}
            nameTerrain=$(jq -r '.name' <(echo $terrain))
            if [[ $scenario == $nameTerrain ]]; then
                class=$(jq -r '.class' <(echo $terrain))
                declare -A missionData
                missionData["name"]=$(echo $name-${replace["version"]} | tr "." "-")
                # Create the destination mission folder
                missionData["dir"]=$buildDir"/missionFiles/"${missionData["name"]}.$class
                rm -rf ${buildDir}/missionFiles/{*,.[^.]*}
                [[ ! -d ${missionData["dir"]} ]] && {
                    mkdir -p ${missionData["dir"]}
                    mkdir -p ${missionData["dir"]}/Terrain
                }
                # Copy src+terrain content
                cp -R $srcDir/. ${missionData["dir"]}
                cp -R $(jq -r '.path' <(echo $terrain))/. ${missionData["dir"]}/Terrain

                # Replace variables
                release=${replace["version"]}"-alpha"
                mod="Vanilla"
                for file in ${parsedFiles[@]}; do
                    sed -i "s/\$VERSION/${replace["version"]}/g" ${missionData["dir"]}/$file
                    sed -i "s/\$NAME/${replace["name"]}/g" ${missionData["dir"]}/$file
                    sed -i "s/\$FULLNAME/${replace["fullname"]}/g" ${missionData["dir"]}/$file
                    sed -i "s/\$TERRAIN_NAME/$(jq -r '.replace.name' <(echo $terrain))/g" ${missionData["dir"]}/$file
                    sed -i "s/\$RELEASE/$release/g" ${missionData["dir"]}/$file
                    sed -i "s/\$MOD/$mod/g" ${missionData["dir"]}/$file
                done
                # Copy mission content to arma3/missions user folder for testing purposes
                cp -R ${missionData["dir"]} "$dstDir"
            fi
        done
    )
done
