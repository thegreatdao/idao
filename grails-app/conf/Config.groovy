import java.awt.Font
import java.awt.Color
 
import com.octo.captcha.service.multitype.GenericManageableCaptchaService
import com.octo.captcha.engine.GenericCaptchaEngine
import com.octo.captcha.image.gimpy.GimpyFactory
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator
import com.octo.captcha.component.image.backgroundgenerator.GradientBackgroundGenerator
import com.octo.captcha.component.image.color.SingleColorGenerator
import com.octo.captcha.component.image.textpaster.NonLinearTextPaster
 
import com.octo.captcha.service.sound.DefaultManageableSoundCaptchaService
 
grails.commentable.poster.evaluator = { getAuthUserDomain() }
grails.rateable.rater.evaluator = { getAuthUserDomain() }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"
 
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
 
// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.changeme.com"
    }
    development {
        grails.serverURL = "http://localhost:8080/${appName}"
    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}"
    }
 
}
 
// log4j configuration
log4j = {
appenders {
        console name: 'stdout', layout: pattern(conversionPattern: '%d{dd-MM-yyyy HH:mm:ss,SSS} %5p %c{1} - %m%n')
        file name: 'hibeFile', file: 'hibe.log', layout: pattern(conversionPattern: '%d{dd-MM-yyyy HH:mm:ss,SSS} %5p %c{1} - %m%n')
    }
 
    // By default, messages are logged at the error level to both the console and hibe.log
    root {
        error 'stdout', 'hibeFile'
        additivity = true
    }
debug 'org.hibernate.SQL'
}
 
//log4j.logger.org.springframework.security='off,stdout'
 
jcaptchas {
image = new GenericManageableCaptchaService(
new GenericCaptchaEngine(
new GimpyFactory(
new RandomWordGenerator(
"abcdefghijklmnopqrstuvwxyz1234567890"
),
new ComposedWordToImage(
new RandomFontGenerator(
15, // min font size
25, // max font size
[new Font("Arial", 0, 10)] as Font[]
),
new GradientBackgroundGenerator(
120, // width
30, // height
new SingleColorGenerator(Color.black),
new SingleColorGenerator(Color.black)
),
new NonLinearTextPaster(
6, // minimal length of text
6, // maximal length of text
Color.white
)
)
)
),
180, // minGuarantedStorageDelayInSeconds
180000 // maxCaptchaStoreSize
)
 
// Uncomment this to enable the sound captcha, you must install FreeTTS for it to work though.
//sound = new DefaultManageableSoundCaptchaService()
}
 
//i-dao related settings
post.main.folder='C:/uploadedImg/post/'
user.main.folder='C:/uploadedImg/user/'
image.watermark.path='c:/uploadedImg/watermark.png'
iching.default.image='C:/uploadedImg/default/i.png'
post.image.default.width=200
post.image.default.height=200
user.image.default.width=100
user.image.default.height=100
post.thumbnail.default.width=120
post.thumbnail.default.height=120
user.thumbnail.default.width=30
user.thumbnail.default.height=30