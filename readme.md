# XMG Metagrammars for a lexicalized tree adjoining grammar modeling various English verb alternations and related constructions
Accompanying repository to the PhD thesis of Esther Seyffarth.

## Contents
The folder `metagrammars` contains the code for each metagrammar (cmciaa, ciaisa, combined), as well as scripts for compiling the metagrammars and parsing example sentences. 

The metagrammars have the following content:
* `cmciaa`: Models for the caused-motion construction and the induced action alternation (thesis chapter 6)
* `ciaisa`: Models for the causative-inchoative alternation and the instrument subject alternation (thesis chapter 7)
* `combined`: Models for the caused-motion construction, the induced action alternation, the causative-inchoative alternation and the instrument subject alternation (thesis chapter 8)

Each metagrammar folder contains the following:
* `lemma`, `morph`, `syn`, `frame` dimensions
* A separate type hierarchy file
* A text file containing example sentences

The folder `parsed_sentences` contains folders for the parse results for each metagrammar. The parse results for each metagrammar are also available as a single file. Each `xml` file can be uploaded to [the XMG WebGUI Viewer](https://xmg.phil.hhu.de/index.php/upload/viewer) for a graphical output of tree structures and semantic frames.

The file `all_parse_results.xml` contains the parse results for all example sentences as accepted by the grammar compiled from the `combined` metagrammar. This file contains all analyses as they are presented in the thesis.

## How to reproduce
The metagrammars have been successfully compiled using version `b032dfab7b5dfd8f3c902359ce2466974d3f154e` of [XMG-2](https://github.com/spetitjean/XMG-2). The example sentences have been successfully parsed using version `211162daa2e1f88737b8c8f97fcbe042f29447a7` of [TuLiPA](https://github.com/spetitjean/TuLiPA-frames).

Re-compile the metagrammars individually using the script `./metagrammars/compile_mg.sh`.

Re-parse the sentences for an individual metagrammar using the script `./metagrammars/parse_test_sentences.sh`.

Combine the sentence parse output files into one file per metagrammar using the script `./parsed_sentences/merge_parse_output.py`.