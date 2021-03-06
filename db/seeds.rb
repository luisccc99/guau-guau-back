100.times do
    Book.create({
        title:  Faker::Book.title,
        author: Faker::Book.author,
        phrases: Faker::TvShows::GameOfThrones.quote

    })

end