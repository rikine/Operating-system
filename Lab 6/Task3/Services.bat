net start > servicesAtStart.txt
net stop FontCache
net start > servicesNow.txt
fc /A servicesAtStart.txt servicesNow.txt > servicesDiff.txt
net start FontCache