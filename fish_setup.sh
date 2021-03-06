#!/bin/bash
echo "---------- Installing fisher/z ----------"
fisher install jethrokuan/z

echo "---------- Installing fisher/gitnow ----------"
fisher install joseluisq/gitnow@2.10.0

echo "---------- Installing fisher/you-should-use ----------"
fisher install paysonwallach/fish-you-should-use

echo "Setting fish as default prompt"
sudo chsh -s /usr/bin/fish codespace
