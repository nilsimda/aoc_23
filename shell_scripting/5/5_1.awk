#!/usr/bin/env awk -f
#
{
  if($0 ~ "^seeds: "){sub("seeds: ", "", $0);split($0, seeds, " ");next;}
  if($0 ~ " map:$"){for(key in seeds){seed_updated[key] = 0;}next;}
  if($0 ~ "^[0-9]"){
    source_start = $2; dest_start = $1; range = $3;
    for(key in seeds){
      seed = seeds[key]
      if(!seed_updated[key] && source_start <= seed && seed < source_start + range){
        seeds[key] = dest_start + (seed - source_start);
        seed_updated[key] = 1;
      }
    }
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
