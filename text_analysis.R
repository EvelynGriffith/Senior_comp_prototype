# This is my first R document in which I am trying to implement code found in this book: `https://www.tidytextmining.com/tfidf.html?q=jane`
# This is my very first attempt so I am unsure what the code does just yet, and it will most likely have to be 
# edited to fit my purposes.
library(dplyr)
library(janeaustenr)
library(tidytext)

book_words <- austen_books() %>%
  unnest_tokens(word, text) %>%
  count(book, word, sort = TRUE)

total_words <- book_words %>% 
  group_by(book) %>% 
  summarize(total = sum(n))

book_words <- left_join(book_words, total_words)

book_words
#> # A tibble: 40,379 × 4
#>    book              word      n  total
#>    <fct>             <chr> <int>  <int>
#>  1 Mansfield Park    the    6206 160460
#>  2 Mansfield Park    to     5475 160460
#>  3 Mansfield Park    and    5438 160460
#>  4 Emma              to     5239 160996
#>  5 Emma              the    5201 160996
#>  6 Emma              and    4896 160996
#>  7 Mansfield Park    of     4778 160460
#>  8 Pride & Prejudice the    4331 122204
#>  9 Emma              of     4291 160996
#> 10 Pride & Prejudice to     4162 122204
#> # … with 40,369 more rows
