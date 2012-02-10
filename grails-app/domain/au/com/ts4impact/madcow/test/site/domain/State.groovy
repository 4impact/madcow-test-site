package au.com.ts4impact.madcow.test.site.domain

class State {

    static constraints = {
    }

    String shortName
    String longName

    String toString(){
        return longName;
    }
}
