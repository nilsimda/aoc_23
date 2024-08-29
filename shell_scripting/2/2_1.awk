#!/usr/bin/env awk -f 
#
BEGIN {
  FS = "[,;:]";
  total = 0;
}

{
  blue = 0;
  red = 0;
  green = 0;
  for (i = 2; i <= NF; i++){
    split($i, arr, " ");
    if($i ~ "blue" && blue < arr[1]){
        blue = arr[1];
    }
    if($i ~ "red" && red < arr[1]){
        red = arr[1];
    }
    if($i ~ "green" && green < arr[1]){
        green = arr[1];
    }
  }
  if(red < 13 && green < 14 && blue < 15){
    split($1, arr, " ");
    total += int(arr[2]);
  }
  printf("%s %d %d %d\n", $1, green, red, blue);
}

END{
  print total;
}

