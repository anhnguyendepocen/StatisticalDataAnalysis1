---
title: "STT3850 Statistical Data Analysis 1<br>Fall 2019 Course Schedule"
author: "Instructor: Jill E. Thomley (thomleyje@appstate.edu)"
date: 'Updated: Saturday, August 31, 2019 @ 01:05:51 PM'
output: 
  html_document: 
    toc: true
    toc_depth: 3
    toc_float: true
    highlight: textmate
    theme: cosmo
    css: "../css/style.css"
    keep_md: yes
---

***

<div class="rmdimportant">
<ul>
<li><strong>This schedule is a work in progress. Check often for updates!</strong></li>
<li><strong>MAJOR ASSESSMENTS / DUE DATES</strong>
<ul>
<li>Project 1 --- SUN, SEP 22 @ 11pm</li>
<li>Project 2 --- SUN, OCT 13 @ 11pm</li>
<li>Project 3 --- SUN, NOV 24 @ 11pm</li>
<li>Group Project --- WED, DEC 04 @ 11pm (Reading Day)</li>
<li>Final Exam for Section 103 --- TUE, DEC 10 @ 11am</li>
<li>Final Exam for Section 104 --- THU, DEC 05 @ 02pm</li>
<li>See schedule and AsULearn for DataCamp assessments.</li>
</ul></li>
<li><strong>Class meets on Tuesday, Wednesday, and Thursday, with exceptions noted.</strong></li>
<li><strong>Most assignments are due on Sunday @ 11pm of the week in which they appear.</strong></li>
<li><strong>Refer to AsULearn for more detailed assignment instructions, rubrics, and grades.</strong></li>
</ul>
</div>

<div class="rmdnote">
<ul>
<li>We will use rental and free digital textbooks.</li>
<li>All required software for this course is provided.</li>
<li>Please bring a notebook and pencil to every class.</li>
<li>Be prepared to actively participate and collaborate.</li>
<li>Refer to the <a href="../SyllabusSchedule/STT3850F19Syllabus.html">Course Syllabus</a> for additional details.</li>
</ul>
</div>


***
### Course Overview

STT3850 is a 3000-level introductory course with no statistics prerequisite, required for students from several majors who come into the course with a broad mix of mathematics, statistics, and programming skills. This means that the most effective mode of instruction tends to be a semi-flipped approach where some lecture occurs outside the classroom in the form of videos. This frees up class time to spend on collaborative work where students can give and receive help from peers and the instructor. Do not treat this instructional mode as an invitation to skip class! Your classmates are one of your greatest resources.

**Abbreviations**

