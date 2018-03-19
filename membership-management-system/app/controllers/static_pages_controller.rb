class StaticPagesController < ApplicationController
  before_action :has_access?, only:[:adminhome,:report]
  def home
  end

  def help
  end
  
  def adminhome
  end
  
  def report
    
    @classificationlist = Hash.new
    @dynastylist = Hash.new
    
     User.all.each do |user| 
        
        if(!@classificationlist.has_value?(user.classification))
        @classificationlist[user.classification] = user.classification
       end
       
    end
    
    Dynasty.all.each do |dynasty| 
        if(!@dynastylist.has_value?(dynasty.name))
         @dynastylist[dynasty.name] = dynasty.name
       end
    end
    
    if params[:search]

      if params[:classification] && params[:dynasty]
       @users = User.where(:classification => params[:classification],:dynasty => params[:dynasty])
        @numbers = @users.count
         @total = 0
        # @point = {}
        @users.each do |user|
          @s = user.points
         # @point[user.uin] = @s
          @total = @total + @s
          @average = @total/@numbers
        end
         @report = {:Total =>@total, :Average =>@average}  
     elsif params[:classification]
     
        @users = User.where(:classification => params[:classification])
         @numbers = @users.count
         @total = 0
        # @point = {}
        @users.each do |user|
          @s = user.points
         # @point[user.uin] = @s
          @total = @total + @s
          @average = @total/@numbers
        end
         @report = {:Total =>@total, :Average =>@average}  
     elsif params[:dynasty]
        @users = User.where(:dynasty => params[:dynasty])
         @numbers = @users.count
         @total = 0
        # @point = {}
        @users.each do |user|
          @s = user.points
         # @point[user.uin] = @s
          @total = @total + @s
          @average = @total/@numbers
        end
      @report = {:Total =>@total, :Average =>@average}  

    else
     # @point={}
      @users = User.all
        @numbers = @users.count
         @total = 0
        # @point = {}
        @users.each do |user|
          @s = user.points
         # @point[user.uin] = @s
          @total = @total + @s
          @average = @total/@numbers
         end
         
         @report = {:Total =>@total, :Average =>@average}
      end
      
     else
      @users = User.all
        @numbers = @users.count
         @total = 0
        # @point = {}
        @users.each do |user|
          @s = user.points
         # @point[user.uin] = @s
          @total = @total + @s
          @average = @total/@numbers
         end
         
         @report = {:Total =>@total, :Average =>@average}
    end
  end
  
  def about
  end
  
  def contact
  end
  
  private
  
  
    def has_access?
      if (session[:admin_id] == nil)
      flash[:notice] ="You shoud have admin access to view this information"
      redirect_to root_url
      return
      end
    end

end
