class PostsController < ApplicationController
  before_action :set_bulletin # 먼저와야함
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # 이 기능은 필터라고 하며 이전에는 before_filter, after_filter, around_filter로 사용되었지만
  # 레일스 4부터 _filter가 _action으로 변경되었다. 따라서 각각 before_action, after_action, around_action으로 사용된다.

  # GET /posts
  # GET /posts.json
  def index
    @posts = @bulletin.present? ? @bulletin.posts.all : Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = @bulletin.present? ? @bulletin.posts.new : Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @bulletin.present? ? @bulletin.posts.new(post_params) : Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: 'Post was successfully created.' } # [@post.bulletin, @post]는 -> bulletin_post_path(@post.bulletin, @post) 의 축약형
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to (@bulletin.present? ? bulletin_posts_url(@bulletin) : posts_url), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_bulletin
      @bulletin = Bulletin.find(params[:bulletin_id]) if params[:bulletin_id].present?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if @bulletin.present?
        @post = @bulletin.posts.find(params[:id])
      else
        @post = Post.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Strong Parameters 기능 -> 접근 가능 한 속성을 정의해 둔 것
    # White List 지정 하기
    def post_params
      params.require(:post).permit(:title, :content,:picture, :picture_cache)
    end
end
