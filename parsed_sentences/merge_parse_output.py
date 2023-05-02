# Script to read all xml parses from TuLiPA in the folder,
# and collect them together into one file. To be run with
# Python 3.
#
# Usage:
#    > python3 merge_parse_output.py [folder] [outfile]

import sys
import os
import xml.etree.ElementTree as ET

XMLFOLDER = sys.argv[1]
OUTPATH = sys.argv[2]

xmltree = None
accepted_sentences = 0
parses_found = 0

for filename in os.listdir(XMLFOLDER):
    if filename.endswith(".xml") and filename != OUTPATH:
        print(filename)
        filecontent = open("{}/{}".format(XMLFOLDER, filename)).readlines()
        if "".join(filecontent).strip() != "":
            
            header = "".join(filecontent[:2])
            newcontent = "".join(filecontent[2:])
            if xmltree is None:
                if newcontent.strip() != "":
                    xmltree = ET.fromstring(newcontent)

            else:
                if newcontent.strip() != "":
                    additional_xml = ET.fromstring(newcontent)
                    sent_is_accepted = False
                    for new_entry in additional_xml.iter("entry"):
                        if not sent_is_accepted:
                            accepted_sentences += 1
                            sent_is_accepted = True
                        parses_found += 1
                        xmltree.append(new_entry)

xmltree_forfile = ET.ElementTree(xmltree)
xmltree_withheader = ET.tostring(xmltree, encoding='unicode', method='xml')

with open(OUTPATH, "w", encoding="utf8") as outfile:
    print(header, file=outfile)
    print(xmltree_withheader, file=outfile)

print("Found {} files containing a total of {} successful sentence parses. Wrote results to file {}.".format(accepted_sentences, parses_found, OUTPATH))