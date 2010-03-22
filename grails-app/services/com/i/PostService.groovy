package com.i
import org.granite.tide.annotations.TideEnabled
class PostException extends RuntimeException
{
	String message
	Post post
}

@TideEnabled
class PostService 
{

    boolean transactional = true

    Post createPost(String userId, String content)
	{
		def user = User.findByUserId(userId)
		if (user)
		{
			def post = new Post(content: content)
			user.addToPosts(post)
			if (user.save())
			{
				return post
			}
			else
			{
				throw new PostException(message: "Invalid or empty post", post: post)
			}
		}
		throw new PostException(message: "Invalid User Id")
	}

    def list()
    {
      Post.list();
    }
	
}
