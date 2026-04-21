
## Sanitizes names for HTML `value` and `id` attributes
for (preserve in preserve_list) {
  sanitized_preserve_name <- gsub(" ", "_", preserve)
  cat(paste0("<option value=&quot;", sanitized_preserve_name, ">", preserve, "</option>"))
}


# <!-- Preserve filter -->
#   <div class="filter-container">
#   <label for="preserve-select" class="filter-label">Select Preserve:</label>
#   <select id="preserve-select" class="filter-dropdown">
# ```{r preserve-options, results = 'asis', echo = FALSE}
# # Dynamically generates dropdown options from preserve_list
# for (preserve in preserve_list) {
#   cat(paste0("<option value='", trimws(preserve), "'>", preserve, "</option>"))
# }
# ```
#   </select>
# </div>

  

pests %>%
  select(-c(latitude, longitude)) %>% 
  kbl(col.names = c("Scientific Name", "Common Name", "Date Observed", "Preserve", "Link")) %>%
  kable_styling(bootstrap_options = "hover") %>% 
  row_spec(1:nrow(pests), extra_css = paste0("data-preserve='", pests$preserve, "'"))

te %>%
  select(-c(latitude, longitude)) %>% 
  kbl(col.names = c("Scientific Name", "Common Name", "Date Observed", "Preserve", "Listing", "Link")) %>%
  kable_styling(bootstrap_options = "hover") %>% 
  row_spec(1:nrow(te), extra_css = paste0("data-preserve='", trimws(te$preserve), "'"))


## DT Table example
raretab <- rare %>%
  select(-c(latitude, longitude))

DT::datatable(
  raretab,
  options = list(
    dom = 't',
    pageLength = -1,
    autoWidth = TRUE),
  rownames = FALSE,
  escape = FALSE,
  filter = 'none',
  colnames = c("Scientific Name", "Common Name", "Date Observed", "Preserve", "Link"))