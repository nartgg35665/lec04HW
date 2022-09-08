class MainController < ApplicationController
  def test
    # redirect_to '/main/test2'
    if(params[:number])
      @number=params[:number].to_i
      @subjectlist=nil
      @scorelist=nil
    else
      @number=0
      @subjectlist=[]
      @scorelist=[]
      i=0
      10.times do |i|
        if(params["subject#{i}"] &&params["score#{i}"])
            @number+=1
            @subjectlist.push(params["subject#{i}"] )
            @scorelist.push(params["score#{i}"])
        end
      end
    end
    if(@subjectlist&&@scorelist&&!(@subjectlist.include?("")||@scorelist.include?("")))
        redirect_to action: 'result' ,subjectlist:@subjectlist,scorelist:@scorelist
    end
  end
  # def check
  #   # puts "cba"
  #   subjectlist=[]
  #   scorelist=[]
  #   nu=params[:number].to_i
  #   nu.times do |i|        
  #     subjectlist.push(params["subject#{i}"])
  #     scorelist.push(params["score#{i}"])
  #   end
  #   if(subjectlist.include?("") || scorelist.include?(""))
  #       redirect_to action: 'test' , subjectlist:subjectlist, scorelist:scorelist,number:nu.to_s
  #   else
  #     redirect_to action: 'result' ,subjectlist:subjectlist,scorelist:scorelist
  #   end
  # end
  def result
      scorelist=params[:scorelist]
      subjectlist=params[:subjectlist]
      @max=scorelist[0].to_i
      @maxSub=subjectlist[0]
      @Total=0
      i=0
      scorelist.each do |score|
        if(score.to_i>@max)
          @max=score.to_i
          @maxSub=subjectlist[i]
        end
        @Total+=score.to_i
        i+=1
      end
  end
  def index
  end
end
