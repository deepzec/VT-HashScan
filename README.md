# VT-HashScan

Powershell script to scan multiple malware hashes in VT and check your AV vendor detection status. 

* Add your malware hashes in HashList.txt file
* Change vendor name in "{$_.Engine -eq 'TrendMicro'}" to match against different vendors
* Script will generate an output file Trend_detection.txt with detection details


