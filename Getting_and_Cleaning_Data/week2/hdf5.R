
# Install HDF5
# source("http://bioconductor.org/biocLite.R")
# biocLite("rhdf5")
# ********************************************************


library(rhdf5)

if (!file.exists("example.h5")) {
    h5createFile("example.h5")
}

# Create groups in HDF5 file
h5createGroup("example.h5", "foo")
h5createGroup("example.h5", "baa")
h5createGroup("example.h5", "foo/foobaa")




# Write to groups

A = matrix(1:10, nr = 5, nc = 2)
h5write(A, "example.h5", "foo/A")


B = array(seq(0.1, 2.0, by = 0.1), dim = c(5, 2, 2))

attr(B, "scale") <- "liter"

h5write(B, "example.h5", "foo/foobaa/B")



h5write(c(12,13,14), "example.h5", "foo/A", index = list(1:3, 1))


tmp <- h5read("example.h5", "foo/A")

print(tmp)


# print(h5ls("example.h5"))


