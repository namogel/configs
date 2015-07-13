#!/bin/bash
c=`xxd -p -s 0x0300d5 -l 5 sublime_text`
if [[ $c == "85c00f94c0" ]]; then
    cp sublime_text sublime_text.bak
    echo "0300d5: 31c083c001" | xxd -r - sublime_text
    echo "32f927: 437261636b656420627920456973656e" | xxd -r - sublime_text
    echo "32f937: 6865696d2d456e6a6f792100" | xxd -r - sublime_text
elif [[ $c == "31c083c001" ]]; then
    echo "already patched"
else
    echo "incorrect binary"
fi