MSRR = Mathematical Statistics with Resampling and R (rental textbook)  
MD = [Modern Dive](https://moderndive.com/) (digital textbook)  
DC = [DataCamp](https://www.datacamp.com/) (online tutorials)  


***
## Section 1: Programming

### Proficiencies

* Logical operators
* Vectors, matrices, lists
* `for` and `while` loops
* Writing basic functions
* Working in RStudio
* Using [R Markdown](https://rmarkdown.rstudio.com/)

### Explorations

* MSRR Chapter 1. Data and Case Studies
* MD [Chapter 1. Introduction](https://moderndive.com/index.html)
* MD [Chapter 2. Getting Started with Data in R](https://moderndive.com/2-getting-started.html)
* Video: [The History of S and R](https://youtu.be/jk9S3RTAl38) (~10 minutes)
* Video: [Introduction to the R Language](https://youtu.be/APm4SxJx0eg) (~30 minutes)
* [Getting used to R, RStudio, and R Markdown](https://ismayc.github.io/rbasics-book/)
* [Advanced `R` Style Guide](http://adv-r.had.co.nz/Style.html)
* [Initial Steps Toward Reproducible Research](https://kbroman.org/steps2rr/)
* [ASA Statement on the Role of Statistics in Data Science](http://magazine.amstat.org/blog/2015/10/01/asa-statement-on-the-role-of-statistics-in-data-science/)
* [A Tutorial on Using Functions in R!](https://www.datacamp.com/community/tutorials/functions-in-r-a-tutorial) <span style="color: red;">NEW!</span>
* [R Functions in Detail (With Examples)](https://www.datamentor.io/r-programming/function/) <span style="color: red;">NEW!</span>
* [Programming with R: Creating Functions](https://swcarpentry.github.io/r-novice-inflammation/02-func-R/) <span style="color: red;">NEW!</span>

### Week 01 (AUG 19)

#### In-Class Engagement

* Course introduction
* Technology accounts set-up
* Basics of the RStudio server 
* `R` scripts and R Markdown
* [YaRrr! Vectors](https://bookdown.org/ndphillips/YaRrr/vectors.html)
* [YaRrr! Creating matrices and dataframes](https://bookdown.org/ndphillips/YaRrr/creating-matrices-and-dataframes.html)

#### Integrations (Due SUN @ 11pm)

* [DataCamp](https://www.datacamp.com/) account 
* [RStudio server](https://mathr.math.appstate.edu) sign-in 
* Private Forum message 
* DC [Introduction to `R`](https://www.datacamp.com/courses/free-introduction-to-r)
* Introduction to R Feedback Survey

### Week 02 (AUG 26)

No class TUE, AUG 27 (Convocation)

#### In-Class Engagement

* `for` and `while`loops
* Writing basic functions
* More about `R` Markdown

#### Integrations (Due SUN @ 11pm)

* DC [Intermediate `R`](https://www.datacamp.com/courses/intermediate-r)
* Intermediate R Feedback Survey

<div class="rmdnote">
<ul>
<li>Material in all subsequent sections and assessments rely heavily on the skills you will learn here. Gaining a reasonable amount of proficiency now will save you time later. Take good notes and practice!</li>
<li>Check out <a href="https://www.rstudio.com/resources/cheatsheets/">RStudio Cheat Sheets</a> for base <code>R</code> and the <code>R</code> Markdown Reference Guide.</li>
</ul>
</div>


***
## Section 2: Exploring (EDA)

### Proficiencies

* Frequency tables
* Summary statistics
* Graphs/visualizations 
    * barplots
    * histograms
    * densities
    * boxplots
* Assessing normality
* `tidyverse` tools

### Explorations

* MSRR Chapter 2. Exploratory Data Analysis
* MD [Chapter 3. Data Visualization](https://moderndive.com/3-viz.html)
* MD [Chapter 4. Data Wrangling](https://moderndive.com/4-wrangling.html)
* MD [Chapter 5. Data Importing & “Tidy” Data](https://moderndive.com/5-tidy.html)
* Slides: [Introduction to Datasets](https://stat-jet-asu.github.io/StatisticalDataAnalysis1/Slides/01_IntroToDatasets.html)
* Slides: [EDA---Categorical Data](https://stat-jet-asu.github.io/StatisticalDataAnalysis1/Slides/02_EDACategorical.html)
* Slides: [EDA---Numerical Data](https://stat-jet-asu.github.io/StatisticalDataAnalysis1/Slides/03_EDANumerical.html)
* Slides: [Normal Distribution](https://stat-jet-asu.github.io/StatisticalDataAnalysis1/Slides/04_NormalDistribution.html)
* Slides: [Assessing Normality](https://stat-jet-asu.github.io/StatisticalDataAnalysis1/Slides/05_NormalAssessment.html)
* Video: [Measures of Central Tendency](https://youtu.be/NM_iOLUwZFA) (~ 9 minutes)
* Video: [Measures of Variability](https://youtu.be/Cx2tGUze60s) (~ 12 minutes)
* Video: [The Sample Variance: Why Divide by n-1?](https://youtu.be/9ONRMymR2Eg) (~ 7 minutes)
* Video: [Proof that Sample Variance is Unbiased](https://youtu.be/D1hgiAla3KI) (~ 7 minutes)
* Video: [An Introduction to the Normal Distribution](https://youtu.be/iYiOVISWXS4) (~ 6 minutes)
* Video: [Standardizing Normally Distributed Random Variables](https://youtu.be/4R8xm19DmPM) (~ 11 minutes)
* Video: [Normal Quantile-Quantile Plot](https://youtu.be/X9_ISJ0YpGw) (~ 12 minutes)
* [GGPlot Examples Best Reference](https://www.datanovia.com/en/blog/ggplot-examples-best-reference/)
* [`ggplot2` reference page](https://ggplot2.tidyverse.org/reference/index.html)
* [`dplyr` reference page](https://dplyr.tidyverse.org/reference/index.html)
* [`tidyr` reference page](https://tidyr.tidyverse.org/reference/index.html)

### Week 03 (SEP 02)

#### In-Class Engagement

* [introduction to `dplyr`](http://stat545.com/block009_dplyr-intro.html)
* [`dplyr` functions for a single dataset](http://stat545.com/block010_dplyr-end-single-table.html)
* [Introduction to `ggplot2`](https://uc-r.github.io/ggplot_intro)

#### Integrations (Due SUN @ 11pm)

* DC [Introduction to Data](https://www.datacamp.com/courses/introduction-to-data)
* Introduction to Data Feedback Survey
* DC [Introduction to the Tidyverse](https://www.datacamp.com/courses/introduction-to-the-tidyverse)
* Introduction to the Tidyverse Feedback Survey

### Week 04 (SEP 09)

#### In-Class Engagement

* [How to Change GGPlot Labels](https://www.datanovia.com/en/blog/how-to-change-ggplot-labels/)
* Boxplots and detecting outliers in data
* Normal distribution and assessing normality

#### Integrations (Due SUN @ 11pm)

* DC [Data Visualization with `ggplot2` (Part 1)](https://www.datacamp.com/courses/data-visualization-with-ggplot2-1)
* Data Visualization with `ggplot2` (Part 1) Feedback Survey
* DC [Exploratory Data Analysis](https://www.datacamp.com/courses/exploratory-data-analysis)
* Exploratory Data Analysis Feedback Survey

<div class="rmdnote">
<ul>
<li>The <a href="https://www.tidyverse.org/"><code>tidyverse</code></a> is &quot;an opinionated collection of R packages designed for data science&quot; that share a common philosophy for effective data manipulation, explorations and visualization. We will use <code>tidy</code> data concepts and packages throughout this course, especially <code>dplyr</code> and <code>ggplot2</code>.</li>
<li>Check out <a href="https://www.rstudio.com/resources/cheatsheets/">RStudio Cheat Sheets</a> for data transformation, data visualization, <code>R</code> Markdown, and more.</li>
</ul>
</div>


*** 
## Project 1

### Week 05 (SEP 16)

#### In-Class Engagement

* Work on Project 1

#### Integrations (Due SUN @ 11pm)

* Project 1 write-up


***
## Section 3: Modeling

### Proficiencies

* Scatterplots
* Pearson correlation
* Simple linear models
* Parallel slopes model
* Model interpretation
    * R^2^
    * MSE and RSME
    * Slope / intercept
* Predicting with models
* `moderndive` tools

### Explorations

* MD [Chapter 6. Basic Regression](https://moderndive.com/6-regression.html)
* MD [Chapter 7. Multiple Regression](https://moderndive.com/7-multiple-regression.html)
* Slides: [Introduction to Datasets](https://stat-jet-asu.github.io/StatisticalDataAnalysis1/Slides/01_IntroToDatasets.html)
* Video: [Introduction to Simple Linear Regression](https://youtu.be/KsVBBJRb9TE) (~ 8 minutes)
* Video: [The Least Squares Regression Line](https://youtu.be/coQAAN4eY5s)(~ 8 minutes)
* Video: [Interpreting Model Parameters](https://youtu.be/I8Dr1OGUdZQ) (~ 5 minutes)
* Video: [Simple Linear Regression: An Example](https://youtu.be/xIDjj6ZyFuw) (~ 10 minutes)
* Video: [Always Plot Your Data!](https://youtu.be/sfH43temzQY) (~ 6 minutes)
* Video: [Leverage and Influential Points](https://youtu.be/xc_X9GFVuVU) (~ 7 minutes)
* [`moderndive` package documentation](https://cran.r-project.org/web/packages/moderndive/moderndive.pdf) (pp. 7-11)
* [GGPLot Scatter Plot](https://www.datanovia.com/en/lessons/ggplot-scatter-plot/)

### Week 06 (SEP 23)

#### In-Class Engagement

* Scatterplots in `ggplot2`
* Correlation coefficients
* Least squares criterion
* Model fitting with `lm`

#### Integrations (Due SUN @ 11pm)

* DC [Modeling with Data in the Tidyverse](https://www.datacamp.com/courses/modeling-with-data-in-the-tidyverse)
* Modeling with Data in the Tidyverse Feedback Survey

### Week 07 (SEP 30)

#### In-Class Engagement

* Parallel slopes model
* Making predictions
* Influential points

#### Integrations (Due SUN @ 11pm)

* Make sure you are all caught up on material!

<div class="rmdnote">
<ul>
<li>Linear regression is one of the oldest statistical techniques; the name comes from an 1886 article by Francis Galton, &quot;Regression Towards Mediocrity in Hereditary Stature&quot;.</li>
<li>Linear models are the foundation of many other types of statistical methods and have close connections to linear algebra, including manipulations of correlation matrices.</li>
<li>The <code>moderndive</code> package includes many <strong>wrapper functions</strong> to help us extract useful information from the <code>lm</code> function output and format them for analysis and reporting.</li>
</ul>
</div>


***
## Project 2

### Week 08 (OCT 07)

OCT 08 is the halfway point!

#### In-Class Engagement

* Work on Project 2

#### Integrations (Due SUN @ 11pm)

* Project 2 write-up


***
**SECOND HALF OF SCHEDULE TBA**