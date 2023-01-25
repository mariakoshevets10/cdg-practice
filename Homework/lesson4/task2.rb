module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def post_id
    print 'Enter post id: '
    @id = gets.to_i
    if @id.negative? 
      puts 'You entered a negative number.Try again '
    elsif @posts.empty? 
      puts 'You don\'t have any posts yet'
    elsif @posts[@id].nil?
      puts "Post #{@id} not found"
    else
      return @id
    end
   end

  def post_text
    print 'Enter the text of the post: '
    @txt = gets.chomp
    if @txt.empty?
      puts "You need the text of the post"
    else 
    @txt
    end
  end

  def index
    if @posts.empty?
      puts 'You don\'t have posts'
    else
      @posts.each.with_index { |post, index| puts "#{index}. #{post}" }
    end
  end

  def show
    post_id
    puts "#{@id}. #{@posts[@id]}"
  end

  def create
    text = post_text
    @posts << text
   puts 'Create new post'
  end

  def update
    id = post_id
    text = post_text
    @posts[id] = text
    puts 'Your post has been changed ', "#{id}. #{@posts[id]}"
  end

  def destroy
    id = post_id
    @posts.delete_at(id)
    puts 'Your post has been deleted'
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init