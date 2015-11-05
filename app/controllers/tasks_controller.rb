class TasksController < ApplicationController
    def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.build(task_params)
        if @task.save
            redirect_to list_path(@list)
        end
    end
    
    def destroy
        @list = List.find(params[:list_id])
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to list_path(@list)
    end
    
    def complete
        @list = List.find(params[:list_id])
        @task = Task.find(params[:id])
        if @task.completed? 
            @task.update(completed: false)
        else
            @task.update(completed: true)
        end
        redirect_to list_path(@list)
    end
    
    def update_row_order
        @task = Task.find(task_params[:task_id])
        @task.row_order_position = task_params[:row_order_position]
        @task.save
        render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    
    private
        def task_params
            params.require(:task).permit(:task_id, :item, :row_order_position)
        end
end
