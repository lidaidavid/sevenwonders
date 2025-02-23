
get_science_score <- function(alpha){
  
  
  
  score_1 <-  alpha$A^2 + alpha$O^2 + alpha$E^2 
  score_2 <- apply(alpha, 1, min) * 7
  
  out <- score_1 + score_2
  return(out)
}



get_two_combo <- function(OA){
  n = OA
  v1 <- 0:n
  v2 <- n-v1
  out <- data.frame(v1, v2)
  symb <- paste(unlist(strsplit(deparse(substitute(OA)), "") ) ,deparse(substitute(OA)), sep = "_")
  colnames(out) <- symb
  return(out)
}


get_three_combo <- function(AOE){
  n = AOE
  out = data.frame()
  for (i in 0:n) {
    OE = n-i
    temp <- get_two_combo(OE)
    d1 <- cbind(A2=i, temp)
    out <- rbind(out, d1)
  }
  colnames(out) <- c("A_AOE","O_AOE", "E_AOE")
  return(out)
}

# dt_three <- get_three_combo(AOE)


get_combination <- function(x, y){
  left <- dplyr::slice(x,rep(1:dplyr::n(), each = nrow(y)))
  right <- dplyr::slice(y,rep(1:dplyr::n(), nrow(x)))
  
  out <- cbind(left, right)
  return(out)
}

get_combination_plus <- function(x, y){
  temp <- get_combination(x,y)
  out <- temp[,1:3] + temp[,4:6]
  return(out)
  
}


# https://7-wonders.fandom.com/wiki/Leader_Cards

get_n_symb <- function(last, v){
  has_a <- stringr::str_detect(colnames(last), v)
  
  if(sum(has_a)<=1){
    out <- last[,has_a]
  } else{  out <- rowSums(last[,has_a])
  }
  
  return(out)
}

get_n_symb_dt <- function(dt_two){

dt_two$A <- get_n_symb(dt_two, "A_")
dt_two$O <- get_n_symb(dt_two, "O_")
dt_two$E <- get_n_symb(dt_two, "E_")
out <- dplyr::select(dt_two, A, O, E ) 

return(out)

}





# A = 0
# O = 1
# E = 1
# 
# AO = 0
# AE = 0
# OE = 0
# 
# AOE = 1
# 
# cycle = 0
# plus = 1

get_sci <- function(A=0,O=0,E=0,AO = 0, AE=0, OE = 0, AOE = 0, plus = 0, cycle = 0){
  
  dt_OE <- get_two_combo(OE)
  dt_AO <- get_two_combo(AO)
  dt_AE <- get_two_combo(AE)

  dt_two <- get_combination(get_combination(dt_OE, dt_AO),dt_AE)
  

  if(cycle > 0){
    AOE = AOE + 1
    dt_minus <- data.frame(A_cycle = c(-1,0,0),
                           O_cycle = c(0,-1,0),
                           E_cycle = c(0,0,-1))
    if(A == 0){dt_minus$A_cycle = 0}
    if(O == 0){dt_minus$O_cycle = 0}
    if(E == 0){dt_minus$E_cycle = 0}
  }else{
    dt_minus <- data.frame(A_cycle = c(0),
                           O_cycle = c(0),
                           E_cycle = c(0))
  }
  
    dt_three <- get_three_combo(AOE)
  
  

  
  d <- data.frame(A,O,E)
  two <- get_n_symb_dt(dt_two)
  three <- get_n_symb_dt(dt_three)
  minus <- get_n_symb_dt(dt_minus)
  
  last <-  get_combination_plus(get_combination_plus(get_combination_plus(d,three), two), minus)
  

  which_one_max <- character()

  for (i in 1:nrow(last)) {
    which_one_max[i] <- colnames(last)[which.max(last[i,])]

  }

  alpha <- last
  for (i in 1:nrow(alpha)) {
    alpha[i, which_one_max[i]] <- alpha[i, which_one_max[i]] + plus
  }

  alpha$score <- get_science_score(alpha)
  alpha <- dplyr::arrange(alpha,desc(score))
  
  colnames(alpha) <- c("A", "O", "E", "score")
  return(alpha)
}


get_wl <- function(fight){
  n <- length(fight)
  
  left <- c(fight[n],fight[-n])
  right <- c(fight[-1],fight[1])
  
  temp <- data.frame(id = 1:n, wp = fight, left, right)
  
  temp$fight_left <- temp$wp - temp$left
  
  temp$fight_right <- temp$wp - temp$right
  
  temp$left_result <- ifelse(temp$fight_left > 0, "W", ifelse(temp$fight_left < 0, "L", ""))
  temp$right_result <- ifelse(temp$fight_right > 0, "W", ifelse(temp$fight_right < 0, "L", ""))
  
  temp$result <- stringr::str_c(temp$left_result, temp$right_result)
  out <- dplyr::select(temp, id, wp, result)
  
  return(out)
}

get_money <- function(coin=0, debt=0){
  score <- floor((coin/3)) - debt
  out <- data.frame(coin, debt, score)
  return(out)
}

get_total <- function(np,name, war=0, coin=0, wonder=0, blue=0, green=0, yellow=0, purple=0, black=0, white=0, ship=0, island=0){
  
  temp <- data.frame(name,
                     war,
                     coin,
                     wonder,
                     blue,
                     green,
                     yellow,
                     purple,
                     black,
                     white,
                     ship,
                     island)
  temp$total <- rowSums(temp[, 2:ncol(temp)], na.rm = T)
  
  if (np == 6) {
    temp$team1 <- sum(temp$total[1:3], na.rm = T)
    temp$team2 <- sum(temp$total[4:6], na.rm = T)
  } else if(np ==4){
    temp$team1 <- sum(temp$total[1:2], na.rm = T)
    temp$team2 <- sum(temp$total[3:4], na.rm = T)
  } else {
    temp$team1 <- 0
    temp$team2 <- 0
  }
  temp <- dplyr::arrange(temp,desc(total))
  
  return(temp)
}
