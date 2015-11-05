class ListsController < ApplicationController
    before_action :set_list, except: [:index, :new, :create]
    
    def index
        @lists = List.all
    end
    
    def new
        @list = List.new
    end
    
    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to root_path
        end
    end
    
    def show
        #instead of @list.tasks.each in controller used:
        @tasks = @list.tasks.rank(:row_order).all
    end
    
    def edit
    end
    
    def update
        @list.update(list_params)
        @list.save
        redirect_to root_path
    end
    
    def destroy
        @list.destroy
        redirect_to root_path
    end
    
    private
        
        def list_params
            params.require(:list).permit(:name)
        end
    
        def set_list
            @list = List.find(params[:id])
        end
end
