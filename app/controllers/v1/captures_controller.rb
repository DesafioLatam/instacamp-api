class V1::CapturesController < ApplicationController
  before_action :set_capture, only: [:show, :update, :destroy]
  before_action :authenticate_with_token!, except: [:index, :show]

  # GET /captures
  # GET /captures.json
  def index
    @captures = Capture.all

    render json: @captures
  end

  # GET /captures/1
  # GET /captures/1.json
  def show
    render json: @capture
  end

  # POST /captures
  # POST /captures.json
  def create
    @capture = Capture.new(capture_params)
    @capture.user = current_user

    if @capture.save
      render json: @capture, status: :created
    else
      render json: @capture.errors, status: :unprocessable_entity
    end
  ensure
    clean_tempfile
  end

  # PATCH/PUT /captures/1
  # PATCH/PUT /captures/1.json
  def update
    @capture = Capture.find(params[:id])

    if @capture.update(capture_params)
      head :no_content
    else
      render json: @capture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /captures/1
  # DELETE /captures/1.json
  def destroy
    @capture.destroy

    head :no_content
  end

  private

    def set_capture
      @capture = Capture.find(params[:id])
    end

    def capture_params
      the_params = params.require(:capture).permit(:comment)
      the_params[:photo] = parse_image_data(params[:image]) if params[:image]
      the_params
    end

    def parse_image_data(image)
      filename = image["filename"]
      in_content_type = image["filetype"]
      string = image["base64"]

      @tempfile = Tempfile.new(filename)
      @tempfile.binmode
      @tempfile.write Base64.decode64(string)
      @tempfile.rewind

      content_type = `file --mime -b #{@tempfile.path}`.split(';')[0]

      extension = content_type.match(/gif|jpg|jpeg|png/).to_s
      filename += ".#{extension}" if extension

      ActionDispatch::Http::UploadedFile.new({
        tempfile: @tempfile,
        content_type: content_type,
        filename: filename
      })
    end

    def clean_tempfile
      if @tempfile
        @tempfile.close
        @tempfile.unlink
      end
    end
end
