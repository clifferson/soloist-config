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
sudo gem install soloist --no-rdoc --no-ri
sudo gem install plist --no-rdoc --no-ri

echo "Running soloist"
cd ${SOLOISTDIR} && sudo soloist

if [ $? -ne 0 ]; then
  echo "Delete ${SOLOISTDIR}? [y/n]:"
  read DELETE_SOLOISTGO

  if [ $DELETE_SOLOISTGO == 'y' ]; then
    echo "Deleting ${SOLOISTDIR}"
    rm -rf ${SOLOISTDIR}
  fi
else
  echo "Soloist run complete"
fi
