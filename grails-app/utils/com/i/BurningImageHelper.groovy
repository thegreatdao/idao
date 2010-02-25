package com.i

import static org.apache.commons.lang.RandomStringUtils.randomAlphabetic

public class BurningImageHelper
{
  static burnImage =
  {
    def fileInfo, def burningImageService->
    def main = "${fileInfo.baseDir}${fileInfo.id}"
    def thumbnail = "${main}/thumbnail"
    def fileName = randomAlphabetic(16)
    new File(thumbnail).mkdirs()
    burningImageService.loadImage(fileInfo.file)
      .resultDir(main)
      .execute(
        "$fileInfo.id$fileName",
        {it.scaleAccurate(fileInfo.width,fileInfo.height)}
      )
      .resultDir(thumbnail)
      .execute("$fileInfo.id$fileName",{fileName = it.scaleAccurate(fileInfo.thumbnailWidth,fileInfo.thumbnailHeight)})
    fileName
  }
}