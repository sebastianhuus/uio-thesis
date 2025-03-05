#import "template.typ": *

#let create_cover_2_variants(primary-color: uio-fp-blue, secondary-color: uio-fp-blue, cover_image: "") = {
  create_cover_page(primary-color: primary-color, secondary-color: secondary-color)
  create_cover_page(primary-color: primary-color, secondary-color: secondary-color, cover-image: "Solen_av_Edvard_Munch.jpg")
}

#create_cover_2_variants(primary-color: uio-fp-blue, secondary-color: uio-fp-light-blue)
#create_cover_2_variants(primary-color: uio-fp-orange, secondary-color: uio-fp-light-orange)
#create_cover_2_variants(primary-color: uio-fp-pink, secondary-color: uio-fp-light-pink)
#create_cover_2_variants(primary-color: uio-fp-green, secondary-color: uio-fp-light-green)
#create_cover_2_variants(primary-color: uio-fp-gray, secondary-color: uio-fp-light-gray)
#create_cover_2_variants(primary-color: uio-fp-gray, secondary-color: white)
(the very last one has a white secondary color and the one before has a slightly grey one!)
