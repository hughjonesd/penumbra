## code to prepare `penumbra` dataset goes here

penumbra <- read.table("data-raw/penumbra.tsv", header = TRUE)
penumbra$rgb_hex <- paste0("#", penumbra$rgb_hex)
usethis::use_data(penumbra, overwrite = TRUE, internal = TRUE)
