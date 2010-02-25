import org.codehaus.groovy.grails.commons.ApplicationHolder
class BootStrap {

     def init = { servletContext ->
       ApplicationHolder.application.domainClasses.each { dc ->
            dc.clazz.count()
        }
     }
     def destroy = {
     }
  }