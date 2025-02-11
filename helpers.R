
get_science_score <- function(a,o,e){
  out <-  a^2 + o^2 + e^2 + 7 * min(a,o,e)
  return(out)
}

get_two_combo <- function(OA){
  n = OA
  v1 <- 0:n
  v2 <- n-v1
  out <- data.frame(v1, v2)
  symb <- paste(unlist(strsplit(deparse(substitute(OA)), "") ) ,2, sep = "")
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
  colnames(out) <- c("A3","O3", "E3")
  return(out)
}


get_combination <- function(x, y){
  left <- dplyr::slice(x,rep(1:dplyr::n(), each = nrow(y)))
  right <- dplyr::slice(y,rep(1:dplyr::n(), nrow(x)))
  
  out <- cbind(left, right)
  return(out)
}

get_combo <- function(OE, AOE){
  x <- get_two_combo(OE)
  y <- get_three_combo(AOE)
  
  out <- get_combination(x,y)
  return(out)
  
}

get_n_symb <- function(last, v){
  has_a <- stringr::str_detect(colnames(last), v)
  
  if(sum(has_a)<=1){
    out <- last[,has_a]
  } else{  out <- rowSums(last[,has_a])
  }
  
  return(out)
}

get_sci <- function(A=0,O=0,E=0,AO = 0, AE=0, OE = 0, AOE = 0,plus = 0){
  if (AO > 0) {
    three <- get_combo(AO, AOE)
  }else if (AE > 0){
    three <- get_combo(AE, AOE)
    
  }else if (OE > 0){
    three <- get_combo(OE, AOE)
    
  }else{three = data.frame()}
  
  d <- data.frame(A,O,E)
  
  if (nrow(three) == 0){
    last = d
    
  } else {
    last <- get_combination(d,three)
    
  }
  
  last$a <- get_n_symb(last, "A")
  last$o <- get_n_symb(last, "O")
  last$e <- get_n_symb(last, "E")
  
  omega <- dplyr::select(last, a,o,e)
  
  which_one_max <- character()
  
  for (i in 1:nrow(omega)) {
    which_one_max[i] <- colnames(omega)[which.max(omega[i,])]
    
  }
  
  alpha <- omega
  for (i in 1:nrow(alpha)) {
    alpha[i, which_one_max[i]] <- alpha[i, which_one_max[i]] + plus
  }
  
  alpha$score <- get_science_score(alpha$a, alpha$o, alpha$e)
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
