# bash -x favicon.sh
infile=images/vectors/cdlug1_gray.svg
convSize()
{
    size=$1
    ofile=$2
    convert ${infile} -resize $size $ofile
}
convert ${infile} -resize 16 favicon.ico
convert ${infile} -resize 16 'favicon-16x16.png'
convert ${infile} -resize 32 'favicon-32x32.png'
convert ${infile} -resize 192 'android-chrome-192x192.png'
convert ${infile} -resize 192 'android-chrome-192x192.png'
convert ${infile} -resize 512 'android-chrome-512x512.png'
convert ${infile} -resize 180 apple-touch-icon.png 

cat>browserconfig.xml<<EOF
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
    <msapplication>
        <tile>
            <square150x150logo src="/mstile-150x150.png"/>
            <square310x310logo src="/mstile-310x310.png"/>
            <TileColor>#c2c2c2</TileColor>
        </tile>
    </msapplication>
</browserconfig>
EOF
convert ${infile} -resize 150 mstile-150x150.png
convert ${infile} -resize 310 mstile-310x310.png

convert ${infile} -resize 512 safari-pinned-tab.svg
