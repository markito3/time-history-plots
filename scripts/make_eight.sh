#!/bin/bash
tag=$1
template=$2
durations=(1 2 6 5)
scales=("days" "weeks" "months" "years")
html_line="<tr><td>${tag}</td>"
for i in `seq 0 3`
do
    # make plot
    output_file=${tag}_${i}.png
    thumbnail_file=${tag}_${i}_thumb.png
    cat $template \
	| sed -e "s/dummy_scale/${scales[$i]}/" \
	| sed -e "s/dummy_duration/${durations[$i]}/" \
	| sed -e "s/dummy_file/$output_file/" \
	> this.thpml
    thplot.sh -b this.thpml
    # make thumbnail
    convert -thumbnail 200 $output_file $thumbnail_file
    html_line=${html_line}"<td><a href=\"$output_file\"><img src=\"$thumbnail_file\"></a></td>"
done
html_line=${html_line}"</tr>"
echo $html_line > ${tag}.html
