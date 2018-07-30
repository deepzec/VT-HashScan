# PS-VTScan

Powershell script to scan multiple malicious hashes in VT and check detection for a AV vendor. 

* Add your malware hashes in HashList.txt file
* Change vendor name in "{$_.Engine -eq 'TrendMicro'}" to match against different vendors
* Script will generate an output file Trend_detection.txt with detection details


