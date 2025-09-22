packages <- c("tidyverse","lubridate","readr","janitor","scales","skimr","factoextra","cluster")
install.packages(setdiff(packages, rownames(installed.packages())), dependencies = TRUE)

library(tidyverse)
library(lubridate)
library(readr)
library(janitor)
library(scales)
library(skimr)
library(cluster)
library(factoextra)
library(readxl) 

tx <- read_excel("C:/Users/tracy/Downloads/QVI_transaction_data.xlsx")
cust <- read_csv("C:/Users/tracy/Downloads/QVI_purchase_behaviour.csv")

glimpse(tx)
glimpse(cust)

skim(tx)
skim(cust)

tx <- tx %>% clean_names()  
cust <- cust %>% clean_names()


if (is.numeric(tx$date)) {
  tx <- tx %>% mutate(date = as.Date(date, origin = "1899-12-30"))
} else {
  tx <- tx %>% mutate(date = lubridate::ymd(date))
}
range(tx$date, na.rm = TRUE)


library(stringr)
words_tbl <- tx %>% 
  pull(prod_name) %>% 
  str_to_lower() %>% 
  str_split("\\s+") %>% 
  unlist() %>% 
  table() %>% 
  as.data.frame() %>% 
  arrange(desc(Freq))
head(words_tbl, 40)

tx <- tx %>% filter(!str_detect(str_to_lower(prod_name), "salsa"))

tx <- tx %>% distinct()
cust <- cust %>% distinct()

tx %>% arrange(desc(prod_qty)) %>% slice(1:20)
tx %>% group_by(lylty_card_nbr) %>% summarise(total_units = sum(prod_qty, na.rm = TRUE),
                                              n_tx = n()) %>% arrange(desc(total_units)) %>% slice(1:20)

wholesale_customers <- tx %>%
  group_by(lylty_card_nbr) %>%
  summarise(total_units = sum(prod_qty, na.rm = TRUE)) %>%
  filter(total_units > 100) %>% pull(lylty_card_nbr)

tx_clean <- tx %>% filter(!(lylty_card_nbr %in% wholesale_customers))

library(readr)   
tx_clean <- tx_clean %>%
  mutate(
    pack_size = parse_number(prod_name),             
    brand = str_to_upper(str_trim(word(prod_name, 1))), 
    price_per_unit = tot_sales / prod_qty
  )

tx_clean <- tx_clean %>%
  mutate(brand = case_when(
    brand %in% c("RED","RRD") ~ "RRD",
    brand %in% c("LAYS","LAY'S","LAYS") ~ "LAYS",
    TRUE ~ brand
  ))
tx_clean %>% count(pack_size, sort = TRUE) %>% head(20)
tx_clean %>% count(brand, sort = TRUE) %>% head(30)

data <- tx_clean %>% left_join(cust, by = "lylty_card_nbr")
sum(is.na(data$lifestage))  # ideally 0


reference_date <- max(data$date, na.rm = TRUE) 

cust_metrics <- data %>%
  group_by(lylty_card_nbr, lifestage, premium_customer) %>%
  summarise(
    total_sales = sum(tot_sales, na.rm = TRUE),
    total_units = sum(prod_qty, na.rm = TRUE),
    transactions = n(),
    avg_spend_per_txn = total_sales / transactions,
    last_purchase = max(date, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(
    recency_days = as.numeric(reference_date - last_purchase),
    frequency = transactions,
    monetary = total_sales
  )

cust_rfm <- cust_metrics %>%
  mutate(
    R_score = ntile(-recency_days, 5),
    F_score = ntile(frequency, 5),
    M_score = ntile(monetary, 5),
    rfm_score = paste0(R_score, F_score, M_score)
  )
table(cust_rfm$rfm_score) %>% head()


set.seed(123)
rfm_scaled <- scale(cust_rfm %>% select(recency_days, frequency, monetary))
fviz_nbclust(rfm_scaled, kmeans, method = "wss") 
k <- 4
km <- kmeans(rfm_scaled, centers = k, nstart = 25)
cust_rfm$cluster <- factor(km$cluster)

cust_rfm %>% group_by(cluster) %>%
  summarise(n = n(),
            avg_total_sales = mean(monetary),
            avg_frequency = mean(frequency),
            avg_recency = mean(recency_days)) %>%
  arrange(desc(avg_total_sales))


sales_seg <- data %>% group_by(lifestage, premium_customer) %>%
  summarise(total_sales = sum(tot_sales, na.rm = TRUE), .groups = "drop")

ggplot(sales_seg, aes(x = reorder(lifestage, total_sales), y = total_sales, fill = premium_customer)) +
  geom_col(position = "dodge") + coord_flip() + labs(x="Lifestage", y="Total sales", title="Total sales by segment") +
  theme_minimal()
ggsave(
  filename = "C:/Users/tracy/Downloads/total_sales_by_segment.png",
  width = 8, 
  height = 6, 
  dpi = 300
)


ggplot(data %>% filter(!is.na(pack_size)), aes(x = pack_size)) +
  geom_histogram(binwidth = 25) + labs(title="Pack size distribution", x="Pack size (g)", y="Count") +
  theme_minimal()
ggsave(
  filename = "C:/Users/tracy/Downloads/pack_size_distribution.png",
  width = 8, 
  height = 6, 
  dpi = 300
)


brand_sales <- data %>% group_by(brand) %>% summarise(total_sales = sum(tot_sales, na.rm=TRUE)) %>% arrange(desc(total_sales))
ggplot(brand_sales %>% slice(1:20), aes(x=reorder(brand, total_sales), y=total_sales)) + geom_col() + coord_flip()
ggsave(
  filename = "C:/Users/tracy/Downloads/top20_brand_sales.png",
  width = 8, 
  height = 6, 
  dpi = 300
)


ggplot(cust_rfm, aes(x=frequency, y=monetary, color=cluster)) + geom_point(alpha=0.6) + scale_y_log10() +
  labs(title="Customer segments: Frequency vs Monetary") + theme_minimal()
ggsave(
  filename = "C:/Users/tracy/Downloads/frequencyvsmonetary.png",
  width = 8, 
  height = 6, 
  dpi = 300
)

write_csv(tx_clean, file.path(path, "transactions_clean.csv"))
write_csv(cust_metrics, file.path(path, "customer_metrics.csv"))
write_csv(cust_rfm, file.path(path, "customer_rfm_segments.csv"))
