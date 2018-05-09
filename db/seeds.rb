# eden = Student.create(first_name: "Eden", username: "edenmesfun", password: "iluvfrida", image: "http://www.easpd.eu/sites/default/files/sites/default/files/team/eden_edit.jpg", github: "www.github.com/eyosef")

# serena = Student.create(first_name: "Serena", username: "sailormoon", password: "moonpower", image: "https://dw9to29mmj727.cloudfront.net/properties/2016/432-SeriesThumbnails_SM__400x320.jpg", github: "www.github.com/sailormoon")

# question_one = Question.create(title: "Why am I not getting a cat's table?", content: "class CreateCats < ActiveRecord::Migration
#   def change
#     create_table :cat do |t|
#       t.string :name
#       t.integer :age
#       t.string :breed
#     end
#   end
# end", link: "https://learn.co/tracks/full-stack-web-development-v5/sinatra/activerecord/activerecord-associations-in-sinatra", lab: "ActiveRecord Associations in Sinatra", student: eden)


# question_two = Question.create(title: "Its not going to the owner/4 once it created the page. How come?", content: "post '/owners' do
#   @owner = Owner.create(params[:owner])
#   redirect 'owners/:id'
# end", link: "https://learn.co/tracks/full-stack-web-development-v5/sinatra/activerecord/sinatra-complex-forms-associations", lab: "Sinatra Complex Forms Associations", student: serena)

# comment_one = Comment.new(content:"change the create_table :cat to create_table :cats, that should help! Also you can rename_table :cat, :cats", vote: 0, student: serena , question: question_one)
# comment_one.save

# comment_two = Comment.new(content:"In sinatra you have to actually add the id using brackets ie: ownder/# {owner.id}", vote: 0, student: eden , question:question_two)

# comment_two.save