import au.com.ts4impact.madcow.test.site.domain.State

class BootStrap {

    def init = { servletContext ->

        if (!State.count()) {
            createData()
        }

    }
    def destroy = {
    }

    private void createData() {
        
        [1: [ shortName: 'NT',
             longName:  'Northern Territory'],
        2: [ shortName: 'NSW',
             longName:  'New South Wales'],
        3: [ shortName: 'ACT',
             longName:  'Australian Capital Territories'],
        4: [ shortName: 'VIC',
             longName:  'Victoria'],
        5: [ shortName: 'QLD',
             longName:  'Queensland'],
        6: [ shortName: 'SA',
             longName:  'South Australia'],
        7: [ shortName: 'WA',
             longName:  'Western Australia'],
        8: [ shortName: 'TAS',
             longName:  'Tasmania']
        ].each{stateId, dataMap ->
            
            def state = new State(  id: stateId,
                                    shortName: dataMap.shortName,
                                    longName : dataMap.longName).save(flush: true, failOnError:true);
        }

    }
}
