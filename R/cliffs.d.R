cliffs.d <- function(a, b) {
  if (!is.numeric(a))
    stop("argument a must be numeric")

  a <- as.numeric(a)

  if(!is.numeric(b))
    stop("argument b must be numeric")

  b <- as.numeric(b)

  out <- .C("cliffsd", 
            control = a, as.integer(length(a)), 
            pilot = b, as.integer(length(b)), 
            delta = as.numeric(0))
  out$delta
}
