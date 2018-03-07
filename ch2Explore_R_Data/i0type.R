value <- 999; string <- "Language R"
indicator <- FALSE; complex_num <- 1 + 1i
mode(value); mode(string); mode(indicator); mode(complex_num)

n <- 1
typeof(n)
# 限定为整形，需要赋值用字母L
n <- -1L
typeof(n)

#科学计数
light_speed <- 3.0e8
light_speed

'not available'; NA
'正无穷'; Inf
'负无穷'; -Inf
'Not a number'; NaN