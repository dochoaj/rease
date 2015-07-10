# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{email: 'coordinacion.rease@gmail.com',password: 'rease2015',name: 'Coordinación',last_name: 'REASE',category: 1, autorization_level: 1}])

Section.create([{title:'Link de interés básicos', order:'Link de Interés', body: '<p style="text-align: center;"><a href="https://es-es.facebook.com/reasechile">Facebook REASE</a></p>

<p style="text-align: center;"><a href="http://www.clayss.org.ar/">CLAYSS</a></p>

<p style="text-align: center;"><a href="https://www.youtube.com/channel/UCfjT6MIfaghMrdw7NCDICcQ" style="background-color: rgb(255, 255, 255);">CLAYSS en youtube</a></p>

<p style="text-align: center;"><a href="http://www.cehd.umn.edu/olpd/people/faculty/Furco.asp" style="background-color: rgb(255, 255, 255);">Creador del A+S</a></p>

<p style="text-align: center;"><a href="http://educacionglobalresearch.net/wp-content/uploads/03-Furco-1-Castellano.pdf" style="background-color: rgb(255, 255, 255);">El aprendizaje-servicio por Andrew Furco</a></p>', priority: 'Alta'}])