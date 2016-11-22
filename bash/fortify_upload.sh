#!/bin/bash

export PATH=$PATH:/usr/share/SCA/bin/
free -g

echo "creating environment for external jar files"
pwd
rm -rf ./ext-jars
mkdir ./ext-jars
ls -ltra ./ext-jars
echo "mv ./ext-jars/*.jar and *.war ./ext-jars"
mv *.jar ./ext-jars
mv *.war ./ext-jars

sub_projs=( soap-handler asu osync vx-sync )

for i in "${sub_projs[@]}" do
    pwd
    cd ./product/production/$i
    echo "Start the Scanning in ..."
    pwd
    echo "analyse this $1"
    echo "sourceanalyzer -b "${SCAN_ID}-$i" -extdirs /var/lib/jenkins/workspace/ehmp-fortify-sca-scan-build-dev/ext-jars -Xmx4G -Xss40M -source 1.7 **/* -64"
    #sourceanalyzer -b "${SCAN_ID}-$i" -extdirs /var/lib/jenkins/workspace/ehmp-fortify-sca-scan-build-dev/ext-jars -Xmx4G -Xss40M -source 1.7 **/* -64 

    echo "Start the creation of the ${SCAN_ID}-$i.fpr ..."
    echo "#sourceanalyzer -source 1.7 -b "${SCAN_ID}-$i" -verbose -logfile "${SCAN_ID}-$i.log" -Xmx5G -Xss540M -scan -f "${SCAN_ID}-$i.fpr" -64 "
    #sourceanalyzer -source 1.7 -b "${SCAN_ID}-$i" -verbose -logfile "${SCAN_ID}-$i.log" -Xmx5G -Xss540M -scan -f "${SCAN_ID}-$i.fpr" -64

    #echo "Start the upload ..."
    #fortifyclient uploadFPR -url "$sscUrl" -f "${SCAN_ID}-$i.fpr" -project "${PROJ}" -version "${VERSION}" -authtoken ${SSC_TOKEN}
    cd -
done

