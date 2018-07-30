class ContactsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show,:edit,:update]
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    @contact.save
    redirect_to root_path
  end

  def index
    @contacts = Contact.order('id DESC')
  end

  def tsumi
    @contacts = Contact.where(situation: "対応済").order('id DESC')
  end

  def tnaka
    @contacts = Contact.where(situation: "対応中").order('id DESC')
  end

  def tmi
    @contacts = Contact.where(situation: "未対応").order('id DESC')
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to contacts_path
  end

  private
    def contact_params

      params.require(:contact).permit(:category,:message,:situation,:user_id,:addmin_id)

    end
end
