suppressPackageStartupMessages(library(arkasData))
jsonFile <- system.file("extdata/json", "ns.json", package="arkasData")
appSession <- fetchAppSession(jsonFile) ## autofill APPSESSION in paths
names(appSession$samples) <- appSession$samples ## so column names get set 
appSession$outputPath <- system.file("extdata", "", package="arkasData")



NS <- annotateFeatures(NS)
NS <- with(appSession, mergeKallisto(samples, outputPath=outputPath))

NS <- annotateFeatures(NS)

NS$subject <- factor(substr(colnames(NS), 2, 2))
NS$treatment <- substr(colnames(NS), 1, 1) == "s"
design <- with(as(colData(NS), "data.frame"),
                  model.matrix( ~ treatment + subject ))
rownames(design) <- colnames(NS)
metadata(NS)$design <- design




if (FALSE) { 
  save(NS, file="~/Dropbox/arkasData/data/NS.rda", compress="xz")
}
