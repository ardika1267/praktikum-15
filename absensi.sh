#!/bin/bash
echo "=== MENU ABSENSI MAHASISWA ==="
echo "1. Lihat Data Absensi"
echo "2. Lihat Mahasiswa Hadir"
echo "3. Rekap Absensi"
read -p "Pilih menu: " pilih

case $pilih in
1) awk '{print}' absensi.txt ;;
2) awk '$3=="Hadir" {print $2}' absensi.txt ;;
3) awk '{
   if ($3=="Hadir") h++
   else if ($3=="Alpha") a++
   else if ($3=="Izin") i++
   else if ($3=="Sakit") s++
}
END{
   print "Hadir :",h
   print "Alpha :",a
   print "Izin  :",i
   print "Sakit :",s
}' absensi.txt ;;
*) echo "Menu tidak tersedia" ;;
esac
