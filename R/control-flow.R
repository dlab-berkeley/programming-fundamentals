# R has very similar patterns

a <- 1
print(a + 1)

# Loops can be harder

sum_a <- 0
for(a in c(1, 2, 3)) {
  sum_a <- sum_a + a
}

print(a)

# Functions add even more complexity

add_these <- function(a, b) {
  c <- a + b * 2
  return(c)
}

multiply_these <- function(a, b) {
  c <- a * b + 2
  return(c)
}

pairs <- list(c(1, 2), c(3, 4), c(5, 6))
complex_result <- 0
for(pair in pairs) {
  d <- add_these(pair[1], pair[2])
  complex_result <- multiply_these(d, complex_result)
}

print(complex_result)