suppressPackageStartupMessages(library(artemisData))
jsonFile <- system.file("extdata/json", "ns.json", package="artemisData")
appSession <- fetchAppSession(jsonFile) ## autofill APPSESSION in paths
names(appSession$samples) <- appSession$samples ## so column names get set 
appSession$outputPath <- system.file("extdata", "", package="artemisData")
<<<<<<< HEAD


NS <- annotateFeatures(NS)
NS <- with(appSession, mergeKallisto(samples, outputPath=outputPath))
=======
NS <- with(appSession, mergeKallisto(samples, outputPath=outputPath))

NS <- annotateFeatures(NS)
>>>>>>> 9ef6b6c09fbbcebf2da1cbb3c82e80e53b6454df
NS$subject <- factor(substr(colnames(NS), 2, 2))
NS$treatment <- substr(colnames(NS), 1, 1) == "s"
design <- with(as(colData(NS), "data.frame"),
                  model.matrix( ~ treatment + subject ))
rownames(design) <- colnames(NS)
metadata(NS)$design <- design
<<<<<<< HEAD

if (FALSE) { 
  save(NS, file="~/Dropbox/artemisData/data/NS.rda", compress="xz")
}
=======
>>>>>>> 9ef6b6c09fbbcebf2da1cbb3c82e80e53b6454df

if (FALSE) { 
  save(NS, file="~/Dropbox/artemisData/data/NS.rda", compress="xz")
}
