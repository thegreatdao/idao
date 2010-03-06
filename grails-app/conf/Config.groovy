import java.awt.Font
import java.awt.Color





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