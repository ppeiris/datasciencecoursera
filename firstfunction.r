add2 <- function(x, y) {
	x + y # this automatically return since this is the last line
}

above10 <- function(x) {
	use <- x > 10
	x[use]
}

above <- function(x, n = 10) {
	use <- x > n
	x[use]
}

columnmean <- function(y, removeNA = TRUE) {
	nc <- ncol(y)
	means <- numeric(nc)
	for (i in 1:nc) {
		means[i] <- mean(y[, i], na.rm = removeNA)
	}
	means
}

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
