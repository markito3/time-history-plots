#!/bin/bash
tag=$1
thpml=$2
    # make plot
    output_file=${tag}.png
    thumbnail_file=${tag}_thumb.png
    thplot.sh -b $thpml
    # make thumbnail
    convert -thumbnail 200 $output_file $thumbnail_file
    html_line="<a href=\"$output_file\"><img src=\"$thumbnail_file\">"
echo $html_line > ${tag}.html
