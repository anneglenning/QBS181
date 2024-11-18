# Custom Function Library

#Create boxplots for Maricosa County median comparisons
custom_boxplot <- function(data, y_var, fill_color, y_label) {
  ggplot(data, aes_string(y = y_var)) +
    geom_boxplot(fill = fill_color, color = "darkblue", outlier.color = "black",
                 outlier.shape = 16, outlier.size = 2) +
    labs(y = y_label) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
      axis.text.y = element_text(size = 12),
      axis.title.y = element_text(size = 14)
    )
}