# Asymmetric-Self-Concept-Change
Supplementary materials for my bachelor's thesis in psychology at the LMU Munich.

In my thesis, I explore the theoretical and methodological
foundations of Brotzeller and Gollwitzer (2025) and conduct a re-implementation
reproduction of study 4 from this article.

The article is concerned with how people change their self-concept when they receive
feedback that differs from their self-perception. More precisely, the authors examine
the effects of features of the discrepant feedback, namely the direction and the size
of the discrepancy, on subsequent self-concept changes.

Explanation of the folder structure:
- `reproduction-study4` contains a Quarto file of a re-implementation reproduction 
(Kohrt et al., 2024) of study 4 from Brotzeller and Gollwitzer (2025). This file was
pre-rendered to HTML and to PDF. It is recommended to chose the HTML-format for better
readability.
- `exploratory-analyses` contains an R script that explores how many participants in
the final smaple from study 4 changed their self-concept into the opposite direction 
than the discrepant feedback they received would have suggested (so-called contradictors).
- `data` contains the anonymized data set from study 4. This data set can be found 
[here](https://osf.io/yadqw/) in the OSF. For privacy reasons, the data set file was added 
to the .gitignore file so that it will not be pushed to remote.
- `report` contains all Latex and additional files that were used to compile the final
paper.
- `figures` is a collection of the figures that the paper contains. These were created
with [draw.io](https://www.drawio.com/).


IMPORTANT: If you plan to run the R scripts from within RStudio, please open RStudio
by double-clicking on the RStudio Project File located at the root directory to ensure
that the working directory is automatically set to the root directory. This ensures that
all paths point to the desired locations. If you want to run the R scripts outside from
RStudio, please set the working directory manually to the root directory.

---
- Brotzeller, F., & Gollwitzer, M. (2025). Exploring Asymmetries in Self-Concept Change After Discrepant Feedback. Personality and Social Psychology Bulletin, 51(9), 1731–1744. https://doi.org/10.1177/01461672241232738
- Kohrt, F., Melinscak, F., McElreath, R., Schönbrodt, F. D. (2024). A conceptual framework for computational reproductions: Formal definitions and epistemic functions. Zenodo. https://doi.org/10.5281/zenodo.10053573