# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courses = [
    {name: "Shinnecock Hills", par: 70, description: "One of the toughest courses in the US rota... with wind, at least!", pic: "shinnecock.jpg"},
    {name: "Winged Foot", par: 70, description: "A brutal course with long rough and huge elevation changes... good luck breaking par!", pic: "winged_foot.jpg"},
    {name: "Oakmont", par: 70, description: "Absurdly difficult, even by US Open standards. Rough and green are almost unplayable!", pic: "oakmont.jpg"},
    {name: "St. Andrews", par: 72, description: "The oldest course in the world, and almost surely the most overrated! Usually leads to a dull Open with a winner in the mid-teens under par. Road Hole rocks, though!", pic: "st_andrews.jpg"},
    {name: "Augusta National", par: 72, description: "A tradition unlike any other! It's a bit overrated, but it has the best (and fastest) greens in the world, along with some of the most dramatic and scenic holes on the planet. Gotta love it!", pic: "augusta.jpg"},
    {name: "Pine Valley", par: 72, description: "Supposedly the best course in the world, but who the hell knows? No one has ever seen it or played it. Though it was designed by the architect of Augusta National... so it can't be half-bad!", pic: "pine_valley.jpg"}
]

courses.each do |cors|
    Course.create(cors)
end