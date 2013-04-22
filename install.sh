#!/usr/bin/env bash

SOLOISTDIR="${HOME}/soloistgo"
SOLOISTRC_URL="https://raw.github.com/clifferson/soloist-config/master/soloistrc"
CHEFFILE_URL="https://raw.github.com/clifferson/soloist-config/master/Cheffile"

echo "I can has root?"
sudo true

echo "Creating .soloistgo dir"
mkdir ${SOLOISTDIR}

echo "Downloading soloistrc"
curl ${SOLOISTRC_URL} -o ${SOLOISTDIR}/soloistrc

echo "Downloading Cheffile"
curl ${CHEFFILE_URL} -o ${SOLOISTDIR}/Cheffile

echo "Installing soloist & plist gem"
if [ ! $(gem specification soloist &>/dev/null) ]; then sudo gem install soloist --no-rdoc --no-ri; fi
sudo gem install plist --no-rdoc --no-ri

echo "Running soloist"
cd ${SOLOISTDIR} && sudo soloist

if [ $? -eq 0 ]; then
  echo "Soloist run complete, you migth want to delete ${SOLOISTDIR}?"
else
  echo "Soloist failed, run it again: cd ${SOLOISTDIR} && sudo soloist"
fi
