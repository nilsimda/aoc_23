#!/usr/bin/env awk -f
#
{
  if($0 ~ "^[0-9]"){
    source_start = $2; dest_start = $1; range = $3;
    for(key in seeds){
      seed = seeds[key]
      if(!seed_updated[key] && source_start <= seed && seed < source_start + range){
        seeds[key] = dest_start + (seed - source_start);
        seed_updated[key] = 1;
      }
    }
    next;
  }
  if($0 ~ " map:$"){for(key in seeds){seed_updated[key] = 0;}next;}
  if($0 ~ "^seeds: "){
    sub("seeds: ", "", $0);
    counter=1;
    for(i=1; i<NF; i+=2){
      start=$i; range=$(i+1);
      for(ii=start; ii<start+range; ii++){
        seeds[counter] = ii;
        counter++;
        }
    }
    print counter;
  }
}

END{
  min = seeds[1];
  for(key in seeds){
    if(min > seeds[key]){
      min = seeds[key];
    }
  }
  print min;
}
