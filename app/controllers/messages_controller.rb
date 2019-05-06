class MessagesController < ApplicationController
  #アクションが実行される前に、前もって実行するメソッドを指定
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    #モデルMessageより、データを全取得し、インスタンス変数へ格納
    @messages = Message.all
  end

  def show
    #モデルMessageより、idに基づき、データを取得し、インスタンス変数へ格納
  end

  def new
    #新規レコードのためのモデルインスタンスを作成する
    @message = Message.new
    # @message = Message.new(content: 'sample') 
    # → デフォルトでその値が入力された状態となる
  end

  def create
    @message = Message.new(message_params)
    # @messageの保存
    if @message.save 
      flash[:success] = "Messageが正常に投稿されました"
      redirect_to @message
    else
      flash.now[:danger] = "Messageが投稿されませんでした"
      render :new
    end
  end

  def edit
  end

  def update
    set_message
    
    if @message.update(message_params)
      flash[:success] = 'Messageは正常に更新されました'
      redirect_to message_path(@message)
    else
      flash.now[:danger]
      render :edit
    end
  end

  def destroy
    @message.destroy
    
    flash[:success] = 'Mesage は正常に削除されました'
    redirect_to messages_url
  end
  
  private
  
  # Strong Parameter
  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params
    #params.require(:message) → Mesageモデルのフォームから得られるデータ
    #.premit(:content) → Messageモデルのcontentを精査する。
    params.require(:message).permit(:content)
  end
end
