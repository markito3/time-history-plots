#!/bin/bash
tag=$1
template=$2
durations=(2 1 2 6)
scales=("hours" "days" "weeks" "months")
html_line="<tr><td>${tag}</td>"
for i in `seq 0 3`
do
    # make plot
    echo ${durations[$i]} ${scales[$i]}
    output_file=${tag}_${i}.png
    thumbnail_file=${tag}_${i}_thumb.png
    echo $template $output_file
    cat $template \
	| sed -e "s/dummy_scale/${scales[$i]}/" \
	| sed -e "s/dummy_duration/${durations[$i]}/" \
	| sed -e "s/dummy_file/$output_file/" \
	> this.dpml
    thplot.sh -b this.dpml
    # make thumbnail
    convert -thumbnail 200 $output_file $thumbnail_file
    html_line=${html_line}"<td><a href=\"$output_file\"><img src=\"$thumbnail_file\"></a></td>"
done
html_line=${html_line}"</tr>"
echo $html_line > ${tag}.html
