#!/usr/bin/env awk -f
#
BEGIN {
  FS = "[:|]";
  total=0;
}

{
  current=1;
  match_flag=0;
  split($2, winning_numbers, " ");
  split($3, given_numbers, " ");
  for(key1 in given_numbers){
    for(key2 in winning_numbers){
      if(given_numbers[key1] == winning_numbers[key2]){
        if(match_flag == 0){
          match_flag++;
        }
        else{
          current*=2;
        }
      }
    }
  }
  if(match_flag == 1){
    total += current;
  }
}

END {
  print total;
}
