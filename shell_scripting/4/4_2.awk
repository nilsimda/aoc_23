#!/usr/bin/env awk -f
#
BEGIN {
  FS = "[:|]";
}

{
  n_matches=0;
  split($2, winning_numbers, " ");
  split($3, given_numbers, " ");
  for(key1 in given_numbers){
    for(key2 in winning_numbers){
      if(given_numbers[key1] == winning_numbers[key2]){
        n_matches++;
      }
    }
  }
  # add the original
  if(NR in n_cards){
    n_cards[NR]++;
  }
  else{
    n_cards[NR]=1;
  }

  # every card (copy+original) produces a new card for every match
  n=n_cards[NR]
  for(i=NR+1; i<NR+1+n_matches; i++){
    n_cards[i]+=n;
  }
}

END {
  for(key in n_cards){
    sum+= n_cards[key];
    }
  print sum;
}
