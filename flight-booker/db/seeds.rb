# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

airport = Airport.create([{ code: 'CLT' }, { code: 'GSO '}, { code: 'LAX' }, {code: 'ATL' }])

Flight.create( date: '02.01.2016', from_id: 1, to_id: 2, duration: 350 )
Flight.create( date: '02.01.2016', from_id: 2, to_id: 1, duration: 350 )
Flight.create( date: '02.02.2016', from_id: 3, to_id: 2, duration: 350 )
Flight.create( date: '02.02.2016', from_id: 4, to_id: 2, duration: 350 )
Flight.create( date: '02.02.2016', from_id: 3, to_id: 2, duration: 350 )
Flight.create( date: '02.03.2016', from_id: 1, to_id: 4, duration: 350 )
Flight.create( date: '02.03.2016', from_id: 2, to_id: 4, duration: 350 )
Flight.create( date: '02.04.2016', from_id: 3, to_id: 1, duration: 350 )
Flight.create( date: '02.04.2016', from_id: 2, to_id: 3, duration: 350 )
Flight.create( date: '02.04.2016', from_id: 1, to_id: 3, duration: 350 )

