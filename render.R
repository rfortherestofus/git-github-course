library(tidyverse)
library(pagedown)
library(rmarkdown)


# Render slides -----------------------------------------------------------

render("slides.Rmd")

chrome_print("slides.html", "slides.pdf",
             timeout = 180)


# Create GIF of slides ----------------------------------------------------

pdf_to_gif <- function(pdf_location,
                       gif_file_path = here::here(),
                       gif_file_name,
                       density = 50) {
  
  pdf_doc <- magick::image_read_pdf(pdf_location,
                                    density = 50)
  
  gif_file_name_and_path <- stringr::str_glue("{gif_file_path}/{gif_file_name}")
  
  pdf_doc %>%
    magick::image_animate(fps = 0.5) %>%
    magick::image_write(path = gif_file_name_and_path)
  
}


pdf_to_gif("slides.pdf",  gif_file_name = "slides.gif")
