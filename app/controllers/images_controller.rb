class ImagesController < ApplicationController
 
  def new

  end

  def create
    name = params[:upload][:file].original_filename
    directory = "public/images/upload"
    pathname = File.join(directory, name)
    File.open(pathname, "wb") { |f| f.write(params[:upload][:file].read) }
    
    result = `cd tensorflow && python3 /home/ubuntu/workspace/tensorflow/evaluate.py "../#{pathname}"`
    
    render result.to_s
end
end
