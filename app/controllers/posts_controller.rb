class PostsController < ApplicationController
  def index
    @posts = Post.all


    #Preload loads the association data in a separate query, This is how includes loads data in the default case.
    #So you can not use where with post model.
    # @po = User.preload(:posts)
    #SELECT "users".* FROM "users"
    #SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (13, 1)



    #Includes loads the association data in a separate query just like preload. But you can use where with post model performing left outer join
    # @user = User.includes(:posts).where("posts.id=")
    # SELECT "users"."id" AS t0_r0, "users"."name" AS t0_r1, "posts"."id" AS t1_r0, "posts"."title" AS t1_r1, "posts"."user_id" AS t1_r2, "posts"."desc" AS t1_r3
    # FROM "users" LEFT OUTER JOIN "posts" ON "posts"."user_id" = "users"."id" WHERE (posts.desc = "ruby is awesome")
    # binding.pry
  end  
end
